<%@ Language="VBScript" %>
<html>
<head>
    <title>Technology Discussion Forum Registration</title>
    <style>
        body { font-family: Arial; background-color: #f8f8f8; }
        table { background: #f2f2e6; padding: 20px; border: 1px solid #ccc; }
        td { padding: 5px; vertical-align: top; }
        .title { font-weight: bold; color: brown; }
    </style>
</head>
<body>

<%
If Request.Form("Submit") <> "" Then
    ' Show user input
    Response.Write "<h2>Thông tin bạn vừa nhập:</h2>"
    For Each item In Request.Form
        If item <> "Submit" Then
            Response.Write "<b>" & item & ":</b> " & Request.Form(item) & "<br>"
        End If
    Next
Else
%>



<form method="post" action="register.asp">
<table>
    <h2><td colspan="2" class="title">Technology Discussion Forum Registration</td></tr></h2>
    <tr><td colspan="2" class="title">Registration Information</td></tr>
    <tr><td>E-Mail Address :</td><td><input type="text" name="email" value="mymail@mail.com" /></td></tr>
    <tr><td>Display Name :</td><td><input type="text" name="displayname" value="yourBoardName" /></td></tr>
    <tr><td>Password :</td><td><input type="password" name="password" /></td></tr>
    <tr><td>Confirm Password :</td><td><input type="password" name="confirmpassword" /></td></tr>

    <tr><td colspan="2" class="title">Profile Information</td></tr>
    <tr><td>ICQ Number :</td><td><input type="text" name="icq" value="123456789" /></td></tr>
    <tr><td>AIM Number :</td><td><input type="text" name="aim" /></td></tr>
    <tr><td>Website :</td><td><input type="text" name="website" /></td></tr>
    <tr><td>Location :</td><td><input type="text" name="location" /></td></tr>
    <tr><td>Occupation :</td><td><input type="text" name="occupation" /></td></tr>

    <tr><td colspan="2" class="title">Preferences</td></tr>
    <tr><td>Newsletter :</td>
        <td><input type="checkbox" name="newsletter" value="Yes" checked /> Like to receive a regular Newsletters</td>
    </tr>
    <tr><td>Always notify me of replies :</td>
        <td><input type="radio" name="notify" value="Yes" /> Yes
            <input type="radio" name="notify" value="No" checked /> No</td>
    </tr>
    <tr><td>Always attach my signature :</td>
        <td><input type="radio" name="signature" value="Yes" /> Yes
            <input type="radio" name="signature" value="No" checked /> No</td>
    </tr>
    <tr><td>Always allow HTML :</td>
        <td><input type="radio" name="html" value="Yes" checked /> Yes
            <input type="radio" name="html" value="No" /> No</td>
    </tr>
    <tr><td>Board Language :</td>
        <td><select name="language">
            <option>English</option>
            <option>Vietnamese</option>
            <option>French</option>
        </select></td>
    </tr>
    <tr><td>Board Style :</td>
        <td><select name="style">
            <option>digestTheme</option>
            <option>classicTheme</option>
        </select></td>
    </tr>
    <tr><td>Time Zone :</td>
        <td><select name="timezone">
            <option>GMT+1</option>
            <option>GMT+7</option>
            <option>GMT+9</option>
        </select></td>
    </tr>

    <tr><td colspan="2" class="title">Security Control Panel</td></tr>
    <tr><td>Security Question :</td><td><input type="text" name="secquestion" value="My security question" /></td></tr>
    <tr><td>Security Answer :</td><td><input type="text" name="secanswer" value="answer" /></td></tr>

    <tr>
        <td></td>
        <td>
            <input type="submit" name="Submit" value="Submit" />
            <input type="reset" value="Reset" />
        </td>
    </tr>
</table>
</form>

<% End If %>

</body>
</html>
