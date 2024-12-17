<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>아이디찾기</title>
	<link rel="stylesheet" href="style.css">
</head>

<script language="javascript" src="js_package.js"></script>

<body>
<center>

<form name="findID" method="post" action="findIdResult.jsp" target=_parent>

	<div id="check">아이디 찾기</div>
	<div id="Temail">이메일 인증</div>

<div id="find_id">
	<div id="Ftitle">이름</div>
	<input type="text" class="inputType" name="name" placeholder="이름을 입력하세요." autofocus>
</div>
<div id="find_id" style="margin-bottom:30px;">
	<div id="Ftitle">이메일</div>
	<input type="text" class="inputType" name="email" placeholder="이메일을 입력하세요." onkeydown="onEnterSubmitId()">
</div>
	<input type="button" class="submit2" value="아이디 찾기" onClick="IDcheckValue()">
</form>
</center>
</body>
</html>