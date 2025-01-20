<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>���㵵��</title>
<link rel="stylesheet" href="style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="jquery.scrollbox.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>

</head>

<body>
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
                <li><a href="Products.jsp" style="color: #cc5555;">��ǰ</a></li>
				<li><a href="search.jsp">��ǰ �˷����� ���̵�</a></li>
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
               	<li><a href="Products.jsp" style="color: #cc5555;">��ǰ</a></li>
				<li><a href="search.jsp">��ǰ �˷����� ���̵�</a></li>
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

<div id="p_b"><img src="image/d_market/maket_bg.png"></div>


<div id="search_Tap">
<form name="search" method=post id="search_form">

<div class="search_2">
	<input type="text" id="searchType_2" name="search2" placeholder="��ǰ�� �˻��غ�����" size=60>

<div id="btn_search">
<input type="submit" id="search_btn" value="�˻��ϱ�">
</div>
</div>

</form>
</div>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

if (id == null)
{%> 
<script>
function checkBack(){
		$("#b_ctg a").click(function(){
			$("#b_ctg a").removeClass('on');
				$(this).addClass('on');
		});
}

$(document).ready(function(){
	$("#best_div").load("best_goods_1.jsp");

$("#b_ctg  a").click(function(e){
	e.preventDefault();
		var jsp = $(this).data("jsp");
		$("#best_div").load(jsp);
		$("#best_div").load(jsp, function() {
            $('html, body').animate({
                scrollTop: $("#best_content_2").offset().top
            }, 1000);
        });
	});

	checkBack();

	$("#search_form").submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "search_submit.jsp",
            data: $(this).serialize(),
            success: function(response) {
                $("#search_M").html(response);
            }
        });
    });
});
</script>

<div id="search_M">
<div id="b_ctg" style="color:#efefef;">
	<a href="#" data-jsp="best_goods_1.jsp" class="on">�α��</a> | 
	<a href="#" data-jsp="best_goods.jsp?text=asc">���� ������</a> | 
	<a href="#" data-jsp="best_goods.jsp?text=desc">���� ������</a>
</div>
<%
} else {%>

<script>
function checkBack(){
		$("#b_ctg a").click(function(){
			$("#b_ctg a").removeClass('on');
				$(this).addClass('on');
		});
}

$(document).ready(function(){
	$("#best_div").load("allproduct.jsp");

$("#b_ctg  a").click(function(e){
	e.preventDefault();
		var jsp = $(this).data("jsp");
		$("#best_div").load(jsp);
		$("#best_div").load(jsp, function() {
            $('html, body').animate({
                scrollTop: $("#best_content_2").offset().top
            }, 1000);
        });
	});

	checkBack();

	$("#search_form").submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "search_submit.jsp",
            data: $(this).serialize(),
            success: function(response) {
                $("#search_M").html(response);
            }
        });
    });
});
</script>
<%
	String jsql = "SELECT * FROM memall WHERE memId=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	StringBuilder allergies = new StringBuilder();

	while(rs.next()) {
		String allN = rs.getString("allergy")+" ";
		allergies.append(allN);
	}
%>
		
<div id="search_M">
<div id="b_ctg" style="color:#efefef;">

	<a href="#" data-jsp="allproduct.jsp?id=<%=id%>"  class="on">
<%
	String sb = allergies.toString();
	String[] allNArray = sb.split(" ");

	for(int i=0; i<allNArray.length; i++){
	String jsql2 = "SELECT * FROM allergy WHERE allergy = ?" ;
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, allNArray[i]);
	 
	ResultSet rs2 = pstmt2.executeQuery();
	while(rs2.next()) {
			String no = rs2.getString("allergy");
			String name =  rs2.getString("allName");
%>
<%=name%><%}}%> ����</a> |
	<a href="#" data-jsp="best_goods_1.jsp">�α��</a> | 
	<a href="#" data-jsp="best_goods.jsp?text=asc">���� ������</a> | 
	<a href="#" data-jsp="best_goods.jsp?text=desc">���� ������</a>
</div>
<%}%>
<div id="best_div"></div>
</div>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
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