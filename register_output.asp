<%@ Language="VBScript" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Result</title>
</head>
<body>
    <h3>Thông tin bạn đã nhập:</h3>
    <ul>
        <li><b>Email:</b> <%= Request.Form("email") %></li>
        <li><b>Display Name:</b> <%= Request.Form("displayName") %></li>
        <li><b>Password:</b> <%= Request.Form("password") %></li>
        <li><b>Confirm Password:</b> <%= Request.Form("confirmPassword") %></li>
        <li><b>ICQ:</b> <%= Request.Form("icq") %></li>
        <li><b>AIM:</b> <%= Request.Form("aim") %></li>
        <li><b>Website:</b> <%= Request.Form("website") %></li>
        <li><b>Location:</b> <%= Request.Form("location") %></li>
        <li><b>Occupation:</b> <%= Request.Form("occupation") %></li>
        <li><b>Newsletter:</b> <%= Request.Form("newsletter") %></li>
        <li><b>Notify Replies:</b> <%= Request.Form("notify") %></li>
        <li><b>Attach Signature:</b> <%= Request.Form("signature") %></li>
        <li><b>Allow HTML:</b> <%= Request.Form("html") %></li>
        <li><b>Language:</b> <%= Request.Form("language") %></li>
        <li><b>Style:</b> <%= Request.Form("style") %></li>
        <li><b>Time Zone:</b> <%= Request.Form("timezone") %></li>
        <li><b>Security Question:</b> <%= Request.Form("securityQ") %></li>
        <li><b>Security Answer:</b> <%= Request.Form("securityA") %></li>
    </ul>
</body>
</html>
