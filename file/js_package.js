// 메뉴바
function toggleNav2() {
  const nav = document.querySelector('#wrap nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu');
  nav2.classList.toggle('show');
}


function directOrd()        //  "즉시구매하기" 버튼을 클릭시 호출
{
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}


function inCart()              //  "장바구니담기" 버튼을 클릭시 호출
{
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}

function inLike()              //  "찜하기" 버튼을 클릭시 호출
{
	var frm = document.product;
	frm.action = "inLike.jsp";
	frm.submit();
}


// 주문창


function check_val()     
{
	if (document.form.memTel.value == "") 
	{
		alert("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.memTel.focus();
		return false;			
	}			

	if (document.form.receiver.value == "") 
	{
		alert("수령인 성명은 반드시 기입을 해야 합니다. ");
		document.form.receiver.focus();
		return false;			
	}

	if (document.form.rcvAddress.value == "") 
	{
		alert("수령인 주소는 반드시 기입을 해야 합니다. ");
		document.form.rcvAddress.focus();
		return false;			
	}

	if (document.form.rcvPhone.value == "") 
	{
		alert("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.rcvPhone.focus();
		return false;			
	}
 
	if (document.form.cardNo.value == "" && document.form.bank.value == 0 ) 
	{
		alert("결제방법 중 하나는 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

    	if (document.form.cardNo.value != "" && document.form.bank.value != 0 ) 
	{
		alert("결제방법 중 하나만 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

	if (document.form.cardNo.value != "" && document.form.cardPass.value == "" ) 
	{
		alert("카드 비밀번호는 반드시 기입을 해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

   	document.form.submit();
}



 function yncheck2(item){
	console.log(item);
	console.log(item.id);
	var checkbox = document.getElementById(item.id);
	var check1 = document.getElementById("a_"+item.id);
	console.log(checkbox.checked);
	checkbox.value = checkbox.checked ? "Y" : "N";

	 if (checkbox.checked) {
     document.querySelector('#l_'+item.id+' .circle5').classList.add('checked');
  } else {
     document.querySelector('#l_'+item.id+' .circle5').classList.remove('checked');
  }

} 


function resetCheckboxes() {
  var checkboxes = document.querySelectorAll('.check5');
  for(var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = false;
    checkboxes[i].value = "N";
    document.querySelector('#l_'+checkboxes[i].id+' .circle5').classList.remove('checked');
    checkboxes[i].removeAttribute('checked');
  }
}



function toggleNav() {
  const nav = document.querySelector('#wrap4 nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu2');
  nav2.classList.toggle('show2');
}

// enter 시 전송
function onEnterSubmit() 
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13) {document.login.submit();}
}

 function yncheck3(item){
	console.log(item);
	console.log(item.id);
	var checkbox = document.getElementById(item.id);
	var check1 = document.getElementById("a_"+item.id);
	console.log(checkbox.checked);
	checkbox.value = checkbox.checked ? "Y" : "N";

	 if (checkbox.checked) {
     document.querySelector('#l_'+item.id+' .circle3').classList.add('checked');
  } else {
     document.querySelector('#l_'+item.id+' .circle3').classList.remove('checked');
  }
} 

function resetCheckboxes2() {
  var checkboxes = document.querySelectorAll('.check3');
  for(var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = false;
    checkboxes[i].value = "N";
    document.querySelector('#l_'+checkboxes[i].id+' .circle3').classList.remove('checked');
    checkboxes[i].removeAttribute('checked');
  }
}

    function selectOnlyOne(id) {
        for (var i = 1; i <= 5; i++) {
            if ("ingre" + i != id) {
                document.getElementById("ingre" + i).checked = false;
            }
        }
    }




// 입력창이 빈칸일 경우 알림
function login_check()  
{
	if(document.login.id.value=="")
	{
    	alert("아이디를 입력해 주세요.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.pass.value=="")
	{
    	alert("비밀번호를 입력해 주세요.");
    	document.login.pass.focus();			
    	return;
    }
		
    document.login.submit();
}

function validateForm() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  var checked = Array.prototype.slice.call(checkboxes).some(x => x.checked);
  if (!checked) {
    alert("당신의 알레르기를 선택해주세요.");
    return false;
  }
  return true;
}

// 로그인 커서 위치설정
function login_focus() 
{
   	document.login.id.focus();
   	return;
}

// 회원가입창

function insertMember() 
{  				
	window.open("insertMember.jsp","win", "width=650, height=700, scrollbars=no, resizable=no");
} 

//아이디찾기 창
function findId() 
{  				
	window.open("findId.jsp","win", "width=550, height=370, scrollbars=no, resizable=no");
} 

//비밀번호찾기 창
function findPwd() 
{  				
	window.open("findPwd.jsp","win", "width=550, height=370, scrollbars=no, resizable=no");
} 

// 아이디 찾기 폼
function IDcheckValue()
{                                           

    if(findID.name.value == "") 
    {
		alert("성명을 입력해 주세요!");
		findID.name.focus();
		return;
    }

    if(findID.email.value == "") 
    {
		alert("이메일을 입력해주세요!");
		findID.email.focus();
		return;
    }
    findID.submit();
}
// enter 클릭 시 이동
function onEnterSubmitId()
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  findID.submit();
}


// 비밀번호 찾기 폼
function PwdcheckValue()
{
    if(findpwd.name.value == "")
    {
		alert("성명을 입력해 주세요!");
		findpwd.name.focus();
		return;
    }
    if(findpwd.id.value == "") 
    {
		alert("아이디를 입력해 주세요!");
		findpwd.id.focus();
		return;
    }
    findpwd.submit();
}
// enter 클릭 시 이동
function onEnterSubmitPwd()
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  findpwd.submit();
}


function signValue()  
{                                           
	if(newMem.id.value == "") 
    {
		alert("아이디를 입력해 주세요!");  
		newMem.id.focus();	  
		return; 
    }

    if(newMem.pwd.value == "") 
    {
		alert("비밀번호를 입력해 주세요!");
		newMem.pwd.focus();
		return;
    }

	 if(newMem.email.value == "") 
    {
		alert("이메일을 입력해 주세요!");
		newMem.email.focus();
		return;
    }

    if(newMem.name.value == "") 
    {
		alert("성명을 입력해 주세요!");
		newMem.name.focus();
		return;
    }

    if(newMem.address1.value == "") 
    {
		alert("집주소를 입력해 주세요! - (우편번호검색 버튼 클릭)");
		newMem.address1.focus();
		return;
    }

    if(newMem.address2.value == "") 
    {
		alert("상세주소를 입력해 주세요!");
		newMem.address2.focus();
		return;
    }

	if(newMem.hp2.value == "")
	{
		alert("전화번호를 입력해 주세요!");
		newMem.hp2.focus();
		return;
	}
	if(newMem.hp3.value == "")
	{
		alert("전화번호를 입력해 주세요!");
		newMem.hp3.focus();
		return;
	}
    newMem.submit();
}

// 연락처 최대 입력 수 설정
  function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }

function checkID()
{ 
	var id = newMem.id.value;	

    if (id  == "")
	{
		alert("ID를 입력해 주세요!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}

// 이메일 중복 확인
function checkEmail()
{ 
	var email = newMem.email.value;	

    if (email  == "")
	{
		alert("이메일를 입력해 주세요!"); 
		newMem.email.focus(); 
		return; 
    }

	window.open("checkEmail.jsp?email="+email,"win", "width=255, height=145, scrollbars=no, resizable=no");
}

// 우편번호 검색
function zipCheck()
{
	window.open("zipCheck.jsp", "newwin", "width=600, height=200, scrollbars=yes, status=yes");
}

function idFocus() 
{
	newMem.id.focus();
	return;
}


function yncheck(item) {
  var checkbox = document.getElementById(item.id);
  var check1 = document.getElementById("a_" + item.id);
  console.log(checkbox.checked);
  checkbox.value = checkbox.checked ? "Y" : "N";

  if (checkbox.checked) {
    document.querySelector('#l_' + item.id + ' .circle4').classList.add('checked');
  } else {
    document.querySelector('#l_' + item.id + ' .circle4').classList.remove('checked');
  }

  if (item.id === 'allergy0') {
    // If #allergy0 was clicked
    var checkboxes = document.querySelectorAll('.check4');
    checkboxes.forEach((otherCheckbox) => {
      if (otherCheckbox !== checkbox) {
        otherCheckbox.checked = false;
        otherCheckbox.value = 'N';
        document.querySelector('#l_' + otherCheckbox.id + ' .circle4').classList.remove('checked');
		console.log(otherCheckbox.checked);
		}
    });
  } else {
    // If a checkbox other than #allergy0 was clicked
    var allergy0 = document.getElementById('allergy0');
    allergy0.checked = false;
    allergy0.value = 'N';
    document.querySelector('#l_' + allergy0.id + ' .circle4').classList.remove('checked');
  console.log(allergy0.checked);
  }
  console.log(item);
  console.log(item.id);
}



function directOrd()        //  "즉시구매하기" 버튼을 클릭시 호출
{
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}


function inCart()              //  "장바구니담기" 버튼을 클릭시 호출
{
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}

function inLike()              //  "찜하기" 버튼을 클릭시 호출
{
	var frm = document.product;
	frm.action = "inLike.jsp";
	frm.submit();
}


