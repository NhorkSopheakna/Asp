<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.CodePage = 65001
Response.CharSet  = "UTF-8"

Dim conn, rs, sql
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb") & ";"

' ✅ Query correct table
sql = "SELECT tintuc.*, danhmuc.dm_ten FROM tintuc INNER JOIN danhmuc ON tintuc.dm_ma = danhmuc.dm_ma"
Set rs = conn.Execute(sql)
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách tin tức</title>
</head>
<body>
<h1 style='text-align:center;'>Danh sách tin tức</h1>
<table border="1" style="width:100%; text-align:center; border-collapse:collapse;">
    <tr>
        <th>Mã</th>
        <th>Tiêu đề</th>
        <th>Trích dẫn</th>
        <th>Nội dung</th>
        <th>Ảnh</th>
        <th>Ngày</th>
        <th>Ngày tạo</th>
        <th>Ngày sửa</th>
        <th>Số đếm</th>
        <th>Danh mục</th>
        <th>Trạng thái</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
<%
Do Until rs.EOF
%>
    <tr>
        <td><%= rs("tt_ma") %></td>
        <td><%= rs("tt_tieude") %></td>
        <td><%= rs("tt_trichdan") %></td>
        <td><%= rs("tt_noidung") %></td>
        <td><img src="/images/<%= rs("tt_anh") %>" width="120"></td>
        <td><%= rs("tt_ngay") %></td>
        <td><%= rs("tt_ngaytao") %></td>
        <td><%= rs("tt_ngaysua") %></td>
        <td><%= rs("tt_sodem") %></td>
        <td><%= rs("dm_ten") %></td>
        <td><%= rs("tt_trangthai") %></td>
        <td><a href="TinTuc_edit.asp?tt_ma=<%= rs("tt_ma") %>">Sửa</a></td>
        <td><a href="TinTuc_delete.asp?tt_ma=<%= rs("tt_ma") %>">Xóa</a></td>
    </tr>
<%
    rs.MoveNext
Loop
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
</table>
</body>
</html>
