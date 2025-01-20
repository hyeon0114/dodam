<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>��ǰ���</title>
	
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
<div id="manager_title">��ǰ ���</div>
<div>

<form method="post" action="insertGoodsResult.jsp?#title" >
 <div id="root">
  <h2 class="title">File Upload</h2>
  <hr>
  <div class="contents">
    <div class="upload-box">
      <div id="drop-file" class="drag-file">
        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="���� ������" class="image" >
        <p class="message">Drag files to upload</p>
        <img src="" alt="�̸����� �̹���" class="preview">
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
			<td>ī�װ�</td>
			<td>		
			     <select name="ctg" id="ctg2">
			        <option value="k">�ѽ�</option>
	        		<option value="j">�Ͻ�</option>
					<option value="c">�߽�</option>
					<option value="a">���</option>
					<option value="d">����Ʈ</option>
		         </select>
			 </td>
		</tr>
		<tr>
			<td>��ǰ��ȣ</td>
			<td><input type="text" name="no"></td>
		</tr>
		<tr>
			<td>��ǰ��</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>��ǰ����</td>
			<td><textarea cols="42" rows="2" name="ex" id="textarea"></textarea></td>
		</tr>
		<tr>
			<td>��ǰ����</td>
			<td><input type="text" name="price"> ��</td>
		</tr>
		<tr>
			<td>������</td>
			<td><input type="text" name="stock"> ��</td>
		</tr>
		<tr>
			<td>��ü��ǰ��ȣ</td>
			<td><input type="text" name="sub"></td>
		</tr>
</table>
</div>
	<div class="allergy">
		<div id="aTitle">��ǰ �˷�����</div>
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
		<td colspan="2">���缺��ǥ</td>
	</tr>
	<tr>
		<td>1ȸ ������</td><td><input type="text" step="0.01" name="one"> g</td>
	</tr>
	<tr>
		<td>�� ������</td><td><input type="number" step="0.01"  name="total"> g</td>
	</tr>
	<tr>
		<td>����</td><td><input type="number" step="0.01"  name="cal"> kcal</td>
	</tr>
	<tr>
		<td>ź��ȭ��</td><td><input type="number" step="0.01"  name="car"> g</td>
	</tr>
	<tr>
		<td>���</td><td><input type="number" step="0.01"  name="sugar"> g</td>
	</tr>
	<tr>
		<td>�ܹ���</td><td><input type="number" step="0.01"  name="protein"> g</td>
	</tr>
	<tr>
		<td>����</td><td><input type="number" step="0.01"  name="tFat"> g</td>
	</tr>
	<tr>
		<td>��ȭ����</td><td><input type="number" step="0.01"  name="sFat"> g</td>
	</tr>
	<tr>
		<td>Ʈ��������</td><td><input type="number" step="0.01"  name="trans"> g</td>
	</tr>
	<tr>
		<td>�ݷ����׷�</td><td><input type="number" step="0.01"  name="choles"> mg</td>
	</tr>
	<tr>
		<td>��Ʈ��</td><td><input type="number" step="0.01"  name="sodium"> mg</td>
	</tr>
</table>
</div>

<br><br>
<div id="deleteT">
<input type="submit" value="��ǰ���" id="onebtn3">
<input type="reset" value="���" id="twoBtn3">
</div>
</form>
</div>
</body>
</html>

