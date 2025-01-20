<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>�ֹ��ϱ�</title>

 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script language="javascript" src="js_package.js"></script>
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
            	<li><a href="foru_2.jsp?id=<%=id%>">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>
<% 
try { 
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";    // ���� DB�� project
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();

	String jsql = "select * from cart where memId = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())
	{
%>
	<script>
		var errorMessage = "��ǰ�� ����ֽ��ϴ�.";
        alert(errorMessage);
        window.location.href = "Products.jsp";
	</script>
<%
	}
	else
	{
%>
	<br>
<div id="title_order">��ǰ �ֹ���</div>

<div class="title_order">�ֹ� ��ǰ</div>

<table id="order_t">
<tr>       
   <td>��ǰ��ȣ</td>
   <td>��ǰ��</td>       
   <td>��ǰ�ܰ�(��)</td>       
   <td>�ֹ�����(��)</td>  
   <td>�ֹ���(��)</td>  
   <td>��ǰ����</td>
 </tr> 		

<%
		String jsql2 = "select prdNo, ctQty from cart where memId = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, id);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;
		int Poption = 0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdNo");	
    		int ctQty = rs2.getInt("ctQty");	

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String prdName =  rs3.getString("prdName");
			String price =  rs3.getString("prdPrice");

			int amount = Integer.parseInt(price) * ctQty;
			total = total + amount; 

			String amount2 = Integer.toString(amount);
			if (amount2.length() > 3) {
			String newamount = amount2.substring(0, amount2.length() - 3)
				.concat(",")
				.concat(amount2.substring(amount2.length() - 3));
			amount2 = newamount;
			} 


			if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			} 
%>

 <tr>       
    <td><img src="image/f_img/<%=prdNo%>.png" width="100" height="100" border=0></td>     
	<td><%=prdName%></td> 
	<td><%=price%> ��</td> 
	<td><%=ctQty%></td>
    <td><%=amount2%> ��</td>  
    <td><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><div id="deleteBtn2">����</div></a></td> 
  </tr>   
<%
	     }  // while���� ��

		String total2 = Integer.toString(total);
		if (total2.length() > 3) {
		String newtotal = total2.substring(0, total2.length() - 3)
			.concat(",")
			.concat(total2.substring(total2.length() - 3));
		total2 = newtotal;
		} 
 %>
  <tr>
	<td colspan = 4 id="allText2">��ü �ֹ��Ѿ�</td>
	<td id="allPrice2"><%=total2%> ��</td>
	<td>(���ù�ǰ ����)</td>
  </tr>
 </table>     

<% 

	String jsql4 = "select memName, memPhone, memAdr, memPoint, memEmail from member where memId = ?";
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1,id);

	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();
	String  name = rs4.getString("memName");
	String  tel = rs4.getString("memPhone");
	String  adr = rs4.getString("memAdr");
	String point = rs4.getString("memPoint");
	String email = rs4.getString("memEmail");
	
	if (point.length() > 3) {
		String newpoint = point.substring(0, point.length() - 3)
			.concat(",")
			.concat(point.substring(point.length() - 3));
		point = newpoint;
		} 
	
	String jsql9 = "select * from cart where memId = ?";
	PreparedStatement pstmt9 = con.prepareStatement(jsql9);
	pstmt9.setString(1, id);		

	ResultSet rs9 = pstmt9.executeQuery(); 
	int count = 0;
	
	while(rs9.next()) {
	count++;
	String pNo = rs9.getString("prdNo");

	String jsql8 = "select * from goods where prdNo = ?";
	PreparedStatement pstmt8 = con.prepareStatement(jsql8);
	pstmt8.setString(1,pNo);
	
	ResultSet rs8 = pstmt8.executeQuery();
	rs8.next();
	String  pName = rs8.getString("prdName");

%>
<script>
      $( document ).ready( function() {
        $( '#b' ).change( function() {
			var a = $( '#a' ).val();
			const A = Number(a);
			var b = $( '#b' ).val();
			const B = Number(b);
			var c = $( '#c' ).val();
			const C = Number(c);
			if (A < B) { 
			alert("�� �ݾ� �̻��� ����Ʈ�� ����� �� �����ϴ�");
		  } else if( B > C ) {
			  alert("���� ���� ����Ʈ �̻��� ����Ʈ�� ����� �� �����ϴ�");
		  } else{
			var ab = A - B;
          $( '#ab' ).text( ab+" ��" );
		  }
        } );
      } );

</script>
 <script>
    var IMP = window.IMP;
    IMP.init('imp35262834'); 

	function requestPay() {

    IMP.request_pay({
    	pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '<%=pName%> �� <%=count%>',
        amount : '<%=total2%>',
        buyer_email : '<%=email%>',
        buyer_name : '<%=name%>',
        buyer_tel : '<%=tel%>',
        buyer_addr : '<%=adr%>',
        buyer_postcode : '123-586',
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '������ �Ϸ�Ǿ����ϴ�.';
            location.href='mypage.jsp';
			var form = document.querySelector('#form_buy');
            form.submit();
        } else {
            var msg = '������ �����Ͽ����ϴ�.';
            rsp.error_msg;
            
        }
    });

	}
