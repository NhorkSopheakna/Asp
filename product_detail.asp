<!--#include file="dbconnect.asp"-->
<html>
<head>
<title>Product Details</title>

<style>

/* RESET */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

/* HEADER */
.header {
    width: 100%;
    padding: 18px 0;
    background: black;
    color: white;
    text-align: center;
    font-size: 26px;
    font-weight: bold;
}

/* PRODUCT CARD PAGE */
.detail-container {
    max-width: 850px;
    margin: 35px auto;
    background: white;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.15);
    display: flex;
    gap: 25px;
}

/* IMAGE */
.detail-image {
    width: 350px;
    height: 350px;
    object-fit: cover;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.18);
}

/* TEXT */
.detail-info {
    flex: 1;
}

.detail-title {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 10px;
}

.detail-price {
    font-size: 22px;
    color: #e60023;
    font-weight: bold;
    margin: 10px 0 20px 0;
}

.detail-label {
    font-weight: bold;
    font-size: 16px;
    margin-top: 12px;
}

/* BUTTON */
.back-btn {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 20px;
    background: black;
    color: white;
    text-decoration: none;
    border-radius: 10px;
    transition: 0.2s ease;
    font-size: 16px;
}

.back-btn:hover {
    background: #444;
}

</style>
</head>

<body>

<!-- HEADER -->
<div class="header">LAN Shoe Store</div>

<%
Dim id
id = Request.QueryString("id")

Dim rs
Set rs = conn.Execute("SELECT * FROM Products WHERE ProductID=" & id)
%>

<!-- PRODUCT DETAIL CARD -->
<div class="detail-container">

    <!-- LEFT: IMAGE -->
    <img src="images/<%= rs("Image") %>" class="detail-image">

    <!-- RIGHT: INFO -->
    <div class="detail-info">
        
        <div class="detail-title"><%= rs("ProductName") %></div>

        <div class="detail-price"><%= rs("Price") %> VND</div>

        <div class="detail-label">Brand:</div>
        <div><%= rs("BrandID") %></div>

        <div class="detail-label">Color:</div>
        <div><%= rs("ColorID") %></div>

        <a class="back-btn" href="lan_home.asp">← Back to Home</a>

    </div>

</div>

</body>
</html>


