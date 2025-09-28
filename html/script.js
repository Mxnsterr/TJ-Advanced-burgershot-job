let menuItems = [];
let allowSelfOrder = false;
let cart = [];

$(function () {
    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        if (item.type === "updateBalance") {
            updateBalance(item.balance);
        }
        if (item.type === "updateItems") {
            menuItems = item.items;
            displayItems();
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://tj_burgershot/exit', JSON.stringify({}));
            display(false);
            return
        }
    };
    $("#close").click(function () {
        $.post('https://tj_burgershot/exit', JSON.stringify({}));
        display(false);
        return
    })
})

function display(bool) {
    if (bool) {
        $(".container").show();
    } else {
        $(".container").hide();
        document.getElementById('checkoutModal').style.display = 'none';
    }
}

function displayItems() {
    const menuContainer = document.getElementById('menuItems');
    const checkoutBtn = document.querySelector('.checkout-btn');

    menuContainer.innerHTML = '';

    if (checkoutBtn) {
        checkoutBtn.style.display = allowSelfOrder ? 'block' : 'none';
    }

    menuItems.forEach(item => {
        let itemElement;
        if (!allowSelfOrder) {
            itemElement = `
                <div class="menu-item">
                    <div class="item-image"><img src="${item.image}" alt="${item.label}"></div>
                    <div class="item-name">${item.label}</div>
                    <div class="item-description">${item.description}</div>
                    <div class="item-price">$${item.price}</div>
                </div>
            `;
        }
        else {
            itemElement = `
                <div class="menu-item">
                    <div class="item-image"><img src="${item.image}" alt="${item.label}"></div>
                    <div class="item-name">${item.label}</div>
                    <div class="item-description">${item.description}</div>
                    <div class="item-price">$${item.price}</div>
                    <button class="btn" onclick="addToCart('${item.item}', '${item.label}', ${item.price})">Add to cart</button>
                </div>
            `;
        }
        menuContainer.innerHTML += itemElement;
    });
}

function updateBalance(balance) {
    document.getElementById('playerBalance').textContent = '$' + balance;
}

function removeFromCart(index) {
    const removedItem = cart[index];
    cart.splice(index, 1);
    showNotification(`${removedItem.name} has been removed from order`, 'info');
    openCheckout();
}

function openCheckout() {
    let total = 0;
    let itemList = cart.map((item, index) => {
        total += item.price;
        return `
            <div class="order-item">
                <span>${item.name}: $${item.price}</span>
                <button class="btn btn-remove" onclick="removeFromCart(${index})">Remove</button>
            </div>
        `;
    }).join('');

    const modalContent = `
        <h2>Overzicht</h2>
        <div class="order-items">
            ${cart.length > 0 ? itemList : '<div class="empty-cart">Your order is empty</div>'}
        </div>
        <h3>Total: $${total}</h3>
        <div class="payment-options">
            <div class="payment-option">
                <input type="radio" id="card" name="payment" value="card">
                <label for="card">Kaart</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="cash" name="payment" value="cash">
                <label for="cash">Cash</label>
            </div>
        </div>
        <div class="player-id-input">
            <label for="playerId">ID:</label>
            <input type="number" id="playerId" name="playerId" min="1" placeholder="1" oninput="if(this.value < 1) this.value = '';">
        </div>
        ${cart.length > 0 ? '<button class="btn" onclick="placeOrder()">PLACE ORDER</button>' : ''}
    `;

    document.querySelector('.modal-content').innerHTML = modalContent;
    document.getElementById('checkoutModal').style.display = 'block';
}

function showNotification(message, type = 'info') {
    const notifications = document.getElementById('notifications');
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;

    notifications.appendChild(notification);
    notification.offsetHeight;
    notification.classList.add('show');
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            notifications.removeChild(notification);
        }, 300);
    }, 3000);
}

window.addEventListener('message', function (event) {
    if (event.data.type === "showNotification") {
        showNotification(event.data.message, event.data.notificationType);
    }
});

function placeOrder() {
    const selectedPayment = document.querySelector('input[name="payment"]:checked');
    const playerIdInput = document.getElementById('playerId');
    const targetId = parseInt(playerIdInput.value);
    
    if (!selectedPayment) {
        showNotification('Please choose the way of payment', 'error');
        return;
    }
    
    if (!targetId || targetId < 1) {
        showNotification('Please enter a valid player ID (minimum 1)', 'error');
        return;
    }
    
    let paymentMethod = selectedPayment.value;
    if (cart.length === 0) {
        showNotification('Your order is empty', 'error');
        return;
    }
    
    $.post('https://tj_burgershot/createOrder', JSON.stringify({
        items: cart,
        paymentMethod: paymentMethod,
        targetId: targetId
    }), function (response) {
        if (response === 'ok') {
            showNotification('Order sent, waiting for confirmation...', 'success');
            cart = [];
        } else {
            showNotification('Error while sending order', 'error');
        }
    });
    document.getElementById('checkoutModal').style.display = 'none';
}

function addToCart(itemId, itemName, itemPrice) {
    cart.push({ id: itemId, name: itemName, price: itemPrice });
    showNotification(`${itemName} added to order`, 'success');
}

window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.type === "openMenu") {
        menuItems = item.items;
        allowSelfOrder = item.allowSelfOrder;
        displayItems();
        display(true);
    } else if (item.type === "closeMenu") {
        display(false);
    }
});

function closeMenu() {
    $.post('https://tj_burgershot/exit', JSON.stringify({}));
    display(false);
}

function closeCheckout() {
    document.getElementById('checkoutModal').style.display = 'none';
}