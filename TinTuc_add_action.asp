<%
strConn = "Provider=SQLOLEDB;Server=TRUNGFUONG;Initial Catalog=DB;Integrated Security=SSPI"
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open strConn

tieude = Request.Form("txtTTTieuDe")
trichdan = Request.Form("txtTTTrichDan")
noidung = Request.Form("txtTTNoiDung")
anh = Request.Form("txtTTAnh")
ngaydang = Request.Form("txtTTNgay")
ngaytao = Request.Form("txtTTNgayTao")
ngaysua = Request.Form("txtTTNgaySua")
sodem = Request.Form("txtTTSOdem")
danhmuc = Request.Form("txtTTDanhMuc")
trangthai = Request.Form("txtTTTrangThai")

sql = "INSERT INTO TinTuc (tt_tieude, tt_trichdan, tt_noidung, tt_anh, tt_ngay, tt_ngaytao, tt_ngaysua, tt_sodem, dm_ten, tt_trangthai) VALUES ('" & tieude & "', '" & trichdan & "', '" & noidung & "', '" & anh & "', '" & ngaydang & "', '" & ngaytao & "', '" & ngaysua & "', '" & sodem & "', '"& danhmuc &"' , '" & trangthai & "')"

conn.Execute sql
conn.Close

Response.Redirect("TinTuc_view.asp")
%>