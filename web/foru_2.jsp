<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>���㵵��</title>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="js_package.js"></script>

<script>
$(document).ready(function() {
	$("#foru_form").submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "foru_submit2.jsp",
            data: $(this).serialize(),
            success: function(response) {
                $("#foru_M").html(response);
				$('html, body').animate({
                    scrollTop: $("#foru_c").offset().top
                }, 1000);
            }
        });
    });
});

</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("sid");
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
			<li><a href="search.jsp">��ǰ �˷����� ���̵�</a></li>
            	<li><a href="foru_2.jsp?id=<%=id%>" style="color: #cc5555;">��ǰ �˷����� ���� ��ǰ</a></li>
			<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>

<%

try {
 	String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
    String DB_ID="root";
    String DB_PASSWORD="1234";
 	 
	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql3 = "SELECT * FROM member WHERE memId=?";
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1, id);

	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();

	String name2 = rs3.getString("memName");
%>
<form name="foru" method=post action="foru_submit2.jsp" id="foru_form" target=main>
	<div id="foru_b"><img src="image/foru/foru.png"></div>
	<div class="foru_T"><font style="color:#89bc8c; font-weight:600;"><%=name2%></font>���� ���Ͻô� ������ ������ ������ !</div>
	<div class="all_foru">
		<div class="allergy2">
		<div id="aTitle2"><font style="color:#89bc8c; font-weight:600;"><%=name2%></font>���� ���� �˷����� ���� ��ǰ�� ������ �ּ���.</div>

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
	
	String sb = allergies.toString();
	String[] allNArray = sb.split(" ");

	String jsql2 = "SELECT * FROM allergy WHERE allergy not like 0" ;
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 
	ResultSet rs2 = pstmt2.executeQuery();
		
		while(rs2.next()) {
			String no = rs2.getString("allergy");
			String name =  rs2.getString("allName");
			boolean isChecked = false;

			for(String n: allNArray) {
				if(no.equals(n)) {
					isChecked = true;
					break;
				}
			}
			
%>	
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check5" onchange="yncheck2(this)" name="allergy<%=no%>" <% if (isChecked) out.print("checked"); %> value=<% out.print('Y'); %>>
				<span class="circle5"><%=name%></span>
			</label>
<%
		}
%> 

<input type="button" id="all_chk" value="��μ���">

<script>
var allChecked2 = false;
document.getElementById("all_chk").addEventListener("click", function() {
  var checkboxes2 = document.getElementsByClassName("check5");
  for (var k = 0; k < checkboxes2.length; k++) {
    checkboxes2[k].checked = !allChecked2;
  }
  allChecked2 = !allChecked2;
  
  var button = document.getElementById("all_chk");
  if (allChecked2) {
    button.value = "�ʱ�ȭ";
  } else {
    button.value = "��μ���";
  }
});
</script>

<div class="ingre">

<div id="in_Title">�ٷ� Ȯ���ϰ� ���� ���缺���� ������ �ּ���. <div id="ingre_foru"><img src="image/icon_infor.jpg">
<div id="foru_icon"><img src="image/ingre_foru2.jpg"></div>
</div></div>

<div class="ingreChk">
	<label for="ingre1"><input type="checkbox" id="ingre1" value="car" name="ingre" class="check1"><span class="circle2">ź��ȭ��</span></label>
	<label for="ingre2"><input type="checkbox" class="check1" id="ingre2" value="pro" name="ingre" ><span class="circle2">�ܹ���</span></label>
	<label for="ingre3"><input type="checkbox" class="check1" id="ingre3" value="tFat" name="ingre" ><span class="circle2">����</span></label>
	<label for="ingre4"><input type="checkbox" class="check1" id="ingre4" value="sod" name="ingre" ><span class="circle2">��Ʈ��</span></label>
	<label for="ingre5"><input type="checkbox" class="check1" id="ingre5" value="sug" name="ingre" ><span class="circle2">���</span></label>
	<label for="ingre6"><input type="checkbox" class="check1" id="ingre6" value="chol" name="ingre" ><span class="circle2">�ݷ����׷�</span></label>
	<input type="button" id="all_chk2" value="��μ���">
</div>
</div>

<script>
var allChkBtn = document.getElementById("all_chk2");
allChkBtn.addEventListener("click", function() {
  var checkboxes = document.getElementsByClassName("check1");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = !checkboxes[i].checked;
  }

  if (allChkBtn.value === "��μ���") {
    allChkBtn.value = "�ʱ�ȭ";
  } else {
    allChkBtn.value = "��μ���";
  }
});
</script>


<div id="btn_foru">
<input type="submit" id="foru_btn_s" value="��ȸ�ϱ�">
<input type="reset" id="reset_btn" value="�ʱ�ȭ" onclick="resetCheckboxes()">
</div>

</div>
</div>
<input type=hidden name="id" value="<%=id%>" id="inputType">

</form>


<div id="foru_c"><br></div>
<div id="foru_M"></div>
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