// �޴���
function toggleNav2() {
  const nav = document.querySelector('#wrap nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu');
  nav2.classList.toggle('show');
}


function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
{
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}


function inCart()              //  "��ٱ��ϴ��" ��ư�� Ŭ���� ȣ��
{
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}

function inLike()              //  "���ϱ�" ��ư�� Ŭ���� ȣ��
{
	var frm = document.product;
	frm.action = "inLike.jsp";
	frm.submit();
}


// �ֹ�â


function check_val()     
{
	if (document.form.memTel.value == "") 
	{
		alert("�ֹ��� ��ȭ��ȣ�� �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.memTel.focus();
		return false;			
	}			

	if (document.form.receiver.value == "") 
	{
		alert("������ ������ �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.receiver.focus();
		return false;			
	}

	if (document.form.rcvAddress.value == "") 
	{
		alert("������ �ּҴ� �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.rcvAddress.focus();
		return false;			
	}

	if (document.form.rcvPhone.value == "") 
	{
		alert("������ ��ȭ��ȣ�� �ݵ�� ������ �ؾ� �մϴ�. ");
		document.form.rcvPhone.focus();
		return false;			
	}
 
	if (document.form.cardNo.value == "" && document.form.bank.value == 0 ) 
	{
		alert("������� �� �ϳ��� �����ؾ� �մϴ�. ");
		document.form.cardNo.focus();
		return false;			
	}

    	if (document.form.cardNo.value != "" && document.form.bank.value != 0 ) 
	{
		alert("������� �� �ϳ��� �����ؾ� �մϴ�. ");
		document.form.cardNo.focus();
		return false;			
	}

	if (document.form.cardNo.value != "" && document.form.cardPass.value == "" ) 
	{
		alert("ī�� ��й�ȣ�� �ݵ�� ������ �ؾ� �մϴ�. ");
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

// enter �� ����
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




// �Է�â�� ��ĭ�� ��� �˸�
function login_check()  
{
	if(document.login.id.value=="")
	{
    	alert("���̵� �Է��� �ּ���.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.pass.value=="")
	{
    	alert("��й�ȣ�� �Է��� �ּ���.");
    	document.login.pass.focus();			
    	return;
    }
		
    document.login.submit();
}

function validateForm() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  var checked = Array.prototype.slice.call(checkboxes).some(x => x.checked);
  if (!checked) {
    alert("����� �˷����⸦ �������ּ���.");
    return false;
  }
  return true;
}

// �α��� Ŀ�� ��ġ����
function login_focus() 
{
   	document.login.id.focus();
   	return;
}

// ȸ������â

function insertMember() 
{  				
	window.open("insertMember.jsp","win", "width=650, height=700, scrollbars=no, resizable=no");
} 

//���̵�ã�� â
function findId() 
{  				
	window.open("findId.jsp","win", "width=550, height=370, scrollbars=no, resizable=no");
} 

//��й�ȣã�� â
function findPwd() 
{  				
	window.open("findPwd.jsp","win", "width=550, height=370, scrollbars=no, resizable=no");
} 

// ���̵� ã�� ��
function IDcheckValue()
{                                           

    if(findID.name.value == "") 
    {
		alert("������ �Է��� �ּ���!");
		findID.name.focus();
		return;
    }

    if(findID.email.value == "") 
    {
		alert("�̸����� �Է����ּ���!");
		findID.email.focus();
		return;
    }
    findID.submit();
}
// enter Ŭ�� �� �̵�
function onEnterSubmitId()
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  findID.submit();
}


// ��й�ȣ ã�� ��
function PwdcheckValue()
{
    if(findpwd.name.value == "")
    {
		alert("������ �Է��� �ּ���!");
		findpwd.name.focus();
		return;
    }
    if(findpwd.id.value == "") 
    {
		alert("���̵� �Է��� �ּ���!");
		findpwd.id.focus();
		return;
    }
    findpwd.submit();
}
// enter Ŭ�� �� �̵�
function onEnterSubmitPwd()
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  findpwd.submit();
}


function signValue()  
{                                           
	if(newMem.id.value == "") 
    {
		alert("���̵� �Է��� �ּ���!");  
		newMem.id.focus();	  
		return; 
    }

    if(newMem.pwd.value == "") 
    {
		alert("��й�ȣ�� �Է��� �ּ���!");
		newMem.pwd.focus();
		return;
    }

	 if(newMem.email.value == "") 
    {
		alert("�̸����� �Է��� �ּ���!");
		newMem.email.focus();
		return;
    }

    if(newMem.name.value == "") 
    {
		alert("������ �Է��� �ּ���!");
		newMem.name.focus();
		return;
    }

    if(newMem.address1.value == "") 
    {
		alert("���ּҸ� �Է��� �ּ���! - (�����ȣ�˻� ��ư Ŭ��)");
		newMem.address1.focus();
		return;
    }

    if(newMem.address2.value == "") 
    {
		alert("���ּҸ� �Է��� �ּ���!");
		newMem.address2.focus();
		return;
    }

	if(newMem.hp2.value == "")
	{
		alert("��ȭ��ȣ�� �Է��� �ּ���!");
		newMem.hp2.focus();
		return;
	}
	if(newMem.hp3.value == "")
	{
		alert("��ȭ��ȣ�� �Է��� �ּ���!");
		newMem.hp3.focus();
		return;
	}
    newMem.submit();
}

// ����ó �ִ� �Է� �� ����
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
		alert("ID�� �Է��� �ּ���!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}

// �̸��� �ߺ� Ȯ��
function checkEmail()
{ 
	var email = newMem.email.value;	

    if (email  == "")
	{
		alert("�̸��ϸ� �Է��� �ּ���!"); 
		newMem.email.focus(); 
		return; 
    }

	window.open("checkEmail.jsp?email="+email,"win", "width=255, height=145, scrollbars=no, resizable=no");
}

// �����ȣ �˻�
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



function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
{
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}


function inCart()              //  "��ٱ��ϴ��" ��ư�� Ŭ���� ȣ��
{
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}

function inLike()              //  "���ϱ�" ��ư�� Ŭ���� ȣ��
{
	var frm = document.product;
	frm.action = "inLike.jsp";
	frm.submit();
}


