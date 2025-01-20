<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
<title>상품 등록 처리 결과</title>
</head>
<body>

<% 
	request.setCharacterEncoding("euc-kr");
	String file = request.getParameter("chooseFile");

    String ctg = request.getParameter("ctg");
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String ex = request.getParameter("ex");
   	int price =  Integer.parseInt(request.getParameter("price")); 
	int stock =  Integer.parseInt(request.getParameter("stock"));
	int accrue = 0;

	String sub = request.getParameter("sub");

	double one = Double.parseDouble(request.getParameter("one"));
	double total = Double.parseDouble(request.getParameter("total"));
	double cal = Double.parseDouble(request.getParameter("cal"));
	double car = Double.parseDouble(request.getParameter("car"));
	double sugar = Double.parseDouble(request.getParameter("sugar"));
	double protein = Double.parseDouble(request.getParameter("protein"));
	double tFat = Double.parseDouble(request.getParameter("tFat"));
	double sFat = Double.parseDouble(request.getParameter("sFat"));
	double trans = Double.parseDouble(request.getParameter("trans"));
	double choles = Double.parseDouble(request.getParameter("choles"));
	double sodium = Double.parseDouble(request.getParameter("sodium"));

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

    String jsql = "INSERT INTO GOODS  (ctgType, prdNo, prdName, prdPrice, prdStock, prdAccrue, prdEx) VALUES  (?, ?, ?, ?, ?, ?, ?)"; 

	PreparedStatement pstmt = con.prepareStatement(jsql); 

    pstmt.setString(1, ctg); 
	pstmt.setString(2, no); 
    pstmt.setString(3, name);
	pstmt.setInt(4, price); 
	pstmt.setInt(5, stock);
	pstmt.setInt(6, accrue);
	pstmt.setString(7, ex);
	pstmt.executeUpdate();
	
	
	String jsql3 = "INSERT INTO allgoods (prdNo, allergy, subPrd) VALUES  (?, ?, ?)"; 

	for(int k=0; k<=19 ; k++){
	    if(allergies[k] != null && allergies[k].equals("Y")){ 
	        PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	
	        pstmt3.setString(1, no);
	        pstmt3.setString(2, Integer.toString(k)); 
	        pstmt3.setString(3, sub);
	
	        pstmt3.executeUpdate();
	    }
	}

	String jsql2 = "INSERT INTO INGREDIENT (prdNo, serS, Tser, cal, car, sug, pro, tFat, satFat, tranFat, chol, sod) VALUES  (?,?,?,?,?,?,?,?,?,?,?,?)"; 

	PreparedStatement pstmt2 = con.prepareStatement(jsql2); 

    pstmt2.setString(1, no);
	pstmt2.setDouble(2, one);
	pstmt2.setDouble(3, total);
	pstmt2.setDouble(4, cal);
	pstmt2.setDouble(5, car);
	pstmt2.setDouble(6, sugar);
	pstmt2.setDouble(7, protein);
	pstmt2.setDouble(8, tFat);
	pstmt2.setDouble(9, sFat);
	pstmt2.setDouble(10, trans);
	pstmt2.setDouble(11, choles);
	pstmt2.setDouble(12, sodium);

	pstmt2.executeUpdate();
%>


<% 
  } catch(Exception e) { 
		out.println(e);
}
%>
<script>
		var errorMessage = "상품정보가 저장되었습니다.";
        alert(errorMessage);
        window.location.href = "insertGoods.jsp";
</script>
</body>
</html>