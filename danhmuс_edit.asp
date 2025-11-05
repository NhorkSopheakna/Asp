<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"

Dim id: id = Request.QueryString("dm_ma")
Dim conn, rs, sql
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb")

If Request.Form("submit") <> "" Then
    sql = "UPDATE danhmuc SET " & _
          "dm_ten='" & Replace(Request.Form("dm_ten"),"'","''") & "'," & _
          "dm_anh='" & Replace(Request.Form("dm_anh"),"'","''") & "'," & _
          "dm_hot=" & IIf(Request.Form("dm_hot")="1","True","False") & "," & _
          "dm_thutu=" & CLng(Request.Form("dm_thutu")) & "," & _
          "dm_parent=" & CLng(Request.Form("dm_parent")) & "," & _
          "dm_trangthai=" & CLng(Request.Form("dm_trangthai")) & _
          " WHERE dm_ma='" & Replace(id,"'","''") & "'"
    conn.Execute sql
    conn.Close:Set conn=Nothing
    Response.Redirect "danhmuc_list.asp"
End If

Set rs = conn.Execute("SELECT * FROM danhmuc WHERE dm_ma='" & Replace(id,"'","''") & "'")
%>
<html><head><meta charset="UTF-8"><title>Sửa Danh mục</title></head>
<body>
<h2>Sửa Danh mục</h2>
<form method="post">
Mã (readonly): <input type="text" name="dm_ma" value="<%=rs("dm_ma")%>" readonly><br><br>
Tên: <input type="text" name="dm_ten" value="<%=rs("dm_ten")%>"><br><br>
Ảnh: <input type="text" name="dm_anh" value="<%=rs("dm_anh")%>"><br><br>
Nổi bật:
<select name="dm_hot">
    <option value="0" <%If rs("dm_hot")=False Then Response.Write("selected")%>>Không</option>
    <option value="1" <%If rs("dm_hot")=True Then Response.Write("selected")%>>Có</option>
</select><br><br>
Thứ tự: <input type="number" name="dm_thutu" value="<%=rs("dm_thutu")%>"><br><br>
Parent: <input type="number" name="dm_parent" value="<%=rs("dm_parent")%>"><br><br>
Trạng thái:
<select name="dm_trangthai">
    <option value="1" <%If rs("dm_trangthai")=1 Then Response.Write("selected")%>>Hiển thị</option>
    <option value="0" <%If rs("dm_trangthai")=0 Then Response.Write("selected")%>>Ẩn</option>
</select><br><br>
<input type="submit" name="submit" value="Cập nhật">
<a href="danhmuc_list.asp">Hủy</a>
</form>
<%
rs.Close:Set rs=Nothing
conn.Close:Set conn=Nothing
%>
</body></html>

