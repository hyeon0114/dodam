<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>회원 정보 수정 </title>
	<link rel="stylesheet" href="../style.css">
	<script language="javascript" src="js_package.js"></script>
</head>
<body>

<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String id = request.getParameter("id");   
%>
<form method=post action="updateAllergyResult.jsp?">
<div id="updateAllergy">
<div id="insertT">알레르기식품</div>
<br><br>

<%
	String jsql2 = "SELECT * FROM memall WHERE memId=?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, id);

	ResultSet rs2 = pstmt2.executeQuery();

	StringBuilder allergies = new StringBuilder();

	while(rs2.next()) {
		String allN = rs2.getString("allergy")+" ";
		allergies.append(allN);
	}
	
	String sb = allergies.toString();
	String[] allNArray = sb.split(" ");

	String jsql3 = "SELECT * FROM allergy" ;
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	 
	ResultSet rs3 = pstmt3.executeQuery();
		
		while(rs3.next()) {
			String no = rs3.getString("allergy");
			String alname =  rs3.getString("allName");
			boolean isChecked = false;

			for(String n: allNArray) {
				if(no.equals(n)) {
					isChecked = true;
					break;
				}
			}
			
%>	
			<input type="hidden" name="id" value="<%=id%>">
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check4" onchange="yncheck(this)" name="allergy<%=no%>" <% if (isChecked) out.print("checked"); %> value=<% out.print('Y'); %>>
				<span class="circle4"><%=alname%></span>
			</label>
<%
		}
%> 

</div>


			</td>
		</tr>
	</table>
	<p><input type=submit value="수정하기" id="oneBtn4">
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
</html>