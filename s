<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Sports Shop</title>
<style>
body {margin:0;font-family:Arial;background:#0f172a;color:white}
header {display:flex;justify-content:space-between;padding:15px;background:#1e293b}
nav a {color:white;margin:0 10px;text-decoration:none}
.products {display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:20px;padding:20px}
.card {background:#1e293b;padding:15px;border-radius:15px;transition:0.3s}
.card:hover {transform:scale(1.05)}
button {background:#22c55e;border:none;padding:10px;color:white;border-radius:10px;cursor:pointer}
.cart {position:fixed;right:0;top:0;width:300px;height:100%;background:#020617;padding:20px;overflow:auto}
.hidden {display:none}
input {padding:10px;margin:5px;width:90%}
.login {display:flex;flex-direction:column;align-items:center;margin-top:50px}
</style>
</head>
<body>

<header>
<h2>Sports Shop</h2>
<nav>
<a href="#" onclick="showShop()">Shop</a>
<a href="#" onclick="showCart()">Cart (<span id="cartCount">0</span>)</a>
<a href="#" onclick="showLogin()">Login</a>
</nav>
</header>

<div id="loginPage" class="login">
<h2>Login</h2>
<input type="text" placeholder="Username">
<input type="password" placeholder="Password">
<button onclick="login()">Login</button>
</div>

<div id="shopPage" class="products hidden">
<div class="card">
<h3>Football</h3>
<p>₹800</p>
<button onclick="addToCart('Football',800)">Add</button>
</div>
<div class="card">
<h3>Cricket Bat</h3>
<p>₹1500</p>
<button onclick="addToCart('Bat',1500)">Add</button>
</div>
<div class="card">
<h3>Tennis Racket</h3>
<p>₹2000</p>
<button onclick="addToCart('Racket',2000)">Add</button>
</div>
</div>

<div id="cartPage" class="cart hidden">
<h2>Cart</h2>
<ul id="cartItems"></ul>
<p>Total: ₹<span id="total">0</span></p>
<button onclick="checkout()">Checkout</button>
</div>

<script>
let cart=[];
function showShop(){toggle('shopPage')}
function showCart(){toggle('cartPage')}
function showLogin(){toggle('loginPage')}
function toggle(page){
document.getElementById('loginPage').classList.add('hidden');
document.getElementById('shopPage').classList.add('hidden');
document.getElementById('cartPage').classList.add('hidden');
document.getElementById(page).classList.remove('hidden');
}

function login(){
alert('Login Successful');
showShop();
}

function addToCart(name,price){
cart.push({name,price});
updateCart();
}

function updateCart(){
let list=document.getElementById('cartItems');
list.innerHTML='';
let total=0;
cart.forEach(item=>{
let li=document.createElement('li');
li.textContent=item.name+' - ₹'+item.price;
list.appendChild(li);
total+=item.price;
});
document.getElementById('total').innerText=total;
document.getElementById('cartCount').innerText=cart.length;
}

function checkout(){
alert('Order placed!');
cart=[];
updateCart();
}
</script>

</body>
</html>
