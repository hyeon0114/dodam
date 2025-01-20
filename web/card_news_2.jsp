<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>
</head>
<body>
<script>
$(document).ready(function() {
  
  $('#back_href2 ul li a, #back_href a').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href'); 
    $.ajax({
      url: url,
      success: function(data) {
        $('#search_M3').html(data);
        $('html, body').animate({
          scrollTop: $("#header2, #header").offset().top
        }, 0);
      }
    });
  });
});
</script>
<div id="search_M3">
<div id="back_href">소식 > <a href="news_2.jsp">도담소식</a> > 카드뉴스</div>
<div class="news_1_card">식품 알레르기  Q & A</div>

<div class="card_news_in">
	<img src="image/d_news/c_card_2.png">
</div>

<div id="back_href2">
	<nav class="back_href2">
		<ul>
			<li><a href="card_news.jsp">< 다음</a></li>
			<li><a href="news_2.jsp">목록</a></li>
			<li><a href="">&nbsp; </a></li>
		</ul>
	</nav>
</div>


</div>
</body>
</html>