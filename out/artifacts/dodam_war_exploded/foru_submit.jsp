<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="js_package.js"></script>

</head>
<body>


<%
	request.setCharacterEncoding("euc-kr");

	String[] ingre= request.getParameterValues("ingre");

	String id = request.getParameter("id");

	String[] allergies = new String[20];

	for (int i = 0; i <= 19; i++) {
		allergies[i] = request.getParameter("allergy" + (i));
	}

	StringBuilder sb = new StringBuilder();

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 for(int k=0; k<=19 ; k++){
	    if(allergies[k] != null && allergies[k].equals("Y")){ 
				String prd = Integer.toString(k)+" ";
				sb.append(prd);
			}
	 }

	String result = sb.toString();
	String[] allCheck  = result.split(" ");

	if(sb.length() == 0){
%>
	<script>
		var errorMessage = "당신의 알레르기를 선택해주세요.";
        alert(errorMessage);
        window.location.href = "foru.jsp";
	</script>
<%
	} else{
%>

	<div id="for_chk">
<%
	for(int m=0;m<allCheck.length;m++){
		String jsql9 = "SELECT * FROM allergy WHERE allergy = ?" ;
		PreparedStatement  pstmt9 = con.prepareStatement(jsql9);
		pstmt9.setString(1, allCheck[m]);

		ResultSet rs9 = pstmt9.executeQuery();
		rs9.next();

		String allName3 = rs9.getString("allName");
		String allno = rs9.getString("allergy");

%>
		<a href="#for_<%=allno%>_chk"><%=allName3%> 대체상품</a>
<%
	}
%>
	<a href="#for_all">모든 상품</a></div>

		<div id="content_f">
<%

	for(int n=0;n<allCheck.length;n++){
%>
			<div id="for_<%=allCheck[n]%>_chk"></div>
<%

	String jsql2 = "SELECT * FROM allergy WHERE allergy = ?" ;
	PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, allCheck[n]);

	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();

	String allName = rs2.getString("allName");
%>

	<div class="foru_2_T"><font style="color:orange; font-size:30px; font-weight:600;"><%=allName%> </font>알레르기 식품의 대체식품을 이용한 상품입니다.</div>

<div id="detail_ingre_div">
<div class="detail_ingre5"><img src="image/ingre_color.jpg">
<div class="detail_ingre6"><img src="image/ingre_infor2.jpg"></div>
</div>
</div>

<div id="foru_cont_1">
<table>
<tr>
<%
	String jsql = "SELECT DISTINCT prdNo FROM allgoods WHERE prdNo IN (SELECT prdNo FROM allgoods WHERE subPrd = ? ) ORDER BY RAND() LIMIT 3;" ;
	PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, allCheck[n]);


	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){ 
		String no = rs.getString("prdNo");

		String jsql3 = "SELECT * FROM goods WHERE prdNo = ?" ;
		PreparedStatement  pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, no);

		ResultSet rs3 = pstmt3.executeQuery();
		while(rs3.next()) {

			String prdname =  rs3.getString("prdName");	
			String price =  rs3.getString("prdPrice");	
			if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			}
			String ex =  rs3.getString("prdEx");
%>
<td>
<div class="foru_all">
<table class="hover_all2">
 <tr>      
	  <td colspan=2>
	  <a href="viewDetailProduct.jsp?prdNo=<%=no%>">
	   	<div id="hover_all2">
		알레르기 유발 식품<br><br>
	<%
		String jsql8 = "select * from allgoods where prdNo = ?";   
		PreparedStatement pstmt8  = con.prepareStatement(jsql8);
		pstmt8.setString(1, no);

		ResultSet rs8 = pstmt8.executeQuery();

		while(rs8.next()){
			String allNo = rs8.getString("allergy");
		
			String jsql9 = "select * from allergy where allergy = ?";   
			PreparedStatement pstmt9  = con.prepareStatement(jsql9);
			pstmt9.setString(1, allNo);

			ResultSet rs9 = pstmt9.executeQuery();
			rs9.next();

			String allName2 = rs9.getString("allName");
		%>
			<b>&nbsp;<%=allName2%>&nbsp;</b>
		<%
			}
		%>
		</div>
		<img src="image/f_img/<%=no%>.png"></a></td>
