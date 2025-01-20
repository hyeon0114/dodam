<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>상품 정보 수정</title>

<link rel="stylesheet" href="../style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="js_package.js"></script>
</head>
<body><center>

<%
	String sid = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	접속관리자 ID : <font color="green"><%=sid%></font> &nbsp;&nbsp;|&nbsp;&nbsp; 접속 시각 : <font color="green"><%=curDate %></font> 
</div>
<div class="logout">
	<a href="../logout.jsp" target=_parent >관리자 로그아웃</a>
	<a href="../main.jsp" target=_parent >도담도담</a>
</div>

<div id="managerT">관리자 모드</div>

<div id="menu">
	<ul>
		<li>
			<a href="selectAllMember.jsp" target=main>회원 관리</a>
			<ul>
				<li><a href="insertMember.jsp" target=main>신규 회원 등록</a></li>
				<li><a href="selectAllMember.jsp" target=main>회원 조회/수정/삭제</a></li>
			</ul>
		</li>
		<li>
			<a href="selectAllGoods.jsp" target=main>상품 관리</a>
			<ul>
				<li><a href="insertGoods.jsp" target=main>신규 상품 등록</a></li>
				<li><a href="selectAllGoods.jsp" target=main>상품 조회/수정/삭제</a></li>
			</ul>
		</li>
		<li>
			<a href="orderInfo.jsp" target=main>주문 관리</a>
			<ul>
				<li><a href="orderInfo.jsp" target=main>주문정보 조회/수정/삭제</a></li>
				<li><a href="orderProduct.jsp" target=main>주문상품 조회/수정/삭제</a></li>
			</ul>
		</li>
	</ul>
</div>

</div>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

 	 String key = request.getParameter("prdNo");

	 String jsql = "SELECT * FROM GOODS WHERE prdNo = ?";       
	 PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

	 ResultSet rs = pstmt.executeQuery();//SQL문 실행	
	 rs.next();

	 String prdno = rs.getString("prdNo");
	 String prdname =  rs.getString("prdName");	
	 String ex =  rs.getString("prdEx");
	 int price =  rs.getInt("prdPrice");
	 int stock =  rs.getInt("prdStock");
	 String accrue = rs.getString("prdAccrue");
	 String ctg =  rs.getString("ctgType");

	 String jsql5 = "SELECT * FROM allgoods WHERE prdNo = ?";       
	 PreparedStatement  pstmt5  = con.prepareStatement(jsql5);
	 pstmt5.setString(1, key);

	 ResultSet rs5 = pstmt5.executeQuery();//SQL문 실행	
	 rs5.next();

	 String sub = rs5.getString("subPrd");

%>

<div id="manager_title">상품 정보 수정</div>

<form method="post" action="updateGoodsResult.jsp">
<table id="updateG">		
		<tr>
				<td>카테고리분류</td>
				<td><input type=text name="ctg" value="<%=ctg%>"></td>
				<td rowspan="8"><img src="../image/f_img/<%=prdno%>.png" width="300" height="300"></td>
		</tr>
		<tr>
				<td>상품번호</td>
				<td><input type="hidden" name="no" value="<%=prdno%>" ><%=prdno%></td>
	    </tr>
		<tr>
				<td>상품명</td>
				<td><input type=text name="name" value="<%=prdname%>"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea cols="42" rows="2" name="ex" id="textarea"><%=ex%></textarea></td>
		</tr>
		<tr>
				<td>상품가격</td>
				<td><input type=text name="price" value="<%=price%>"> 원</td>
		</tr>
		<tr>
				<td>재고수량</td>
				<td><input type=text name="stock" value="<%=stock%>"> 개</td>
		</tr>
		<tr>
			<td>누적 판매량</td>
			<td><input type="hidden" name="accrue" value="<%=accrue%>"><%=accrue%></td>
		</tr>	
		<tr>
			<td>대체식품번호</td>
			<td><input type="text" name="sub" value="<%=sub%>"></td>
		</tr>
</table>
<br><br>
	<div class="all_search">
		<div class="allergy_s">
		<div id="search_t">알레르기 유발 식품</div>
