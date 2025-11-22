<!--#include file="connect.asp"-->
<%
		action = Request("action")
		dm_ma = Request("dm_ma")
		select case action
			case "saveadd"
					'response.write("Lưu thêm mới")
					dm_ten = Request("txtdm_ten")
					dm_anh = Request("txtdm_anh")
					sqlinsert = "insert into danhmuc(dm_ten,dm_anh) values (N'" & dm_ten & "','" & dm_anh & "')"
					conn.execute sqlinsert
					session("danhmuc_error") = "Thêm mới thành công"
			case "saveedit"
					'response.write("Lưu sửa")
					dm_ten = Request("txtdm_ten")
					dm_anh = Request("txtdm_anh")
					sqlupdate = "update danhmuc set dm_ten =N'" & dm_ten & "', dm_anh = '" & dm_anh & "' where dm_ma = " & dm_ma
					conn.execute sqlupdate
					session("danhmuc_error") = "Cập nhật thành công!"
			case "delete"
					sqldelete = "delete from danhmuc where dm_ma = " & dm_ma 
					conn.execute sqldelete
					session("danhmuc_error") = "Xóa thành công!"
	
		end select
		sql = "select * from danhmuc"
		rs.open sql, conn 

%>
<html>
	<head>
			<meta charset=utf-8>
	</head>
	<body>
		<h1 align=center>Danh sách các danh mục</h1>
		<center><font color=red><%=session("danhmuc_error")%></font></center>
		<table border=1 width=700 align=center>
			<tr>
					<th>Mã</th>
					<th>Tên danh mục</th>
					<th>Ảnh</th>
					<th>Sửa</th>
					<th>Xóa</th>
			</tr>
			<%
					while not rs.eof 
					if ((action="edit") and (cint(dm_ma)=rs("dm_ma"))) then 
					%>
						<form action="?action=saveedit" method=post>
					<tr>
						<td><%=rs("dm_ma")%></td>
						<td><input type=text name=txtdm_ten value="<%=rs("dm_ten")%>"></td>
						<td><input type=text name=txtdm_anh value="<%=rs("dm_anh")%>"></td>
						<td><input type=submit value="Lưu"></td>
						<td><input type=reset value="Làm lại"></td>
						<input type=hidden name=dm_ma value=<%=rs("dm_ma")%>>
				</tr>				
						</form>	
					<%
					else 
						%>
			<tr>
					<td><%=rs("dm_ma")%></td>
					<td><%=rs("dm_ten")%></td>
					<td><img src="images/<%=rs("dm_anh")%>" width=200></td>
					<td><a href="?action=edit&dm_ma=<%=rs("dm_ma")%>">Sửa</td>
					<td><a onclick="return confirm('Bạn có muốn xóa nhóm \'<%=rs("dm_ten")%>\' hay không?')" href="?action=delete&dm_ma=<%=rs("dm_ma")%>">Xóa</td>
			</tr>
						<%
					end if 
					rs.movenext
					wend
					rs.close	
			%>
		</table>
		<center>
		<% if (Request("action")="add") then 
		%>
				<form action="?action=saveadd" method=Post>
				<h1 align=center>Thêm mới danh mục</h1>
					<table border=0 align=center>
							<tr>
								<td>Tên danh mục: </td>
								<td><input type=text name=txtdm_ten></td>
							</tr>
							<tr>
								<td>Ảnh: </td>
								<td><input type=text name=txtdm_anh></td>
								
							</tr>
							<tr>
								<td align=right><input type=submit value="Thêm mới"></td>
								<td><input type=reset value="Làm lại"></td>
							</tr>
					</table>
				</form>
		<%
		else 
		%>
					<a href="?action=add">Thêm mới danh mục</a>
		<%
		end if
		%>
		</center>
		
		<%
			conn.close
			session("danhmuc_error") = ""
		%>
	</body>
</html>
	