</tr>
	<tr><td colspan=2></td></tr>
	<tr><td colspan=2><%=ex%></td></tr>
	<tr><td><%=prdname%></td><td style="text-align:right; font-weight:600;"><%=price%> 원</td></tr>
</table>
<%
	if(ingre == null){
				%><br><%
	} else{
		
%>
<div class="ingre_color">
	<%	
			
		for(int j=0; j<ingre.length; j++){

			String jsql7 = "SELECT "+ingre[j]+" FROM ingredient WHERE prdNo = ?" ;
			PreparedStatement  pstmt7 = con.prepareStatement(jsql7);
			pstmt7.setString(1, no);

			double ingre2 = 0.0;
			int ingre3 = 0;
			String ingreName = "";
		
			if (ingre[j] != null) {
				ResultSet rs7 = pstmt7.executeQuery();
				rs7.next();
				ingre2 = rs7.getDouble(ingre[j]);
			}

			if(ingre[j].equals("car")){
				double car2 = (ingre2 / 108) * 100;
				ingre3 = (int) Math.round(car2);
				ingreName = "탄수화물";
			} else if(ingre[j].equals("pro")){
				double pro2 = (ingre2 / 18.3) * 100;
				ingre3 = (int) Math.round(pro2);
				ingreName = "단백질";
			} else if(ingre[j].equals("tFat")){
				double fat = (ingre2 / 18) * 100;
				ingre3 = (int) Math.round(fat);
				ingreName = "지방";
			}else if(ingre[j].equals("sod")){
				double sod2 = (ingre2 / 667) * 100;
				ingre3 = (int) Math.round(sod2);
				ingreName = "나트륨";
			}else if(ingre[j].equals("sug")){
				double sug2 = (ingre2 / 33) * 100;
				ingre3 = (int) Math.round(sug2);
				ingreName = "당류";
			}else if(ingre[j].equals("chol")){
				double chol2 =(ingre2 / 100) * 100;
				ingre3 = (int) Math.round(chol2);
				ingreName = "콜레스테롤";
			} else if(ingre[j] == null){
				ingre3 = 0;
				ingreName ="0";
			}%>
	 <div id="ingre_text"><%=ingreName%><br><div class="ingreC"style="<%if(ingre3<85) { %> background-color:#ffc100;<% } else if(ingre3>=85 && ingre3<=115){%>background-color:#446f26;<%}else if(ingre3>115){%>background-color:#fb5e44;<%}%>"> <span id="ingreF"><%=ingre3%> %</span></div></div>
	<%}%>
</div><%}%>

</div>

</td>
<%
				}
			}
%>
</tr></table>

</div>

	<div id="content_f">
		<div class="cont_1_f"><a href="#"><img src="image/f_infor/<%=allCheck[n]%>.png"></a></div>
	</div>

<%
	}
%>

	<div id="for_all" style="width:100%; height:100px;"></div>
	<div class="foru_2_T">알레르기 유발 식품<font style="color:orange; font-size:30px; font-weight:600;">
<%

	for(int n=0;n<allCheck.length;n++){

	String jsql7 = "SELECT * FROM allergy WHERE allergy = ?" ;
	PreparedStatement  pstmt7 = con.prepareStatement(jsql7);
	pstmt7.setString(1, allCheck[n]);

	ResultSet rs7 = pstmt7.executeQuery();
	rs7.next();

	String allName = rs7.getString("allName");
%><%=allName%><%if(n < allCheck.length - 1){%>, <%}}%></font> 이/가 없는 전체 상품입니다. <font style=" color: #344835; font-weight:600;"></font></div>

<div id="detail_ingre_div2">
<div class="detail_ingre5"><img src="image/ingre_color.jpg">
<div class="detail_ingre6"><img src="image/ingre_infor2.jpg"></div>
</div>

<div class="foru_A">
<div id="cont_f_2">