<%
	String jsql3 = "SELECT * FROM allgoods WHERE prdNo = ?";       
	PreparedStatement  pstmt3  = con.prepareStatement(jsql3);
	pstmt3.setString(1, key);

	ResultSet rs3 = pstmt3.executeQuery();

	StringBuilder allergies = new StringBuilder();

	while(rs3.next()) {
		String allN = rs3.getString("allergy")+" ";
		allergies.append(allN);
	}
	
	String sb = allergies.toString();
	String[] allNArray = sb.split(" ");

	String jsql4 = "SELECT * FROM allergy WHERE allergy" ;
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	 
	ResultSet rs4 = pstmt4.executeQuery();
		
		while(rs4.next()) {
			String no = rs4.getString("allergy");
			String name =  rs4.getString("allName");
			boolean isChecked = false;

			for(String n: allNArray) {
				if(no.equals(n)) {
					isChecked = true;
					break;
				}
			}
			
%>	
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check0" onchange="yncheck2(this)" name="allergy<%=no%>" <% if (isChecked) out.print("checked"); %> value=<% out.print('Y'); %>>
				<span class="circle"><%=name%></span>
			</label>
<%
		}
%> 
</div>
</div>
<%
	 String jsql2 = "SELECT * FROM INGREDIENT WHERE prdNo = ?";       
	 PreparedStatement  pstmt2  = con.prepareStatement(jsql2);
	 pstmt2.setString(1, key);

	 ResultSet rs2 = pstmt2.executeQuery();//SQL문 실행	
	 rs2.next();

	 String ser = rs2.getString("serS");
	 String Tser = rs2.getString("Tser");
	 String cal = rs2.getString("cal");
	 String sugar = rs2.getString("sug");
	 String protein = rs2.getString("pro");
	 String Tfat = rs2.getString("tFat");
	 String Sfat = rs2.getString("satFat");
	 String trans = rs2.getString("tranFat");
	 String choles = rs2.getString("chol");
	 String sodium = rs2.getString("sod");
	 String car = rs2.getString("car");

%>
<div id="ingre">

<table class="ingre">
	<tr>
		<td colspan="2">영양성분표</td>
	</tr>
	<tr>
		<td>1회 제공량</td><td><input type="text" step="0.01" name="ser" value="<%=ser%>"> g</td>
	</tr>
	<tr>
		<td>총 제공량</td><td><input type="number" step="0.01"  name="Tser" value="<%=Tser%>"> g</td>
	</tr>
	<tr>
		<td>열량</td><td><input type="number" step="0.01"  name="cal" value="<%=cal%>"> kcal</td>
	</tr>
	<tr>
		<td>탄수화물</td><td><input type="number" step="0.01"  name="car" value="<%=car%>"> g</td>
	</tr>
	<tr>
		<td>당류</td><td><input type="number" step="0.01"  name="sug" value="<%=sugar%>"> g</td>
	</tr>
	<tr>
		<td>단백질</td><td><input type="number" step="0.01"  name="pro" value="<%=protein%>"> g</td>
	</tr>
	<tr>
		<td>지방</td><td><input type="number" step="0.01"  name="tFat" value="<%=Tfat%>"> g</td>
	</tr>
	<tr>
		<td>포화지방</td><td><input type="number" step="0.01"  name="satFat" value="<%=Sfat%>"> g</td>
	</tr>
	<tr>
		<td>트랜스지방</td><td><input type="number" step="0.01"  name="tranFat" value="<%=trans%>"> g</td>
	</tr>
	<tr>
		<td>콜레스테롤</td><td><input type="number" step="0.01"  name="chol" value="<%=choles%>"> mg</td>
	</tr>
	<tr>
		<td>나트륨</td><td><input type="number" step="0.01"  name="sod" value="<%=sodium%>"> mg</td>
	</tr>
</table>
</div>
<input type="submit" value="수정완료" id="onebtn">
<br>
<img src="../image/f_detail/<%=prdno%>.png" id="detail">
<br>

</form>


<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>