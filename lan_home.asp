<!--#include file="dbconnect.asp"-->
<html>
<head>
<title>Lan Shoe Shop</title>
<style>
body { 
    font-family: Arial; 
    margin: 0; 
    padding: 0; 
    background: #f7f7f7;
}
.header { 
    background: #333; 
    color: white; 
    padding: 18px; 
    text-align: center; 
    font-size: 22px;
}
.container { 
    width: 95%; 
    margin: auto; 
    margin-top: 20px; 
}
.table-layout { 
    width: 100%; 
    border-collapse: collapse; 
}
.table-layout td { 
    padding: 15px; 
    vertical-align: top; 
    background: #fff;
    border-radius: 8px;
}
.product-card { 
    margin-bottom: 20px; 
    border: 1px solid #ddd; 
    padding: 12px; 
    border-radius: 10px; 
    background: white;
    transition: 0.2s;
}
.product-card:hover {
    transform: scale(1.02);
    border-color: #999;
}
.product-card img { 
    width: 140px; 
    height: 140px; 
    object-fit: cover; 
    border-radius: 6px;
}
.color-item {
    background: #eee;
    padding: 8px 10px;
    margin: 5px 0;
    border-radius: 6px;
    display: block;
    text-decoration: none;
    color: #333;
    font-weight: bold;
    transition: 0.2s;
}
.color-item:hover {
    background: #ccc;
}
.ad { 
    text-align: center; 
    margin-top: 20px; 
}
.ad img {
    width: 350px;
    border-radius: 8px;
}
</style>
</head>

<body>

<div class="header">
    Lan's Shoe Shop
</div>

<div class="container">

<table class="table-layout">
    <tr>
        <td colspan="2" style="text-align:center;"><h3>Product List</h3></td>
        <td style="text-align:center;"><h3>Filter by Color</h3></td>
    </tr>

    <tr>
        <!-- PRODUCT LIST SECTION -->
        <td colspan="2">
            <%
                Dim sql, selectedColor
                selectedColor = Request.QueryString("color")

                If selectedColor <> "" Then
                    sql = "SELECT * FROM Products WHERE ColorID=" & selectedColor
                Else
                    sql = "SELECT * FROM Products"
                End If

                Dim rsProducts
                Set rsProducts = conn.Execute(sql)

                Do While Not rsProducts.EOF
            %>
                <div class="product-card">
                    <img src="images/<%= rsProducts("Image") %>">
                    <p><b><%= rsProducts("ProductName") %></b></p>
                    <p>Price: <%= rsProducts("Price") %> VND</p>
                    <a href="product_detail.asp?id=<%= rsProducts("ProductID") %>">View Details</a>
                </div>
            <%
                    rsProducts.MoveNext
                Loop
                rsProducts.Close
            %>
        </td>

        <!-- COLOR LIST SECTION -->
        <td>
            <%
                Dim rsColors
                Set rsColors = conn.Execute("SELECT * FROM Colors")

                Do While Not rsColors.EOF
            %>
                <a class="color-item" href="lan_home.asp?color=<%= rsColors("ColorID") %>">
                    <%= rsColors("ColorName") %>
                </a>
            <%
                    rsColors.MoveNext
                Loop
                rsColors.Close
            %>

            <!-- Reset filter -->
            <br>
            <a class="color-item" style="background:#ffd9d9;" href="lan_home.asp">Show All</a>

        </td>
    </tr>

    <!-- Advertisement -->
    <tr>
        <td colspan="3" class="ad">
            <img src="images/ads.jpg">
            <p>Advertisement</p>
        </td>
    </tr>

</table>

</div>

</body>
</html>

