<!-- #include file="Connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<%

sql = "SELECT * FROM TinTuc WHERE tt_ma=" & Request.QueryString("tt_ma")
rs.Open sql, conn

if not rs.eof then
    tieude = rs("tt_tieude")
    trichdan = rs("tt_trichdan")
    noidung = rs("tt_noidung")
    anh = rs("tt_anh")
    ngaydang = rs("tt_ngay")
    ngaytao = rs("tt_ngaytao")
    ngaysua = rs("tt_ngaysua")
    sodem = rs("tt_sodem")
    danhmuc = rs("dm_ten")
    trangthai = rs("tt_trangthai")
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SỬA</title>
</head>
<body>
        <h1 style='text-align: center;'>SỬA TIN TỨC</h1>
        <form method="POST" action="TinTuc_edit_action.asp?tt_ma=<%=rs("tt_ma")%>">
        <table>
            <tr>
                <td>Tiêu đề</td>
                <td><input type="text" name="txtTTTieuDe" value="<%=tieude%>"></td>
            </tr>
            <tr>
                <td>Trích dẫn</td>
                <td><input type="text" name="txtTTTrichDan" value="<%=trichdan%>"></td>
            </tr>
            <tr>
                <td>Nội dung</td>
                <td><input type="text" name="txtTTNoiDung" value="<%=noidung%>"></td>
            </tr>
            <tr>
                <td>Ảnh</td>
                <td><input type="text" name="txtTTAnh" value="<%=anh%>"></td>
            </tr>
            <tr>
                <td>Ngày</td>
                <td><input type="date" name="txtTTNgay" value="<%=ngay%>"></td>
            </tr>
            <tr>
                <td>Số đếm</td>
                <td><input type="number" name="txtTTSOdem" value="<%=sodem%>"></td>
            </tr>
            <tr>
                <td>Danh mục</td>
                <td><input type="text" name="txtTTDanhMuc" value="<%=danhmuc%>"></td>
            </tr>
            <tr>
                <td>Trạng thái</td>
                <td><input type="number" name="txtTTTrangThai" value="<%=trangthai%>"></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
                <td><input type="reset"></td>
            </tr>
        </table>
    </form>
</body>
</html>
<% 
end if
rs.close 
conn.close 
%>