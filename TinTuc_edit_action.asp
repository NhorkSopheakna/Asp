<!--#include file="Connect.asp"-->
<%
tieude = Request.Form("txtTTTieuDe")
trichdan = Request.Form("txtTTTrichDan")
noidung = Request.Form("txtTTNoiDung")
anh = Request.Form("txtTTAnh")
sodem = Request.Form("txtTTSOdem")
danhmuc = Request.Form("txtTTDanhMuc")
trangthai = Request.Form("txtTTTrangThai")

sql = "UPDATE TinTuc SET tt_ngaysua='"&Now&"' , tt_tieude='" & tieude & "', tt_trichdan='" & trichdan & "', tt_noidung='" & noidung & "', tt_anh='" & anh & "', tt_sodem='" & sodem & "', dm_ten='" & danhmuc & "', tt_trangthai='" & trangthai & "' WHERE tt_ma=" & Request.QueryString("tt_ma")
'Response.write(sql)
conn.Execute sql
conn.Close

Response.Redirect("TinTuc_view.asp")

%>