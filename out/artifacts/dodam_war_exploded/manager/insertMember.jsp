<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>회원가입</title>

	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>
</head>

<body onLoad="idFocus()">
<center>

<%
	String sid = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	접속관리자 ID : <font color="green"><%=sid%></font> &nbsp;&nbsp;|&nbsp;&nbsp; 접속 시각 : <font color="green"><%=curDate %></font> 
</div>
<div class="logout">
	<a href="../logout.jsp" target=_parent >관리자 로그아웃</a>
	<a href="../main.jsp" target=_parent >도담도담</a>
</div>

<div id="managerT">관리자 모드</div>

<div id="menu">
	<ul>
		<li>
			<a href="selectAllMember.jsp" target=main>회원 관리</a>
			<ul>
				<li><a href="insertMember.jsp" target=main>신규 회원 등록</a></li>
				<li><a href="selectAllMember.jsp" target=main>회원 조회/수정/삭제</a></li>
			</ul>
		</li>
		<li>
			<a href="selectAllGoods.jsp" target=main>상품 관리</a>
			<ul>
				<li><a href="insertGoods.jsp" target=main>신규 상품 등록</a></li>
				<li><a href="selectAllGoods.jsp" target=main>상품 조회/수정/삭제</a></li>
			</ul>
		</li>
		<li>
			<a href="orderInfo.jsp" target=main>주문 관리</a>
			<ul>
				<li><a href="orderInfo.jsp" target=main>주문정보 조회/수정/삭제</a></li>
				<li><a href="orderProduct.jsp" target=main>주문상품 조회/수정/삭제</a></li>
			</ul>
		</li>
	</ul>
</div>

</div>
</center>


<div>
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
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
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

</body>
</html>