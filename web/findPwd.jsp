<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>���㵵��</title>
	<link rel="stylesheet" href="style.css">
</head>

<script language="javascript" src="js_package.js"></script>

<body>
<center>

<form name="findpwd" method="post" action="findPwdResult.jsp" target=_parent>  

	<div id="check">��й�ȣ ã��</div>
	<div id="Temail">���̵� ����</div>

<div id="find_id">
	<div id="Ftitle">�̸�</div>
	<input type="text" class="inputType" name="name" placeholder="�̸��� �Է��ϼ���." autofocus><br>
</div>
<div id="find_id">
	<div id="Ftitle">���̵�</div>
	<input type="text" class="inputType" name="id" placeholder="���̵� �Է��ϼ���." onkeydown="onEnterSubmitPwd()"><br><br>
</div>
	<input type="button" class="submit2" value="��й�ȣ ã��" onClick="PwdcheckValue()">

</form>
</center>
</body>
</html>