<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>상품등록</title>
	
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
<div id="manager_title">상품 등록</div>
<div>

<form method="post" action="insertGoodsResult.jsp?#title" >
 <div id="root">
  <h2 class="title">File Upload</h2>
  <hr>
  <div class="contents">
    <div class="upload-box">
      <div id="drop-file" class="drag-file">
        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
        <p class="message">Drag files to upload</p>
        <img src="" alt="미리보기 이미지" class="preview">
      </div>
      <label class="file-label" for="chooseFile">Choose File</label>
      <input class="file" id="chooseFile" name="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
    </div>
  </div>
</div>

<script>
function DropFile(dropAreaId, fileListId) {
  let dropArea = document.getElementById(dropAreaId);
  let fileList = document.getElementById(fileListId);

  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  function highlight(e) {
    preventDefaults(e);
    dropArea.classList.add("highlight");
  }

  function unhighlight(e) {
    preventDefaults(e);
    dropArea.classList.remove("highlight");
  }

  function handleDrop(e) {
    unhighlight(e);
    let dt = e.dataTransfer;
    let files = dt.files;

    handleFiles(files);

    const fileList = document.getElementById(fileListId);
    if (fileList) {
      fileList.scrollTo({ top: fileList.scrollHeight });
    }
  }

  function handleFiles(files) {
    files = [...files];
    // files.forEach(uploadFile);
    files.forEach(previewFile);
  }

  function previewFile(file) {
    console.log(file);
    renderFile(file);
  }

  function renderFile(file) {
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onloadend = function () {
      let img = dropArea.getElementsByClassName("preview")[0];
      img.src = reader.result;
      img.style.display = "block";
    };
  }

  dropArea.addEventListener("dragenter", highlight, false);
  dropArea.addEventListener("dragover", highlight, false);
  dropArea.addEventListener("dragleave", unhighlight, false);
  dropArea.addEventListener("drop", handleDrop, false);

  return {
    handleFiles
  };
}

const dropFile = new DropFile("drop-file", "files");
</script>

<div id="insert">
<table id="Intable">
		<tr>
			<td>카테고리</td>
			<td>		
			     <select name="ctg" id="ctg2">
			        <option value="k">한식</option>
	        		<option value="j">일식</option>
					<option value="c">중식</option>
					<option value="a">양식</option>
					<option value="d">디저트</option>
		         </select>
			 </td>
		</tr>
		<tr>
			<td>상품번호</td>
			<td><input type="text" name="no"></td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea cols="42" rows="2" name="ex" id="textarea"></textarea></td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td><input type="text" name="price"> 원</td>
		</tr>
		<tr>
			<td>재고수량</td>
			<td><input type="text" name="stock"> 개</td>
		</tr>
		<tr>
			<td>대체식품번호</td>
			<td><input type="text" name="sub"></td>
		</tr>
</table>
</div>
	<div class="allergy">
		<div id="aTitle">상품 알레르기</div>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		 String jsql = "SELECT * FROM allergy" ;
		 PreparedStatement pstmt = con.prepareStatement(jsql);
	 
		 ResultSet  rs = pstmt.executeQuery();
		
		while(rs.next()) {
				String no = rs.getString("allergy");
				String name =  rs.getString("allName");	
%>	
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check0" onchange="yncheck(this)" name="allergy<%=no%>">
				<span class="circle"><%=name%></span>
			</label>
<%
    }
	} catch (Exception e) {
		  out.println(e);	
}
%>
<div id="ingre">

<table class="ingre">
	<tr>
		<td colspan="2">영양성분표</td>
	</tr>
	<tr>
		<td>1회 제공량</td><td><input type="text" step="0.01" name="one"> g</td>
	</tr>
	<tr>
		<td>총 제공량</td><td><input type="number" step="0.01"  name="total"> g</td>
	</tr>
	<tr>
		<td>열량</td><td><input type="number" step="0.01"  name="cal"> kcal</td>
	</tr>
	<tr>
		<td>탄수화물</td><td><input type="number" step="0.01"  name="car"> g</td>
	</tr>
	<tr>
		<td>당류</td><td><input type="number" step="0.01"  name="sugar"> g</td>
	</tr>
	<tr>
		<td>단백질</td><td><input type="number" step="0.01"  name="protein"> g</td>
	</tr>
	<tr>
		<td>지방</td><td><input type="number" step="0.01"  name="tFat"> g</td>
	</tr>
	<tr>
		<td>포화지방</td><td><input type="number" step="0.01"  name="sFat"> g</td>
	</tr>
	<tr>
		<td>트랜스지방</td><td><input type="number" step="0.01"  name="trans"> g</td>
	</tr>
	<tr>
		<td>콜레스테롤</td><td><input type="number" step="0.01"  name="choles"> mg</td>
	</tr>
	<tr>
		<td>나트륨</td><td><input type="number" step="0.01"  name="sodium"> mg</td>
	</tr>
</table>
</div>

<br><br>
<div id="deleteT">
<input type="submit" value="상품등록" id="onebtn3">
<input type="reset" value="취소" id="twoBtn3">
</div>
</form>
</div>
</body>
</html>

