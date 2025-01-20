<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>회원가입</title>

<link rel="stylesheet" href="style.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>


<body onLoad="idFocus()">
<div id="header2">
<div class="menu2">
	<div id="logo2">
		<header class="top2"><a href="main.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap4">
        <nav>
            <ul>
                <li><a href="news.jsp">소식</a></li>
                <li><a href="Products.jsp">상품</a></li>
				<li><a href="search.jsp">식품 알레르기 가이드</a></li>
                <li><a href="foru.jsp">식품 알레르기 맞춤 상품</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li style="background-color:#344835;"><a href="insertMember.jsp" style="color:white;">회원가입</a></li>
            </ul>
        </nav>
</div>
<div id="menu_bar2" class="material-symbols-outlined" onclick="toggleNav()">menu</div>
</div>
</div>	

<div id="insertbody">
<div id="insertMT">

<div class="insertT">신규 회원가입</div>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

%>
   <script>
        function check_pw(){
 
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 6 || pw.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
					document.getElementById('pw').value='';
					document.getElementById('pw2').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
					document.getElementById('pw').value='';
					document.getElementById('pw2').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
					document.getElementById('pw').value='';
					document.getElementById('pw2').value='';
                }
            }
        }
    </script>
<form name="newMem" method=post action="insertMemberResult.jsp">
	<table id="insertTable">
		<tr>
			<td>아이디</td>
			<td ><input type=text name="id" id="boxStyle" size=40 placeholder="아이디를 입력해주세요"> </td>
			<td> <div id="textbox"><a href="javascript:checkID()">중복 확인</a></div></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan=2><input type=password name="pwd" size=40 placeholder="비밀번호를 입력해주세요" id="pw" onchange="check_pw()"><br><span id="check" style="font-size:15px;"></span></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td colspan=2><input type=password name="pwd2" size=40 placeholder="비밀번호를 한번 더 입력해주세요" id="pw2" onchange="check_pw()"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td colspan=2><input type=text name="name" id="boxStyle" size=40 placeholder="성명을 입력해주세요"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type=text name="email"id="boxStyle" size=40 placeholder="이메일을 입력해주세요">
			</td>
			<td><div id="textbox"><a href="javascript:checkEmail()">중복 확인</a></div></td>
		</tr>
	
		<tr>
			<td>주소</td>
			
			<td colspan=2>
<input type="text" id="sample2_postcode" placeholder="우편번호" name="zipcode" >
<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" id="boxstyle3" ><br>
<input type="text" id="sample2_address" placeholder="주소" name="address1"><br>
<input type="text" id="sample2_detailAddress" placeholder="상세주소" name="address2" >
<input type="text" id="sample2_extraAddress" placeholder="참고항목">

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
 
                var addr = ''; // 주소 변수
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){

                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
   
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
  
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

    
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
     
                document.getElementById("sample2_detailAddress").focus();
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        element_layer.style.display = 'block';

        initLayerPosition();
    }
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';

        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

			</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td colspan=2>
				<select name="hp1" id="boxStyle1">
						<option value="010" selected>010
						<option value="011">011
						<option value="016">016
						<option value="017">017
						<option value="018">018
						<option value="019">019
				</select> -
				<input type="number" name="hp2" size=11 id="boxStyle1" maxlength="4" oninput="maxLengthCheck(this)"> -
				<input type="number" name="hp3" size=11 id="boxStyle1" maxlength="4" oninput="maxLengthCheck(this)">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="sex" value="남자" > 남 &nbsp;&nbsp; &nbsp;  <input type="radio" name="sex" value="여자" id="boxStyle2"> 여</td>
		</tr>
	</table>


	<div class="allergy">
		<div id="aTitle">본인의 알레르기를 선택해주세요</div>
	
<%
		 String jsql = "SELECT * FROM allergy" ;
		 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 
		 ResultSet  rs = pstmt.executeQuery();
		
		while(rs.next()) {
				String no = rs.getString("allergy");
				String name =  rs.getString("allName");	
%>	
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check4" onchange="yncheck(this)" name="allergy<%=no%>">
				<span class="circle4"><%=name%></span>
			</label>
<%
    }
%>
</div>
<div class="insertbtn">
	<input type=button id="onebtn3" value="가입하기" onClick="signValue()"> 
	<input type=reset id="twoBtn3" value="취    소">
</div>
</form>
<%
	} catch (Exception e) {
		  out.println(e);	
}
%>
	</div>
	</div>


<div id="insertbtn"></div>

<div id="mainPage2">

	<div id="footer2"><div class="footer"><br>
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