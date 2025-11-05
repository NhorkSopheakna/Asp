<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
    Response.CodePage = 65001
    Response.CharSet  = "UTF-8"

    Dim conn, rs, sql
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb") & ";"

    sql = "SELECT * FROM danhmuc"
    Set rs = conn.Execute(sql)
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách Danh mục</title>
<style>
    :root{
        --primary:#0077cc;
        --primary-dark:#005fa3;
        --bg:#f4f6f8;
        --table-bg:#fff;
        --text:#333;
    }
    body{
        font-family: "Segoe UI", Arial, sans-serif;
        background:var(--bg);
        margin:0;
        padding:30px;
        color:var(--text);
    }
    h2{ text-align:center; margin-bottom:20px; }
    .toolbar{
        display:flex;
        justify-content:space-between;
        align-items:center;
        max-width:1100px;
        margin:0 auto 20px;
    }
    .btn{
        padding:10px 18px;
        background:var(--primary);
        color:#fff;
        text-decoration:none;
        border-radius:6px;
        transition:0.2s;
        font-weight:600;
    }
    .btn:hover{ background:var(--primary-dark); }
    table{
        width:100%;
        max-width:1100px;
        margin:0 auto;
        border-collapse:collapse;
        background:var(--table-bg);
        box-shadow:0 2px 6px rgba(0,0,0,0.08);
        border-radius:8px;
        overflow:hidden;
    }
    th, td{
        padding:12px 10px;
        text-align:center;
    }
    th{
        background:var(--primary);
        color:#fff;
        font-weight:600;
        letter-spacing:0.5px;
    }
    tr:nth-child(even){ background:#f9fbfc; }
    img{
        width:70px; height:70px;
        object-fit:cover;
        border-radius:6px;
        box-shadow:0 1px 3px rgba(0,0,0,0.2);
    }
    .action a{
        padding:6px 10px;
        margin:0 2px;
        border-radius:4px;
        text-decoration:none;
        font-size:14px;
        color:#fff;
    }
    .edit{ background:#4CAF50; }
    .edit:hover{ background:#3e9443; }
    .delete{ background:#f44336; }
    .delete:hover{ background:#d7372b; }
</style>
</head>
<body>
    <h2>📂 Danh sách Danh mục</h2>
    <div class="toolbar">
        <div></div>
        <a href="danhmuc_add.asp" class="btn">+ Thêm Danh mục</a>
    </div>

    <table>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Ảnh</th>
            <th>Nổi bật</th>
            <th>Thứ tự</th>
            <th>Parent</th>
            <th>Trạng thái</th>
            <th>Thao tác</th>
        </tr>
        <%
        Do Until rs.EOF
            Dim hotText, tt
            If rs("dm_hot") = True Or rs("dm_hot") = 1 Then
                hotText = "🔥 Nổi bật"
            Else
                hotText = "Bình thường"
            End If
            If rs("dm_trangthai") = 1 Then
                tt = "Hiển thị"
            Else
                tt = "Ẩn"
            End If
        %>
        <tr>
            <td><%=rs("dm_ma")%></td>
            <td><%=rs("dm_ten")%></td>
            <td><img src="images/<%=rs("dm_anh")%>" alt="<%=rs("dm_ten")%>"></td>
            <td><%=hotText%></td>
            <td><%=rs("dm_thutu")%></td>
            <td><%=rs("dm_parent")%></td>
            <td><%=tt%></td>
            <td class="action">
                <a href="danhmuc_edit.asp?id=<%=rs("dm_ma")%>" class="edit">Sửa</a>
                <a href="danhmuc_delete.asp?id=<%=rs("dm_ma")%>"
                   class="delete"
                   onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
            </td>
        </tr>
        <%
            rs.MoveNext
        Loop
        rs.Close : Set rs = Nothing
        conn.Close : Set conn = Nothing
        %>
    </table>
</body>
</html>
