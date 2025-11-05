<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Dim id: id = Request.QueryString("dm_ma")
If id <> "" Then
    Dim conn
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("csdl.mdb")
    conn.Execute "DELETE FROM danhmuc WHERE dm_ma='" & Replace(id,"'","''") & "'"
    conn.Close:Set conn=Nothing
End If
Response.Redirect "danhmuc_list.asp"
%>
