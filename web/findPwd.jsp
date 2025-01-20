<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>도담도담</title>
	<link rel="stylesheet" href="style.css">
</head>

<script language="javascript" src="js_package.js"></script>

<body>
<center>

<form name="findpwd" method="post" action="findPwdResult.jsp" target=_parent>  

	<div id="check">비밀번호 찾기</div>
	<div id="Temail">아이디 인증</div>

<div id="find_id">
	<div id="Ftitle">이름</div>
	<input type="text" class="inputType" name="name" placeholder="이름을 입력하세요." autofocus><br>
</div>
<div id="find_id">
	<div id="Ftitle">아이디</div>
	<input type="text" class="inputType" name="id" placeholder="아이디를 입력하세요." onkeydown="onEnterSubmitPwd()"><br><br>
</div>
	<input type="button" class="submit2" value="비밀번호 찾기" onClick="PwdcheckValue()">

</form>
</center>
</body>
</html>