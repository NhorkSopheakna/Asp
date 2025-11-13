<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>THÊM TIN TỨC</h1>
    <form method="POST" action="TinTuc_add_action.asp">
        <table>
            <tr>
                <td>Tiêu đề</td>
                <td><input type="text" name="txtTTTieuDe"></td>
            </tr>
            <tr>
                <td>Trích dẫn</td>
                <td><input type="text" name="txtTTTrichDan"></td>
            </tr>
            <tr>
                <td>Nội dung</td>
                <td><input type="text" name="txtTTNoiDung"></td>
            </tr>
            <tr>
                <td>Ảnh</td>
                <td><input type="text" name="txtTTAnh"></td>
            </tr>
            <tr>
                <td>Ngày</td>
                <td><input type="date" name="txtTTNgay"></td>
            </tr>
            <tr>
                <td>Ngày tạo</td>
                <td><input type="date" name="txtTTNgayTao"></td>
            </tr>
            <tr>
                <td>Ngày sửa</td>
                <td><input type="date" name="txtTTNgaySua"></td>
            </tr>
            <tr>
                <td>Số đếm</td>
                <td><input type="number" name="txtTTSOdem"></td>
            </tr>
            <tr>
                <td>Danh mục</td>
                <td><input type="text" name="txtTTDanhMuc"></td>
            </tr>
            <tr>
                <td>Trạng thái</td>
                <td><input type="number" name="txtTTTrangThai"></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
                <td><input type="reset"></td>
            </tr>
        </table>
    </form>
</body> 
</html>