<!--#include file="Connect.asp"-->
<%

trangthai = 0

sql = "UPDATE TinTuc SET tt_trangthai='" & trangthai & "' WHERE tt_ma=" & Request.QueryString("tt_ma")
'Response.write(sql)
conn.Execute sql
conn.Close

Response.Redirect("TinTuc_view.asp")

%>