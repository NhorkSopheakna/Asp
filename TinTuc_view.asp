<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.CodePage = 65001
Response.CharSet  = "UTF-8"

Dim conn, rs, sql
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb") & ";"

' ✅ Select from the correct table
' If you want to show the category name, join with danhmuc
sql = "SELECT tintuc.*, danhmuc.dm_ten FROM tintuc INNER JOIN danhmuc ON tintuc.dm_ma = danhmuc.dm_ma"
Set rs = conn.Execute(sql)
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tất cả tin tức</title>
</head>
<body>
    <h1 style='text-align: center;'>Danh sách tin tức</h1>
    <table style="text-align: center; border: 1px solid black; width: 100%; border-collapse: collapse;">
        <tr>
            <th>Mã</th>
            <th>Tiêu đề</th>
            <th>Ảnh</th>
            <th>Danh mục</th>
            <th>Trạng thái</th>
            <th>Chi tiết</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>

        <% 
        Do Until rs.EOF 
        %>
        <tr>
            <td><%= rs("tt_ma") %></td>
            <td><%= rs("tt_tieude") %></td>
            <td><img style="width:150px;" src="/images/<%= rs("tt_anh") %>"></td>
            <td><%= rs("dm_ten") %></td>
            <td><%= rs("tt_trangthai") %></td>
            <td><a href="TinTuc_view_detail.asp?tt_ma=<%= rs("tt_ma") %>">Chi tiết</a></td>
            <td><a href="TinTuc_edit.asp?tt_ma=<%= rs("tt_ma") %>">Sửa</a></td>
            <td><a href="TinTuc_softdelete_action.asp?tt_ma=<%= rs("tt_ma") %>">Xóa</a></td>
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

    <div style="text-align:center; margin-top:20px;">
        <a href="TinTuc_add.asp">➕ Thêm tin tức</a>
    </div>
</body>
</html>
