<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>���̵�ã��</title>
	<link rel="stylesheet" href="style.css">
</head>

<script language="javascript" src="js_package.js"></script>

<body>
<center>

<form name="findID" method="post" action="findIdResult.jsp" target=_parent>

	<div id="check">���̵� ã��</div>
	<div id="Temail">�̸��� ����</div>

<div id="find_id">
	<div id="Ftitle">�̸�</div>
	<input type="text" class="inputType" name="name" placeholder="�̸��� �Է��ϼ���." autofocus>
</div>
<div id="find_id" style="margin-bottom:30px;">
	<div id="Ftitle">�̸���</div>
	<input type="text" class="inputType" name="email" placeholder="�̸����� �Է��ϼ���." onkeydown="onEnterSubmitId()">
</div>
	<input type="button" class="submit2" value="���̵� ã��" onClick="IDcheckValue()">
</form>
</center>
</body>
</html>