<%
	String jsql4 = "SELECT DISTINCT prdNo FROM goods a WHERE NOT EXISTS (SELECT 1 FROM allgoods WHERE allergy IN (";
	for (int i = 0; i < allCheck.length; i++) {
		jsql4 += "? ";
	if (i < allCheck.length - 1) {
		jsql4 += ",";
		}
	}
		jsql4 += ") AND allgoods.prdNo = a.prdNo)";

	PreparedStatement  pstmt4 = con.prepareStatement(jsql4);
	for (int i = 0; i < allCheck.length; i++) {
		pstmt4.setString(i+1, allCheck[i]);
	}
	ResultSet rs4 = pstmt4.executeQuery();

	while(rs4.next()){ 
		String no = rs4.getString("prdNo");

		String jsql5 = "SELECT * FROM goods WHERE prdNo = ?" ;
		PreparedStatement  pstmt5 = con.prepareStatement(jsql5);
		pstmt5.setString(1, no);

		ResultSet rs5 = pstmt5.executeQuery();
		while(rs5.next()) {

			String prdname =  rs5.getString("prdName");	
			String price =  rs5.getString("prdPrice");	
			if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			}
			String ex =  rs5.getString("prdEx");
%>

<div class="cont_f_3">

<table class="hover_all">
 <tr>      
	  <td colspan=2>
	  <a href="viewDetailProduct.jsp?prdNo=<%=no%>">
	   	<div id="hover_all">
		알레르기 유발 식품<br><br>
	<%
		String jsql8 = "select * from allgoods where prdNo = ?";   
		PreparedStatement pstmt8  = con.prepareStatement(jsql8);
		pstmt8.setString(1, no);

		ResultSet rs8 = pstmt8.executeQuery();

		while(rs8.next()){
			String allNo = rs8.getString("allergy");
		
			String jsql9 = "select * from allergy where allergy = ?";   
			PreparedStatement pstmt9  = con.prepareStatement(jsql9);
			pstmt9.setString(1, allNo);

			ResultSet rs9 = pstmt9.executeQuery();
			rs9.next();

			String allName2 = rs9.getString("allName");
		%>
			<b>&nbsp;<%=allName2%>&nbsp;</b>
		<%
			}
		%>
		</div>
		<img src="image/f_img/<%=no%>.png" ></a></td>

</tr>
	<tr><td colspan=2></td></tr>
	<tr><td colspan=2><%=ex%></td></tr>
	<tr><td><%=prdname%></td><td style="text-align:right; font-weight:600;"><%=price%> 원</td></tr>
</table>

<%
	if(ingre == null){
				%><br><%
	} else{
		
%>
<div class="ingre_color2">
		<%

		for(int e=0; e<ingre.length; e++){
			
			String jsql6 = "SELECT "+ingre[e]+" FROM ingredient WHERE prdNo = ?" ;
			PreparedStatement  pstmt6 = con.prepareStatement(jsql6);
			pstmt6.setString(1, no);

			double ingre2 = 0.0;
			int ingre3 = 0;
			String ingreName = "";

			if (ingre[e] != null) {
				ResultSet rs6 = pstmt6.executeQuery();
				rs6.next();
				ingre2 = rs6.getDouble(ingre[e]);
			}

			if(ingre[e].equals("car")){
				double car2 = (ingre2 / 108) * 100;
				ingre3 = (int) Math.round(car2);
				ingreName = "탄수화물";
			} else if(ingre[e].equals("pro")){
				double pro2 = (ingre2 / 18.3) * 100;
				ingre3 = (int) Math.round(pro2);
				ingreName = "단백질";
			} else if(ingre[e].equals("tFat")){
				double fat = (ingre2 / 18) * 100;
				ingre3 = (int) Math.round(fat);
				ingreName = "지방";
			}else if(ingre[e].equals("sod")){
				double sod2 = (ingre2 / 667) * 100;
				ingre3 = (int) Math.round(sod2);
				ingreName = "나트륨";
			}else if(ingre[e].equals("sug")){
				double sug2 = (ingre2 / 33) * 100;
				ingre3 = (int) Math.round(sug2);
				ingreName = "당류";
			}else if(ingre[e].equals("chol")){
				double chol2 =(ingre2 / 100) * 100;
				ingre3 = (int) Math.round(chol2);
				ingreName = "콜레스테롤";
			} else if(ingre[e] == null){
				ingre3 = 0;
				ingreName = "0";
			}%>
	<div id="ingre_text"><%=ingreName%><div class="ingreC"style="<%if(ingre3<85) { %> background-color: #ffc100;<% } else if(ingre3>=85 && ingre3<=115){%>background-color:#446f26;<%}else if(ingre3>115){%>background-color:#fb5e44;<%}%>"><span id="ingreF"><%=ingre3%> %</span></div></div>
		<%}%>
	</div>
<%}%>
</div>

<%

				}
			}
%>
</div>

 <%
}
	} catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>