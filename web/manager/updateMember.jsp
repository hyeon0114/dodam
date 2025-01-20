<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>ȸ�� ���� ���� </title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>
</head>
<body>
<center>

<%
	String sid = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	���Ӱ����� ID : <font color="green"><%=sid%></font> &nbsp;&nbsp;|&nbsp;&nbsp; ���� �ð� : <font color="green"><%=curDate %></font> 
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

<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String key = request.getParameter("id");   
	 String jsql = "select * from member where memId = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	 String id = rs.getString("memId");
   	 String pwd = rs.getString("memPwd");
	 String name = rs.getString("memName");
	 String email = rs.getString("memEmail");
	 String adr= rs.getString("memAdr");
	 String phone = rs.getString("memPhone");
	 String sex = rs.getString("memSex");
%>

<div id="manager_title">ȸ�� ���� ����</div>
	<form method=post action="updateMemberResult.jsp?">
	<table id="insertTable">
		<tr>
			<td>���̵�</td>
			<td><input type=hidden name="id" value="<%=id%>" id="inputType"><%=id%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type=text name="pwd" id="boxStyle" value="<%=pwd%>" id="inputType" ></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type=text name="name" id="boxStyle" value="<%=name%>" id="inputType"></td>
		</tr>
		
		<tr>
			<td>�̸���</td>
			<td><input type=text name="email" id="boxStyle" value="<%=email%>" id="inputType"></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><input type=text name="adr" id="boxStyle" value="<%=adr%>" id="inputType"></td>
		</tr>
		<tr>
			<td>�޴���</td>
			<td>
<%
	    	String[ ] hpArr  = phone.split("-");  
			String[ ]  hpSelected = new String[6];  

			if(hpArr[0].equals("010"))
			{
				hpSelected[0] = "selected";
			}  
			else if(hpArr[0].equals("011"))
			{
				hpSelected[1] = "selected";
			}
			else if(hpArr[0].equals("016"))
			{
				hpSelected[2] = "selected";
			}
			else if(hpArr[0].equals("017"))
			{
				hpSelected[3] = "selected";
			}
			else if(hpArr[0].equals("018"))
			{
				hpSelected[4] = "selected";
			}
			else if(hpArr[0].equals("019"))
			{
				hpSelected[5] = "selected";
			}

%>
			<select name="hp1" id="boxStyle1">      
				<option value="010" <%=hpSelected[0]%>>010
				<option value="011" <%=hpSelected[1]%>>011
				<option value="016" <%=hpSelected[2]%>>016
				<option value="017" <%=hpSelected[3]%>>017
				<option value="018" <%=hpSelected[4]%>>018
				<option value="019" <%=hpSelected[5]%>>019
			</select> - 
		    <input type="number" name="hp2" value="<%=hpArr[1]%>" size="4" id="boxStyle1"> -
		    <input type="number" name="hp3" value="<%=hpArr[2]%>" size="4" id="boxStyle1">
			</td>	
		</tr>
		<tr>
			<td>����</td>
			<td>
<%
		if(sex.equals("��"))
		{
%>
				<input type=radio name=sex value="��" checked>�� &nbsp;&nbsp; &nbsp; 
				<input type=radio name=sex value="��" id="inputType2"> ��
<%
		}	
		else
		{
%>
				<input type=radio name=sex value="��">�� &nbsp;&nbsp; &nbsp; 
				<input type=radio name=sex value="��" checked id="inputType2"> ��
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>�˷������ǰ</td>
			<td>
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

	String jsql3 = "SELECT * FROM allergy WHERE allergy not like 0" ;
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
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check5" onchange="yncheck3(this)" name="allergy<%=no%>" <% if (isChecked) out.print("checked"); %> value=<% out.print('Y'); %>>
				<span class="circle5"><%=alname%></span>
			</label>
<%
		}
%> 

			</td>
		</tr>
	</table>
	<br>
	<input type=submit value=�����Ϸ� id="btn5">
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>

<div class="manager_bottom"></div>
</center>
</body>
</html>