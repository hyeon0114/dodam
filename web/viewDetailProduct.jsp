<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Expires" content="0"/>
		<title>���㵵��</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script language="javascript" src="js_package.js"></script>
</head>

<body>
<%
	String id =(String)session.getAttribute("sid");

if (id == null)
{ 
%>
<div id="header2">
<div class="menu2">
	<div id="logo2">
		<header class="top2"><a href="main.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap4">
        <nav>
            <ul>
                <li><a href="news.jsp">�ҽ�</a></li>
                <li><a href="Products.jsp">��ǰ</a></li>
				<li><a href="search.jsp">��ǰ �˷����� ���̵�</a></li>
                <li><a href="foru.jsp">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="login.jsp">�α���</a></li>
				<li><a href="insertMember.jsp">ȸ������</a></li>
            </ul>
        </nav>
</div>
<div id="menu_bar2" class="material-symbols-outlined" onclick="toggleNav()">menu</div>
</div>
</div>	

<%
}
else
{
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
}
%>

<%
 try{
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String pNo = request.getParameter("prdNo");

	String re = "revi";
	String qna = "qna";

	String jsql4 = "select * from ingredient where prdNo = ?";   
	PreparedStatement pstmt4  = con.prepareStatement(jsql4);
	pstmt4.setString(1, pNo);

	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();

	double serS = rs4.getDouble("serS");
	double Tser = rs4.getDouble("Tser");
	double cal = rs4.getDouble("cal");

	int serSP = (int) Math.round(serS);
	int ser = (int) Math.round(Tser);
	int calP = (int) Math.round(cal);

	double car = rs4.getDouble("car");
	double pro = rs4.getDouble("pro");
	double tFat = rs4.getDouble("tFat");
	double sod = rs4.getDouble("sod");
	double sug = rs4.getDouble("sug");
	double chol = rs4.getDouble("chol");

	double carP = (car / 108) * 100;
	int rcP = (int) Math.round(carP);
	double proP = (pro / 18.3) * 100;
	int rpP = (int) Math.round(proP);
	double tFatP = (tFat / 18) * 100;
	int rfP = (int) Math.round(tFatP);

	double sodP = (sod / 667) * 100;
	int rsP = (int) Math.round(sodP);
	double sugP = (sug / 33) * 100;
	int ruP = (int) Math.round(sugP);

	double cholP = (chol / 100) * 100;
	int rhP = (int) Math.round(cholP);

    String jsql = "select * from goods where prdNo = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, pNo);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

	String no = rs.getString("prdNo");
    String name =  rs.getString("prdName");	
	String price =  rs.getString("prdPrice");
	String ex =  rs.getString("prdEx");
	if (price.length() > 3) {
		String newPrice = price.substring(0, price.length() - 3)
			.concat(",")
			.concat(price.substring(price.length() - 3));
		price = newPrice;
		}
    int stock =  rs.getInt("prdStock");
%>

<br><br>
<center>

<script>
      $( document ).ready( function() {
        $( '#qty' ).change( function() {
			var a = $( '#qty' ).val();
			var b = $( '#b' ).val();
			if (a <= 0) {
				alert("���� ���� �� �����ϴ�.")
			} else{
				var ab = a * b;
				var formatted_ab = ab.toLocaleString(undefined, {minimumFractionDigits: 0});
				$( '#ab' ).text( formatted_ab );
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
        name : '<%=name%>',
        amount : '<%=price%>',
        buyer_email : 'dodam@gmail.com',
        buyer_name : '������',
        buyer_tel : '010-1234-4567',
        buyer_addr : '����Ư���� ������ �Ｚ��',
        buyer_postcode : '123-586',
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '������ �Ϸ�Ǿ����ϴ�.';
            location.href='mypage.jsp';
        } else {
            var msg = '������ �����Ͽ����ϴ�.';
            rsp.error_msg;
            
        }
    });
	}
</script>
	<form name="product"  method="post">   
	<input type=hidden name=prdNo  value="<%=no%>">
	<table id="product">
		<tr>
		     <td rowspan=16> <a href="javascript:enlarge()"><img src="image/f_img/<%=no%>.png"  id="productImg"></a></td>
			 
			 <td id="nameType" colspan=4><%=name%>
		     <span id="price3"><input type=hidden   value="<%=rs.getInt("prdPrice")%>" id="b"><%=price%>��</span></td>
		</tr>
		<tr><td id="detail_ex" colspan=4><%=ex%></td></tr>
		<tr>
		      <td colspan=4 id="all_pro">�˷����� ���� ��ǰ<br><br>
		<%
			String jsql2 = "select * from allgoods where prdNo = ?";   
			PreparedStatement pstmt2  = con.prepareStatement(jsql2);
			pstmt2.setString(1, pNo);

			ResultSet rs2 = pstmt2.executeQuery();
			while(rs2.next()){
				String allNo = rs2.getString("allergy");
				
				String jsql3 = "select * from allergy where allergy = ?";   
				PreparedStatement pstmt3  = con.prepareStatement(jsql3);
				pstmt3.setString(1, allNo);

				ResultSet rs3 = pstmt3.executeQuery();
				rs3.next();

				String allName = rs3.getString("allName");
		%>
			<b>&nbsp;<%=allName%>&nbsp;</b>
		<%
			}
		%>
			  </td>
		</tr>
		<tr><td colspan=4 id="border"></td><tr>
		<tr><td class="detail_b">�Ǹ� �߷�</td><td colspan=3><%=ser%> g</td></tr>
		<tr><td class="detail_b">�� Į�θ�</td><td colspan=3><%=calP%> kcal</td></tr>
		
		<tr><td colspan=4 class="border"></td><tr>
		<tr><td class="detail_b">������</td><td colspan=3><%=stock%> ��</td></tr>
		<tr><td colspan=4 class="border"></td><tr>
		<tr>
			  <td class="detail_b">����</td>
			  <td id="widthSize"><input type="number" name=qty value="1" id="qty" onblur="javascript:amountCheck();"> &nbsp;��</td>

			<td id="price" colspan=2><span id="price2">�� �ݾ�</span> <span id="ab"> <%=price%></b></span> ��</div>
			
		</tr>
		<tr>
			<td colspan=4>
			<div id="btn_view"> 
			<div id="btn_like" onClick=javascript:inLike(event)><span class="material-symbols-outlined">favorite</span></div>
			<input type="button" id="btn_cart" value="��ٱ���"  onClick=javascript:inCart(event)>
			<input type="button" id="btn_buy" value="�����ϱ�"  onClick=javascript:directOrd(event)></td>
			</div>
		</tr>

    </table>  

	</form>
<script>
    function ChangeImg() {
      document.getElementById("img").src = "images/notice.png";
    }
	function MainImg() {
      document.getElementById("img").src ="./images/<%=no%>_detail.png" ;
    }
</script>

<div class="detail_ingre"><img src="image/ingre_color.jpg">
<div class="detail_ingre2"><img src="image/ingre_infor2.jpg"></div>
</div>
<div id="detail_ingre">
<table>
	<tr>
		<td colspan="3" id="detail_t">���缺��ǥ</td><td colspan="4" align="right">1ȸ �������� [<span style="color:#344835; font-weight:600;"> <%=serSP%> g </span>] �ѳ� ���缺�� ����ġ�� ���� ����</td>
	</tr>
		<tr>
			<td id="ingre_P">ź��ȭ��</td>
			<td id="percent"><%=rcP%> % </td>
			<td>
			<div class="progress-bar">           
					<div class="progress" style="width: <%=rcP%>%; <% if(rcP < 85) { %> background-color:#ffcd28;<% } else if(rcP >= 85 && rcP < 100) { %>background-color: #446f56; <% } else if(rcP >= 100 && rcP <= 115){%>width: 100%; background-color:#446f46;<%} else if (rcP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
			<td></td>
			<td id="ingre_P">��Ʈ��</td>
			<td id="percent"><%=rsP%> % </td>
			<td>
			<div class="progress-bar">           
					<div class="progress" style="width: <%=rsP%>%; <% if(rsP < 85) { %> background-color:#ffcd28;<% } else if(rsP >= 85 && rsP < 100) { %>background-color: #446f56; <% } else if(rsP >= 100 && rsP <= 115){%>width: 100%; background-color:#446f46;<%} else if (rsP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
		</tr>
		<tr>
			<td id="ingre_P">�ܹ���</td>
			<td id="percent"><%=rpP%> %</td>
			<td>
			<div class="progress-bar">           
				<div class="progress" style="width: <%=rpP%>%; <% if(rpP < 85) { %> background-color: #ffcd28;<% } else if(rpP >= 85 && rpP < 100) { %>background-color: #446f56; <% } else if (rpP >= 100 && rpP <= 115){%>width: 100%; background-color:#446f56;<%} else if (rpP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
			<td></td>
			<td id="ingre_P">���</td>
			<td id="percent"><%=ruP%> % </td>
			<td>
			<div class="progress-bar">           
					<div class="progress" style="width: <%=ruP%>%; <% if(ruP < 85) { %> background-color:#ffcd28;<% } else if(ruP >= 85 && ruP < 100) { %>background-color: #446f56; <% } else if(ruP >= 100 && ruP <= 115){%>width: 100%; background-color:#446f46;<%} else if (ruP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
		</tr>
		<tr>
			<td id="ingre_P">����</td>
			<td id="percent"><%=rfP%> %</td>
			<td>
			<div class="progress-bar">           
				<div class="progress" style="width: <%=rfP%>%; <% if(rfP < 85) { %>background-color: #ffcd28;<% } else if(rfP >= 85 && rfP < 100) { %>background-color:  #446f56;<% } else if (rfP >= 100 && rfP <= 115){%>width: 100%; background-color: #446f56;<%} else if (rfP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
			<td></td>
			<td id="ingre_P">�ݷ����׷�</td>
			<td id="percent"><%=rhP%> %</td>
			<td>
			<div class="progress-bar">           
				<div class="progress" style="width: <%=rhP%>%; <% if(rhP < 85) { %>background-color: #ffcd28;<% } else if(rhP >= 85 && rhP < 100) { %>background-color:  #446f56;<% } else if (rhP >= 100 && rhP <= 115){%>width: 100%; background-color: #446f56;<%} else if (rhP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
		</tr>

</table>

</div>
<script>
function checkBack(){
		$("#tap a").click(function(){
			$("#tap nav ul li a").removeClass('on');
				$(this).addClass('on');
		});
}

$(document).ready(function(){
	$("#detail").load("detail_1.jsp?tap=<%=no%>");

$("#tap a").click(function(e){
	e.preventDefault();
		var jsp = $(this).data("jsp");
		$("#detail").load(jsp);
	});

	checkBack();
});
</script>
<div id="tap">
	<nav>
		<ul>
			<li><a href="#" data-jsp="detail_1.jsp?tap=<%=no%>" class="on">�� ����</a></li>
			<li><a href="#" data-jsp="detail_2.jsp?tap=<%=no%>">�� ����</a></li>
			<li><a href="#" data-jsp="board_list.jsp?prdNo=<%=no%>&type=<%=re%>" >��ǰ �ı�</a></li>
			<li><a href="#" data-jsp="board_list.jsp?prdNo=<%=no%>&type=<%=qna%>">��ǰ ����</a></li>
		</ul>
	</nav>
</div>

<div id="detail"></div>
<%
    } catch(Exception e) {
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
</center>
</body>
</html>