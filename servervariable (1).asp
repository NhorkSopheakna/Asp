<html>
	<head>
			<meta charset=utf-8>
	</head>
	<body>
			<%
				For each x in Request.ServerVariables
					Response.write(x & " = " & Request.ServerVariables(x) & "<BR>" )
				Next
			%>
	</body>
</html>
	
