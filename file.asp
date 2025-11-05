<!--#include file="connect.asp"-->
<%
Response.ContentType = "text/html"

' Lấy danh mục
Dim rsCats, sqlCats
Set rsCats = Server.CreateObject("ADODB.Recordset")
sqlCats = "SELECT * FROM DanhMuc WHERE dm_trangthai = 1 ORDER BY dm_order"
rsCats.Open sqlCats, conn, 3, 3

' Lấy tham số danh mục
Dim catId, isCat
catId = Trim(Request.QueryString("cat"))
isCat = False
If catId <> "" And IsNumeric(catId) Then isCat = True

' Lấy tin (nếu không chọn danh mục lấy tt_hot = 1)
Dim rsNews, sqlNews
Set rsNews = Server.CreateObject("ADODB.Recordset")
If isCat Then
    sqlNews = "SELECT * FROM TinTuc WHERE isDelete = 0 AND dm_id = " & CInt(catId) & " ORDER BY tt_ngay DESC"
Else
    sqlNews = "SELECT * FROM TinTuc WHERE isDelete = 0 AND tt_hot = 1 ORDER BY tt_ngay DESC"
End If
rsNews.Open sqlNews, conn, 3, 3
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Tin tức</title>
<style>
body{font-family:Arial,Helvetica,sans-serif;margin:0;padding:0;}
.header{background:#fff;border-bottom:1px solid #eee;padding:10px 20px;display:flex;gap:15px;}
.header a{color:#222;text-decoration:none;font-weight:600;}
.container{width:1100px;margin:20px auto;display:flex;gap:20px;}
.left{width:320px;}
.news-item{display:flex;gap:12px;padding:12px 0;border-bottom:1px solid #f0f0f0;align-items:center;}
.news-item img{width:120px;height:70px;object-fit:cover;}
.news-item .title{font-size:15px;color:#222;text-decoration:none;}
.right{flex:1;}
.featured img{width:100%;height:220px;object-fit:cover;}
.featured h2{font-size:28px;margin:10px 0;}
.thumbs{display:flex;gap:12px;margin-top:12px;}
.thumb{flex:1;text-align:center;}
.thumb img{width:100%;height:90px;object-fit:cover;}
.footer{background:#f6f0ef;padding:8px;text-align:center;margin-top:20px;color:#7a6d6d;}
</style>
</head>
<body>

<div class="header">
  <a href="file.asp">Trang chủ</a>
  <% Do While Not rsCats.EOF %>
    <a href="file.asp?cat=<%=rsCats("dm_id")%>"><%=Server.HTMLEncode(rsCats("dm_name"))%></a>
  <% rsCats.MoveNext: Loop %>
</div>

<div class="container">
  <div class="left">
    <% If Not rsNews.EOF Then rsNews.MoveFirst %>
    <% Do While Not rsNews.EOF %>
      <div class="news-item">
        <a href="news_detail.asp?id=<%=rsNews("id")%>"><img src="<%=Server.HTMLEncode(rsNews("tt_image"))%>" alt=""></a>
        <div><a class="title" href="news_detail.asp?id=<%=rsNews("id")%>"><%=Server.HTMLEncode(rsNews("tt_tieude"))%></a></div>
      </div>
    <% rsNews.MoveNext: Loop %>
  </div>

  <div class="right">
    <% ' featured = first record (nếu tồn tại) %>
    <% rsNews.MoveFirst %>
    <% If Not rsNews.EOF Then %>
      <div class="featured">
        <a href="news_detail.asp?id=<%=rsNews("id")%>"><img src="<%=Server.HTMLEncode(rsNews("tt_image"))%>" alt=""></a>
        <h2><a href="news_detail.asp?id=<%=rsNews("id")%>" style="color:#222;text-decoration:none;"><%=Server.HTMLEncode(rsNews("tt_tieude"))%></a></h2>
        <p><%=Server.HTMLEncode(Left(rsNews("tt_mota"),200))%></p>
      </div>
    <% Else %>
      <p>Chưa có tin để hiển thị.</p>
    <% End If %>

    <div class="thumbs">
      <% 
        ' show up to 3 thumbs (skip the featured one)
        Dim rsThumbs, sqlThumbs, fid
        Set rsThumbs = Server.CreateObject("ADODB.Recordset")
        fid = 0
        If Not rsNews.EOF Then fid = rsNews("id")
        If isCat Then
          sqlThumbs = "SELECT TOP 3 * FROM TinTuc WHERE isDelete = 0 AND dm_id = " & CInt(catId)
        Else
          sqlThumbs = "SELECT TOP 3 * FROM TinTuc WHERE isDelete = 0 AND tt_hot = 1"
        End If
        If fid <> 0 Then sqlThumbs = sqlThumbs & " AND id <> " & fid
        sqlThumbs = sqlThumbs & " ORDER BY tt_ngay DESC"
        rsThumbs.Open sqlThumbs, conn, 3, 3
        Do While Not rsThumbs.EOF
      %>
        <div class="thumb">
          <a href="news_detail.asp?id=<%=rsThumbs("id")%>"><img src="<%=Server.HTMLEncode(rsThumbs("tt_image"))%>" alt=""></a>
          <p><a href="news_detail.asp?id=<%=rsThumbs("id")%>" style="color:#222;text-decoration:none;"><%=Server.HTMLEncode(rsThumbs("tt_tieude"))%></a></p>
        </div>
      <% rsThumbs.MoveNext: Loop
         rsThumbs.Close:Set rsThumbs=Nothing %>
    </div>

    <div class="footer">Báo Đại học Xây dựng Hà Nội giữ bản quyền nội dung trên website này.</div>
  </div>
</div>

</body>
</html>

<%
rsCats.Close:Set rsCats = Nothing
rsNews.Close:Set rsNews = Nothing
Set conn = Nothing
%>
