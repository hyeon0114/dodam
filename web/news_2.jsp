<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>���㵵��</title>
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
  
  $('#card_news li a').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href'); 
    $.ajax({
      url: url,
      success: function(data) {
        $('#search_M3').html(data);
		$('html, body').animate({
          scrollTop: $("#header2,#header").offset().top
        }, 0);
      }
    });
  });
});
</script>
<div id="search_M3">

<div class="news_1">����ҽ�</div>
<div class="news_1_1">��ǰ �˷������ ���õ� �ҽ��� �پ��ϰ� �����ϰ� �ֽ��ϴ�.<br>��ǰ �˷����⿡ ���� ������ <����ҽ�>���� Ȯ���غ����� !</div>

<div class="news_1">ī�� ����</div>
<div class="news_1_2">��ǰ�˷����⿡ ���� �ñ��� �������� �Ѵ��� Ȯ���� ������ !</div>

<nav id="card_news">
	<ul>
		<li><a href="card_news.jsp"><img src="image/d_news/news1.png"></a></li>
		<li><a href="card_news_2.jsp"><img src="image/d_news/news2.png"></a></li>
	</ul>
</nav>

<div class="news_1">���</div>
<div class="news_1_2">��ǰ �˷������ ���õ� �پ��� �ҽĵ��� Ȯ���غ����� !</div>
<div id="news_1">
<a href="https://www.hankookilbo.com/News/Read/A2023031809580003689?did=NA" target="_blank"><img src="./image/news_2.png" ></a>
<a href="https://health.chosun.com/site/data/html_dir/2023/01/04/2023010400862.html" target="_blank"><img src="./image/news_3.png" width=></a>
</div>
</div>
</div>
</body>
</html>