<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>���㵵��</title>
<link rel="stylesheet" href="style.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="jquery.scrollbox.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>

</head>

<body>
<script>
var prevUrl = document.referrer;
var prevInfor = null;
if (prevUrl) {
  var match = prevUrl.match(/infor=(\d+)/);
  if (match) {
    prevInfor = parseInt(match[1]);
  }
}
console.log(prevInfor);
</script>

<%
	String infor = request.getParameter("infor");

%>
<%
	String id =(String)session.getAttribute("sid");

if (id == null)
{ 
%>
<div id="header2">
<div class="menu2">
	<div id="logo2">
		<header class="top2"><a href="main.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap4">
        <nav>
            <ul>
                <li><a href="news.jsp">�ҽ�</a></li>
                <li><a href="Products.jsp">��ǰ</a></li>
				<li><a href="search.jsp" style="color: #cc5555;">��ǰ �˷����� ���̵�</a></li>
                <li><a href="foru.jsp">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="login.jsp">�α���</a></li>
				<li><a href="insertMember.jsp">ȸ������</a></li>
            </ul>
        </nav>
</div>
<div id="menu_bar2" class="material-symbols-outlined" onclick="toggleNav()">menu</div>
</div>
</div>	

<%
}
else
{
%>

<div id="header">
<div id = "mainTop">
	<ul>
		<li><a href="logout.jsp">�α׾ƿ�</a></li>
		<li><a href="showLike.jsp?id=<%=id%>">���ѻ�ǰ</a></li>
		<li><a href="showCart.jsp?id=<%=id%>">��ٱ���</a></li>
		<li><a href="center.jsp?id=<%=id%>">������</a></li>
	</ul>
</div>

<div class="menu">
	<div id="logo">
		<header class="top"><a href="main_M.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap">
        <nav>
            <ul>
                <li><a href="news.jsp">�ҽ�</a></li>
               	<li><a href="Products.jsp">��ǰ</a></li>
				<li><a href="search.jsp" style="color: #cc5555;">��ǰ �˷����� ���̵�</a></li>
            	<li><a href="foru_2.jsp?id=<%=id%>">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>
<%
}
%>
<div class="allergy_search2"></div>
<div id="allergy_search2" class="scroll-img3">
	<ul onchange="checkBack()">
	<%
	
		for(int i=0; i<19;i++){
			String classAttr = "";
			if (String.valueOf(i+1).equals(infor)) {
				classAttr = "_select";
			}
	%>
		<li><a href="#" onclick="changeImage(<%=i+1%>);  updateUrl(<%=i+1%>); scrollBox(<%=i%>);"><img src="image/infor_icon/<%=i+1%><%=classAttr%>.png"></a></li>
	<%
		}
	%>
	<li><img src="image/infor_icon/20.png"></li>
	<li><img src="image/infor_icon/20.png"></li>
	<li><img src="image/infor_icon/20.png"></li>
	</ul>
</div>

 <div class="arrow2">
      <button class="prev2" id="demo5-backward"><span class="material-symbols-outlined">arrow_back_ios</span></button>
      <button class="next2" id="demo5-forward"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
 </div>


<script>
(function($) {
$(function () {
  var container = $('#allergy_search2');
  var scrollbox = container.scrollbox();

  // Check if infor is greater than or equal to 9
  var infor = <%= infor %>;
  if (infor >= 12) {
    container.animate({scrollLeft: container.scrollLeft() + 990 * (infor - 11)}, 0);
  }

  $('#demo5-backward').click(function () {
     container.animate({scrollLeft: container.scrollLeft() - 990}, 500);
  });
  $('#demo5-forward').click(function () {
     container.animate({scrollLeft: container.scrollLeft() + 990}, 500);
  });

  $('#allergy_search2 ul').on('click', 'li', function() {
    var currentIndex = $(this).index();
    var diff = currentIndex - prevInfor;
    prevInfor = currentIndex;
    console.log(diff); // display the difference in the console
  });
});

})(jQuery);


function changeImage(index) {
    $('#allergy_img img').attr('src', 'image/infor/' + index + '.png');
}

function updateUrl(infor) {
    var url = window.location.href;
    var index = url.indexOf('?');
    if (index != -1) {
        url = url.substring(0, index);
    }
    window.location.href = url + '?infor=' + infor;
}
</script>
<div id="allergy_img"><img src="image/infor/infor_<%=infor%>.png"></div>


<div id="mainPage">

	<div id="footer"><div class="footer"><br>
			<div id="fLeft">
				<p><span class="footer_Fm"><a href="center.jsp">������</a></span></p>
				  <ul>
					  <li><span class="footer_F"> ��ð�</span> 08:00am ~ 18:00pm </li>
					  <li><span class="footer_F"> ���ɽð�</span> 12:30pm ~ 13:30pm </li>
					  <li><span class="footer_F"> ������ �޹�</span> �ָ�, ������ </li>
				  </ul>
			</div>
			<br><br><br>
			<div id="fRight">
			<div id="fRx"><a href="privacy.jsp"><b>��������ó����ħ</b></a> | <a href="news.jsp">ȸ��Ұ�</a> | <a href="sitemap.jsp">����Ʈ��</a>  | <a href="manager/manager_login.jsp">������ �α���</a></div>
				<ul>
				<li>���θ� (��ȣ) : ���㵵��(��) | ��ǥ: �輼�� | ��ȭ: 1577-1659</li>
				<li>����ڵ�Ϲ�ȣ : 150-72-35764 [���������Ȯ��]</li>
				<li>������������å���� : �輼��, ������</li>
				</ul>
			</div>
			</div>
	
	</div></div>
</div>
</body>
</html>