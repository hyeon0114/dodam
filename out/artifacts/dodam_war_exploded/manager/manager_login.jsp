<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>���㵵��</title>

<link rel="stylesheet" href="../style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script language="javascript" src="js_package.js"></script>
</head>


<body onLoad="login_focus()">

<center>
<%
	String id =(String)session.getAttribute("sid");

if (id == null)
{ 
%>
<div id="header2">
<div class="menu2">
	<div id="logo2">
		<header class="top2"><a href="../main.jsp"><img src="logo.png"></a></header>
	</div>

	<div id="wrap4">
        <nav>
            <ul>
                <li><a href="../news.jsp">�ҽ�</a></li>
                <li><a href="../Products.jsp">��ǰ</a></li>
				<li><a href="../search.jsp">��ǰ �˷����� ���̵�</a></li>
                <li><a href="../foru.jsp">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="../login.jsp">�α���</a></li>
				<li><a href="../insertMember.jsp">ȸ������</a></li>
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
		<li><a href="../logout.jsp">�α׾ƿ�</a></li>
		<li><a href="../showLike.jsp?id=<%=id%>">���ѻ�ǰ</a></li>
		<li><a href="../showCart.jsp?id=<%=id%>">��ٱ���</a></li>
		<li><a href="../center.jsp?id=<%=id%>">������</a></li>
	</ul>
</div>

<div class="menu">
	<div id="logo">
		<header class="top"><a href="../main_M.jsp"><img src="logo.png"></a></header>
	</div>

	<div id="wrap">
        <nav>
            <ul>
                <li><a href="../news.jsp">�ҽ�</a></li>
               	<li><a href="../Products.jsp">��ǰ</a></li>
				<li><a href="../search.jsp">��ǰ �˷����� ���̵�</a></li>
            	<li><a href="../foru_2.jsp?id=<%=id%>">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="../mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>
<%
}
%>


<div class="login2">
<div id="login"></div>
<div id="login2">
<form name="login" method="post" action="manager_loginOk.jsp" target=_parent> 
	
	<div id="loginT" align=center><span style="color:#335e15; font-weight:800; font-size:35px;">���㵵��</span> ������ �α���<br></div>

	<div id="id"><input type="text" name="id" id="text" placeholder="���̵� �Է����ּ���"></div>
	<div id="pwd"><input type="password" name="pass" id="text" placeholder="��й�ȣ�� �Է����ּ���" onkeydown="onEnterSubmit()"></div>

	<br><br>
	
	<div align=center><a href="javascript:login_check()"><input type="button" class="submit" value="�α���"></a></div>
	<div align=center><br><a href="insertMember.jsp"><div class="signup">ȸ������</div></a></div>


  </form>
</div>
</div>


<div id="mainPage2">

	<div id="footer2"><div class="footer"><br>
			<div id="fLeft">
				<p><span class="footer_Fm">������</span></p>
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
</center>
</body>
</html>