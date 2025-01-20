<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>상품 정보 수정 결과</title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>
</head>
<body><center>

<%
	 request.setCharacterEncoding("euc-kr");
	
    String ctg = request.getParameter("ctg");
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String ex = request.getParameter("ex");
   	int price =  Integer.parseInt(request.getParameter("price")); 
	int stock =  Integer.parseInt(request.getParameter("stock"));
	int sub =  Integer.parseInt(request.getParameter("sub"));
	int accrue = Integer.parseInt(request.getParameter("accrue"));

	
	double one = Double.parseDouble(request.getParameter("ser"));
	double total = Double.parseDouble(request.getParameter("Tser"));
	double cal = Double.parseDouble(request.getParameter("cal"));
	double car = Double.parseDouble(request.getParameter("car"));
	double sugar = Double.parseDouble(request.getParameter("sug"));
	double protein = Double.parseDouble(request.getParameter("pro"));
	double tFat = Double.parseDouble(request.getParameter("tFat"));
	double sFat = Double.parseDouble(request.getParameter("satFat"));
	double trans = Double.parseDouble(request.getParameter("tranFat"));
	double choles = Double.parseDouble(request.getParameter("chol"));
	double sodium = Double.parseDouble(request.getParameter("sod"));

	String[] allergies = new String[20];

	for (int i = 0; i <= 19; i++) {
		allergies[i] = request.getParameter("allergy" + (i));
	}

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);


    String jsql = "UPDATE GOODS SET ctgType=?, prdName=?, prdPrice=?, prdStock=?, prdAccrue=?, prdEx=? WHERE prdNo=?"; 

	PreparedStatement pstmt = con.prepareStatement(jsql); 

    pstmt.setString(1, ctg); 
    pstmt.setString(2, name);
	pstmt.setInt(3, price); 
	pstmt.setInt(4, stock);
	pstmt.setInt(5, accrue);
	pstmt.setString(6, ex);
	pstmt.setString(7, no); 

	pstmt.executeUpdate();

	

	String jsql5 = "DELETE FROM allgoods WHERE prdNo=?"; 
	PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	pstmt5.setString(1, no);
	
	pstmt5.executeUpdate();

	String jsql3 = "INSERT INTO allgoods (allergy, subPrd, prdNo) VALUES (?,?,?)"; 

	for(int k=0; k<=19 ; k++){
	    if(allergies[k] != null && allergies[k].equals("Y")){ 
	        PreparedStatement pstmt3 = con.prepareStatement(jsql3);

	        pstmt3.setString(1, Integer.toString(k)); 
	        pstmt3.setInt(2, sub);
			pstmt3.setString(3, no);
	
	        pstmt3.executeUpdate();
	    }
	}

	String jsql2 = "UPDATE INGREDIENT SET serS=?, Tser=?, cal=?, car=?, sug=?, pro=?, tFat=?, satFat=?, tranFat=?, chol=?, sod=? WHERE prdNo=?"; 

	PreparedStatement pstmt2 = con.prepareStatement(jsql2); 

	pstmt2.setDouble(1, one);
	pstmt2.setDouble(2, total);
	pstmt2.setDouble(3, cal);
	pstmt2.setDouble(4, car);
	pstmt2.setDouble(5, sugar);
	pstmt2.setDouble(6, protein);
	pstmt2.setDouble(7, tFat);
	pstmt2.setDouble(8, sFat);
	pstmt2.setDouble(9, trans);
	pstmt2.setDouble(10, choles);
	pstmt2.setDouble(11, sodium);
	pstmt2.setString(12, no);

	pstmt2.executeUpdate();
%>

<script>
		var errorMessage = "상품정보가 수정되었습니다.";
        alert(errorMessage);
        window.location.href = "manager_index.jsp";
</script>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>