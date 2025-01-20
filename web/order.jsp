<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>주문하기</title>

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
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="showLike.jsp?id=<%=id%>">찜한상품</a></li>
		<li><a href="showCart.jsp?id=<%=id%>">장바구니</a></li>
		<li><a href="center.jsp?id=<%=id%>">고객센터</a></li>
	</ul>
</div>

<div class="menu">
	<div id="logo">
		<header class="top"><a href="main_M.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap">
        <nav>
            <ul>
                <li><a href="news.jsp">소식</a></li>
               	<li><a href="Products.jsp">상품</a></li>
				<li><a href="search.jsp">식품 알레르기 가이드</a></li>
            	<li><a href="foru_2.jsp?id=<%=id%>">식품 알레르기 맞춤 상품</a></li>
				<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>
<% 
try { 
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";    // 접속 DB는 project
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
		var errorMessage = "상품이 비어있습니다.";
        alert(errorMessage);
        window.location.href = "Products.jsp";
	</script>
<%
	}
	else
	{
%>
	<br>
<div id="title_order">상품 주문서</div>

<div class="title_order">주문 상품</div>

<table id="order_t">
<tr>       
   <td>상품번호</td>
   <td>상품명</td>       
   <td>상품단가(원)</td>       
   <td>주문수량(개)</td>  
   <td>주문액(원)</td>  
   <td>상품삭제</td>
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
	<td><%=price%> 원</td> 
	<td><%=ctQty%></td>
    <td><%=amount2%> 원</td>  
    <td><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><div id="deleteBtn2">삭제</div></a></td> 
  </tr>   
<%
	     }  // while문의 끝

		String total2 = Integer.toString(total);
		if (total2.length() > 3) {
		String newtotal = total2.substring(0, total2.length() - 3)
			.concat(",")
			.concat(total2.substring(total2.length() - 3));
		total2 = newtotal;
		} 
 %>
  <tr>
	<td colspan = 4 id="allText2">전체 주문총액</td>
	<td id="allPrice2"><%=total2%> 원</td>
	<td>(선택물품 총합)</td>
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
			alert("총 금액 이상의 포인트를 사용할 수 없습니다");
		  } else if( B > C ) {
			  alert("보유 중인 포인트 이상의 포인트를 사용할 수 없습니다");
		  } else{
			var ab = A - B;
          $( '#ab' ).text( ab+" 원" );
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
        name : '<%=pName%> 외 <%=count%>',
        amount : '<%=total2%>',
        buyer_email : '<%=email%>',
        buyer_name : '<%=name%>',
        buyer_tel : '<%=tel%>',
        buyer_addr : '<%=adr%>',
        buyer_postcode : '123-586',
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            location.href='mypage.jsp';
			var form = document.querySelector('#form_buy');
            form.submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });

	}
</script>
<%
	}
%>
<form name="form" id="form_buy" method="Post" action="orderOk.jsp">

<div class="title_order">포인트 사용</div>
<table id="orderMember">
	<tr>
		<td>보유 중인 포인트</td>
		<td><input type="hidden" class="inputType" id="c" value="<%=point%>"><%=point%> P</td>
	</tr>
	<tr>
		<td>포인트</td>
		<td><input type="number" name="point" class="inputType" id="b" value="0"></td>
	</tr>
</table>

<div class="title_order">주문자 정보</div>
<table id="orderMember">
	<tr>
		<td>이 름</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>전 화</td>
		<td><input type="text" name="memTel" class="inputType" value=<%=tel%>></td>
	</tr>
</table>

<div class="title_order">주문자 정보</div>
<table  id="orderMember">
	<tr>
		<td>이 름</td>
		<td><input type="text" name="receiver" class="inputType" value=<%=name%>></td>
	</tr>
	<tr>
		<td>주 소</td>
		<td><input type="text" name="rcvAddress" class="inputType" value="<%=adr%>"></td>
	</tr>
	<tr>
		<td>전 화</td>
		<td><input type="text" name="rcvPhone" class="inputType" value=<%=tel%>></td>
	</tr>
</table>

<div class="title_order">결제 방법</div>
<table id="orderMember">
	<tr>
		<td>결제수단</td>
		<td colspan=2>
		
		<label for="pay"><input type="checkbox" name="bank" id="pay" class="kakao1"><span class="pay">KakaoPay</span></label>

		<label for="pay2"><input type="checkbox" id="pay2" class="kakao1"><span class="pay">신용카드결제</span></label>
		
		<label for="pay3"><input type="checkbox" id="pay3" class="kakao1"><span class="pay">무통장입급</span></label>
		</td>
	</tr>

	<tr id="pay_tr">
		<td>결제방법</td>
		<td>
		<input type="text" name="cardNo" id="pay_card" class="inputType2">
		<select name="bank" class="inputType" id="pay_bank">
			<option value="0" selected>다음 중 선택</option>
            <option value="우리은행">우리은행 ( 324-01-123400 / (주)도담도담쇼핑몰)</option>
            <option value="국민은행">국민은행 ( 011-02-300481 / (주)도담도담쇼핑몰)</option>
            <option value="외환은행">외환은행 ( 327-56-333002 / (주)도담도담쇼핑몰)</option>
            <option value="신한은행">신한은행 ( 987-25-202099 / (주)도담도담쇼핑몰)</option>
            <option value="하나은행">하나은행 ( 698-00-222176 / (주)도담도담쇼핑몰)</option>
		</select>
		</td>

		<td>
		<input type="text" name="cardPass" id="pay_card2" class="inputType2">
		</td>
	</tr>
</table>

<table id="total">
	<tr>
		<td>총 상품가격 <b><input type="hidden" name="pay" value="<%=total%>" id="a"><%=total2%>원</b> + 총 배송비 <b>0원</b> = 총 주문 금액 <b id="ab"><%=total2%>원</b></td> 
	</tr>
</table>

<table class="btn3">
	<tr>
		<td><input type="reset" value="주문 취소" name="reset"  id="btn5"></td>
		<td><input type = "button" value = "결제하기"  OnClick="check_val()" id="btn4"></td> 
		
	</tr>
</table>

</form>  
		<div id="kakaopay"><button onclick="requestPay()" class="kakao">결제하기</button></div>

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
	 }   //  if-else문의 끝
  }  catch(Exception e)  {
        out.println(e);
} 
%>

<div id="mainPage">

	<div id="footer"><div class="footer"><br>
			<div id="fLeft">
				<p><span class="footer_Fm"><a href="center.jsp">고객센터</a></span></p>
				  <ul>
					  <li><span class="footer_F"> 운영시간</span> 08:00am ~ 18:00pm </li>
					  <li><span class="footer_F"> 점심시간</span> 12:30pm ~ 13:30pm </li>
					  <li><span class="footer_F"> 고객센터 휴무</span> 주말, 공휴일 </li>
				  </ul>
			</div>
			<br><br><br>
			<div id="fRight">
			<div id="fRx"><a href="privacy.jsp"><b>개인정보처리방침</b></a> | <a href="news.jsp">회사소개</a> | <a href="sitemap.jsp">사이트맵</a>  | <a href="manager/manager_login.jsp">관리자 로그인</a></div>
				<ul>
				<li>법인명 (상호) : 도담도담(주) | 대표: 김세현 | 전화: 1577-1659</li>
				<li>사업자등록번호 : 150-72-35764 [사업자정보확인]</li>
				<li>개인정보관리책임자 : 김세현, 조현경</li>
				</ul>
			</div>
			</div>
	
	</div></div>
</div>
       
</body>
</html> 