</script>
<%
	}
%>
<form name="form" id="form_buy" method="Post" action="orderOk.jsp">

<div class="title_order">����Ʈ ���</div>
<table id="orderMember">
	<tr>
		<td>���� ���� ����Ʈ</td>
		<td><input type="hidden" class="inputType" id="c" value="<%=point%>"><%=point%> P</td>
	</tr>
	<tr>
		<td>����Ʈ</td>
		<td><input type="number" name="point" class="inputType" id="b" value="0"></td>
	</tr>
</table>

<div class="title_order">�ֹ��� ����</div>
<table id="orderMember">
	<tr>
		<td>�� ��</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>�� ȭ</td>
		<td><input type="text" name="memTel" class="inputType" value=<%=tel%>></td>
	</tr>
</table>

<div class="title_order">�ֹ��� ����</div>
<table  id="orderMember">
	<tr>
		<td>�� ��</td>
		<td><input type="text" name="receiver" class="inputType" value=<%=name%>></td>
	</tr>
	<tr>
		<td>�� ��</td>
		<td><input type="text" name="rcvAddress" class="inputType" value="<%=adr%>"></td>
	</tr>
	<tr>
		<td>�� ȭ</td>
		<td><input type="text" name="rcvPhone" class="inputType" value=<%=tel%>></td>
	</tr>
</table>

<div class="title_order">���� ���</div>
<table id="orderMember">
	<tr>
		<td>��������</td>
		<td colspan=2>
		
		<label for="pay"><input type="checkbox" name="bank" id="pay" class="kakao1"><span class="pay">KakaoPay</span></label>

		<label for="pay2"><input type="checkbox" id="pay2" class="kakao1"><span class="pay">�ſ�ī�����</span></label>
		
		<label for="pay3"><input type="checkbox" id="pay3" class="kakao1"><span class="pay">�������Ա�</span></label>
		</td>
	</tr>

	<tr id="pay_tr">
		<td>�������</td>
		<td>
		<input type="text" name="cardNo" id="pay_card" class="inputType2">
		<select name="bank" class="inputType" id="pay_bank">
			<option value="0" selected>���� �� ����</option>
            <option value="�츮����">�츮���� ( 324-01-123400 / (��)���㵵����θ�)</option>
            <option value="��������">�������� ( 011-02-300481 / (��)���㵵����θ�)</option>
            <option value="��ȯ����">��ȯ���� ( 327-56-333002 / (��)���㵵����θ�)</option>
            <option value="��������">�������� ( 987-25-202099 / (��)���㵵����θ�)</option>
            <option value="�ϳ�����">�ϳ����� ( 698-00-222176 / (��)���㵵����θ�)</option>
		</select>
		</td>

		<td>
		<input type="text" name="cardPass" id="pay_card2" class="inputType2">
		</td>
	</tr>
</table>

<table id="total">
	<tr>
		<td>�� ��ǰ���� <b><input type="hidden" name="pay" value="<%=total%>" id="a"><%=total2%>��</b> + �� ��ۺ� <b>0��</b> = �� �ֹ� �ݾ� <b id="ab"><%=total2%>��</b></td> 
	</tr>
</table>

<table class="btn3">
	<tr>
		<td><input type="reset" value="�ֹ� ���" name="reset"  id="btn5"></td>
		<td><input type = "button" value = "�����ϱ�"  OnClick="check_val()" id="btn4"></td> 
		
	</tr>
</table>

</form>  
		<div id="kakaopay"><button onclick="requestPay()" class="kakao">�����ϱ�</button></div>

<script>
const payCheckbox = document.querySelector('#pay');
const pay2Checkbox = document.querySelector('#pay2');
const pay3Checkbox = document.querySelector('#pay3');
const payCardElement = document.querySelector('#pay_card');
const payCard2Element = document.querySelector('#pay_card2');
const payBankElement = document.querySelector('#pay_bank');
const kakaoElement = document.querySelector('#kakaopay');

payCheckbox.addEventListener('change', function() {
  if (this.checked) {
    pay2Checkbox.checked = false;
    pay3Checkbox.checked = false;
    kakaoElement.style.display = 'block';
	payCardElement.style.display = 'none';
	payCard2Element.style.display = 'none';
	payBankElement.style.display = 'none';
  } else {
    kakaoElement.style.display = 'none';
  }
});

pay2Checkbox.addEventListener('change', function() {
  if (this.checked) {
    payCheckbox.checked = false;
    pay3Checkbox.checked = false;
    payCardElement.style.display = 'block';
	payCard2Element.style.display = 'block';
	kakaoElement.style.display = 'none';
	payBankElement.style.display = 'none';
  } else {
    payCardElement.style.display = 'none';
  }
});

pay3Checkbox.addEventListener('change', function() {
  if (this.checked) {
    payCheckbox.checked = false;
    pay2Checkbox.checked = false;
    payBankElement.style.display = 'block';
	payCardElement.style.display = 'none';
	payCard2Element.style.display = 'none';
	kakaoElement.style.display = 'none';
	
  } else {
    payBankElement.style.display = 'none';
  }
});

</script>
<%
	 }   //  if-else���� ��
  }  catch(Exception e)  {
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