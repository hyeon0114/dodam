<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>ȸ������</title>

	
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
</center>


<div>
<div id="insertMT">

<div class="insertT">�ű� ȸ������</div>

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
                window.alert('��й�ȣ�� 6���� �̻�, 16���� ���ϸ� �̿� �����մϴ�.');
					document.getElementById('pw').value='';
					document.getElementById('pw2').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% �� Ư�����ڰ� �� ���� �ʽ��ϴ�.')
					document.getElementById('pw').value='';
					document.getElementById('pw2').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ�մϴ�.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
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
			<td>���̵�</td>
			<td ><input type=text name="id" id="boxStyle" size=40 placeholder="���̵� �Է����ּ���"> </td>
			<td> <div id="textbox"><a href="javascript:checkID()">�ߺ� Ȯ��</a></div></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td colspan=2><input type=password name="pwd" size=40 placeholder="��й�ȣ�� �Է����ּ���" id="pw" onchange="check_pw()"><br><span id="check" style="font-size:15px;"></span></td>
		</tr>
		<tr>
			<td>��й�ȣ Ȯ��</td>
			<td colspan=2><input type=password name="pwd2" size=40 placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���" id="pw2" onchange="check_pw()"></td>
		</tr>
		<tr>
			<td>����</td>
			<td colspan=2><input type=text name="name" id="boxStyle" size=40 placeholder="������ �Է����ּ���"></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><input type=text name="email"id="boxStyle" size=40 placeholder="�̸����� �Է����ּ���">
			</td>
			<td><div id="textbox"><a href="javascript:checkEmail()">�ߺ� Ȯ��</a></div></td>
		</tr>
	
		<tr>
			<td>�ּ�</td>
			
			<td colspan=2>
<input type="text" id="sample2_postcode" placeholder="�����ȣ" name="zipcode" >
<input type="button" onclick="sample2_execDaumPostcode()" value="�����ȣ ã��" id="boxstyle3" ><br>
<input type="text" id="sample2_address" placeholder="�ּ�" name="address1"><br>
<input type="text" id="sample2_detailAddress" placeholder="���ּ�" name="address2" >
<input type="text" id="sample2_extraAddress" placeholder="�����׸�">

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="�ݱ� ��ư">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // �����ȣ ã�� ȭ���� ���� element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample2_detailAddress").focus();

                // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
                // (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe�� ���� element�� ���̰� �Ѵ�.
        element_layer.style.display = 'block';

        // iframe�� ���� element�� ��ġ�� ȭ���� ����� �̵���Ų��.
        initLayerPosition();
    }

    // �������� ũ�� ���濡 ���� ���̾ ����� �̵���Ű���� �ϽǶ�����
    // resize�̺�Ʈ��, orientationchange�̺�Ʈ�� �̿��Ͽ� ���� ����ɶ����� �Ʒ� �Լ��� ���� ���� �ֽðų�,
    // ���� element_layer�� top,left���� ������ �ֽø� �˴ϴ�.
    function initLayerPosition(){
        var width = 300; //�����ȣ���񽺰� �� element�� width
        var height = 400; //�����ȣ���񽺰� �� element�� height
        var borderWidth = 5; //���ÿ��� ����ϴ� border�� �β�

        // ������ ������ ������ ���� element�� �ִ´�.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // ����Ǵ� ������ ȭ�� �ʺ�� ���� ���� �����ͼ� �߾ӿ� �� �� �ֵ��� ��ġ�� ����Ѵ�.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

			</td>
		</tr>
		<tr>
			<td>�޴���</td>
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
			<td>����</td>
			<td><input type="radio" name="sex" value="����" > �� &nbsp;&nbsp; &nbsp;  <input type="radio" name="sex" value="����" id="boxStyle2"> ��</td>
		</tr>
	</table>


	<div class="allergy">
		<div id="aTitle">������ �˷����⸦ �������ּ���</div>
	
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
	<input type=button id="onebtn3" value="�����ϱ�" onClick="signValue()"> 
	<input type=reset id="twoBtn3" value="��    ��">
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