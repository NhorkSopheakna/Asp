<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"

    Dim conn, rs, sql
    Set conn = Server.CreateObject("ADODB.Connection")

    ' ✅ Kết nối đến file Access
   Set conn = Server.CreateObject("ADODB.Connection")
   conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb")

    sql = "SELECT * FROM danhmuc"
    Set rs = conn.Execute(sql)
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #fafafa; }
    </style>
</head>
<body>
   <h2>Danh sách Danh mục</h2>
<table border="1" cellspacing="0" cellpadding="5">
    <tr>
        <th>Mã</th>
        <th>Tên</th>
        <th>Ảnh</th>
        <th>Nổi bật</th>
        <th>Thứ tự</th>
        <th>Parent</th>
        <th>Trạng thái</th>
    </tr>

<%
Do Until rs.EOF
%>
    <tr>
        <td><%= rs("dm_ma") %></td>
        <td><%= rs("dm_ten") %></td>
        <td>
            <img src="images/<%= rs("dm_anh") %>" width="80" height="80" alt="<%= rs("dm_ten") %>">
        </td>
        <td>
            <% If rs("dm_hot") = True Then %>
                Nổi bật
            <% Else %>
                Bình thường
            <% End If %>
        </td>
        <td><%= rs("dm_thutu") %></td>
        <td><%= rs("dm_parent") %></td>
        <td>
            <% If rs("dm_trangthai") = 1 Then %>
                Hiển thị
            <% Else %>
                Ẩn
            <% End If %>
        </td>
    </tr>
<%
    rs.MoveNext
Loop
%>
</table>

  
</body>
</html>

<%
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
%>
