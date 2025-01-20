<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>
<html>
<head>
<title>주문 처리 완료</title>
		<link rel="stylesheet" href="style.css">	
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>

		<script language="javascript" src="js_package.js"></script>
 <style type="text/css">
     a:link { text-decoration: none; color: black; }
     a:visited { text-decoration: none; color: black; }
     a:hover { text-decoration: underline; color:gray; } 
 </style>

</head>

<%
try{
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");

	String ctNo = session.getId(); 

    String myid = (String)session.getAttribute("sid"); 
	String oPoint = request.getParameter("point");
	String oName = request.getParameter("name");
	String oTel = request.getParameter("memTel");
	String oReceiver = request.getParameter("receiver");
	String oRcvAdr = request.getParameter("rcvAddress");
	String oRcvPhone = request.getParameter("rcvPhone");		
	String oCardNo = request.getParameter("cardNo");
	String oCardPass = request.getParameter("cardPass");
	String oBank = request.getParameter("bank");
	String oPay = request.getParameter("pay");  			

	int total =  Integer.parseInt(oPay) - Integer.parseInt(oPoint);

	String jsql = "select MAX(ordNo) from orderInfo";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery(); 

	int oNum;
	if(rs.next())  
		oNum = rs.getInt(1) + 1; 
	else                     
		oNum = 1; 

	String jsql2 = "select * from temcart where ctNo = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, ctNo);

	ResultSet rs2 = pstmt2.executeQuery(); 

	while(rs2.next()) 
	{			                  
			String prdNo = rs2.getString("prdNo");
    		int ctQty = rs2.getInt("ctQty");

			String jsql3 = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, Integer.toString(oNum));
			pstmt3.setString(2, prdNo);
			pstmt3.setInt(3, ctQty);

			pstmt3.executeUpdate();

			String jsql6 = "select prdAccrue, prdStock from goods where prdNo = ?";
			PreparedStatement pstmt6 = con.prepareStatement(jsql6);
			pstmt6.setString(1, prdNo);

			ResultSet rs6 = pstmt6.executeQuery(); 

			while(rs6.next()){
				int sum = rs6.getInt("prdAccrue") + ctQty;
				int stock = rs6.getInt("prdStock") - ctQty;

				String jsql5 = "UPDATE goods SET prdAccrue=?, prdStock=? where prdNo=?";
				PreparedStatement pstmt5 = con.prepareStatement(jsql5);
				pstmt5.setInt(1, sum);
				pstmt5.setInt(2, stock);
				pstmt5.setString(3, prdNo);

				pstmt5.executeUpdate();
			}
	}


	String jsql4 = "INSERT INTO orderInfo (ordNo, memId, ordDate, ordReceiver, ordRcvAdr, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass)  VALUES(?,?,?,?,?,?,?,?,?,?)";


	java.util.Date date = new java.util.Date(); 
    String oDate = date.toLocaleString(); 

	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, Integer.toString(oNum));
	pstmt4.setString(2, myid);
	pstmt4.setString(3, oDate);
	pstmt4.setString(4, oReceiver);
	pstmt4.setString(5, oRcvAdr);
	pstmt4.setString(6, oRcvPhone);
    pstmt4.setInt(7, total);
	pstmt4.setString(8, oBank);
	pstmt4.setString(9, oCardNo);
	pstmt4.setString(10, oCardPass);

	pstmt4.executeUpdate();

	String jsql7 = "SELECT * FROM member WHERE memId=?";
	PreparedStatement pstmt7 = con.prepareStatement(jsql7);
	pstmt7.setString(1, myid);

	ResultSet rs7 = pstmt7.executeQuery(); 

	while(rs7.next()) 
	{
		double point = total * rs7.getDouble("percent")+rs7.getInt("memPoint") -  Integer.parseInt(oPoint);

		String jsql6 = "UPDATE member SET memPoint=? where memId=?";
		PreparedStatement pstmt6 = con.prepareStatement(jsql6);
		pstmt6.setDouble(1, point);
		pstmt6.setString(2, myid);

		pstmt6.executeUpdate();
	}

	 response.sendRedirect("deleteTemCart.jsp?case=1"); 

   }  catch(Exception e)  {
        out.println(e);
} 
%>
  
</body>
</html> 