<%@ Language="VBScript" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Result</title>
</head>
<body>
    <h3>Thông tin bạn đã nhập:</h3>
    <ul>
        <li><b>Delivery Option:</b> <%= Request.Form("deliveryOption") %></li>

        <h4>Billing Address</h4>
        <li><b>Name:</b> <%= Request.Form("billFirstName") & " " & Request.Form("billLastName") %></li>
        <li><b>Company:</b> <%= Request.Form("billCompany") %></li>
        <li><b>Address:</b> <%= Request.Form("billAddress1") & " " & Request.Form("billAddress2") %></li>
        <li><b>City:</b> <%= Request.Form("billCity") %></li>
        <li><b>State:</b> <%= Request.Form("billState") %></li>
        <li><b>Zip:</b> <%= Request.Form("billZip") %></li>
        <li><b>Phone:</b> <%= Request.Form("billPhone") %> Ext: <%= Request.Form("billExt") %></li>

        <h4>Delivery Address</h4>
        <li><b>Use Billing:</b> <%= Request.Form("useBilling") %></li>
        <li><b>Name:</b> <%= Request.Form("delFirstName") & " " & Request.Form("delLastName") %></li>
        <li><b>Company:</b> <%= Request.Form("delCompany") %></li>
        <li><b>Address:</b> <%= Request.Form("delAddress1") & " " & Request.Form("delAddress2") %></li>
        <li><b>City:</b> <%= Request.Form("delCity") %></li>
        <li><b>State:</b> <%= Request.Form("delState") %></li>
        <li><b>Zip:</b> <%= Request.Form("delZip") %></li>
        <li><b>Phone:</b> <%= Request.Form("delPhone") %> Ext: <%= Request.Form("delExt") %></li>

        <h4>Email</h4>
        <li><b>Email:</b> <%= Request.Form("email") %></li>
        <li><b>Retype Email:</b> <%= Request.Form("reEmail") %></li>
        <li><b>Receive News:</b> <%= Request.Form("receiveNews") %></li>

        <h4>Register</h4>
        <li><b>Username:</b> <%= Request.Form("username") %></li>
        <li><b>Password:</b> <%= Request.Form("password") %></li>
        <li><b>Retype Password:</b> <%= Request.Form("rePassword") %></li>
        <li><b>Password Reminder:</b> <%= Request.Form("reminder") %></li>
        <li><b>Answer:</b> <%= Request.Form("answer") %></li>
        <li><b>Remember Me:</b> <%= Request.Form("rememberMe") %></li>

        <h4>Optional</h4>
        <li><b>Staples Number:</b> <%= Request.Form("staplesNumber") %></li>
        <li><b>Address Type:</b> <%= Request.Form("addressType") %></li>
        <li><b>Company Type:</b> <%= Request.Form("companyType") %></li>
        <li><b>Number of Employees:</b> <%= Request.Form("numEmployees") %></li>
    </ul>
</body>
</html>
