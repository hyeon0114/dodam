<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>���㵵�� ������ ���</title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>

<script>
	function resizeIframe(obj){ obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px' ; }
</script>
</head>

 <body>
 <center>

<%
	String id = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	���Ӱ����� ID : <font color="green"><%=id%></font> &nbsp;&nbsp;|&nbsp;&nbsp; ���� �ð� : <font color="green"><%=curDate %></font> 
</div>
<div class="logout">
	<a href="../logout.jsp" target=_parent >������ �α׾ƿ�</a>
	<a href="../main.jsp" target=_parent >���㵵��</a>
</div>

<div id="managerT">������ ���</div>

<div id="menu">
	<ul>
		<li>
			<a href="selectAllMember.jsp" target=main>ȸ�� ����</a>
			<ul>
				<li><a href="insertMember.jsp" target=main>�ű� ȸ�� ���</a></li>
				<li><a href="selectAllMember.jsp" target=main>ȸ�� ��ȸ/����/����</a></li>
			</ul>
		</li>
		<li>
			<a href="selectAllGoods.jsp" target=main>��ǰ ����</a>
			<ul>
				<li><a href="insertGoods.jsp" target=main>�ű� ��ǰ ���</a></li>
				<li><a href="selectAllGoods.jsp" target=main>��ǰ ��ȸ/����/����</a></li>
			</ul>
		</li>
		<li>
			<a href="orderInfo.jsp" target=main>�ֹ� ����</a>
			<ul>
				<li><a href="orderInfo.jsp" target=main>�ֹ����� ��ȸ/����/����</a></li>
				<li><a href="orderProduct.jsp" target=main>�ֹ���ǰ ��ȸ/����/����</a></li>
			</ul>
		</li>
	</ul>
</div>

</div>
</center>

</body>
</html>