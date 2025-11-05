<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"

If Request.Form("submit") <> "" Then
    Dim conn, sql
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb")
    sql = "INSERT INTO danhmuc (dm_ma, dm_ten, dm_anh, dm_hot, dm_thutu, dm_parent, dm_trangthai) VALUES (" & _
          "'" & Replace(Request.Form("dm_ma"),"'","''") & "'," & _
          "'" & Replace(Request.Form("dm_ten"),"'","''") & "'," & _
          "'" & Replace(Request.Form("dm_anh"),"'","''") & "'," & _
          IIf(Request.Form("dm_hot")="1","True","False") & "," & _
          CLng(Request.Form("dm_thutu")) & "," & _
          CLng(Request.Form("dm_parent")) & "," & _
          CLng(Request.Form("dm_trangthai")) & ")"
    conn.Execute sql
    conn.Close:Set conn=Nothing
    Response.Redirect "danhmuc_list.asp"
End If
%>
<html><head><meta charset="UTF-8"><title>Thêm Danh mục</title></head>
<body>
<h2>Thêm Danh mục</h2>
<form method="post">
Mã (text): <input type="text" name="dm_ma" required><br><br>
Tên: <input type="text" name="dm_ten" required><br><br>
Ảnh (tên file): <input type="text" name="dm_anh"><br><br>
Nổi bật: <select name="dm_hot"><option value="0">Không</option><option value="1">Có</option></select><br><br>
Thứ tự: <input type="number" name="dm_thutu" value="1"><br><br>
Parent: <input type="number" name="dm_parent" value="0"><br><br>
Trạng thái: <select name="dm_trangthai"><option value="1">Hiển thị</option><option value="0">Ẩn</option></select><br><br>
<input type="submit" name="submit" value="Lưu">
<a href="danhmuc_list.asp">Hủy</a>
</form>
</body></html>
