//																 //
// ***********************login �α���â************************** //
//																 //

// enter �� ����
function onEnterSubmit() 
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13) {document.login.submit();}
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
	window.open("findId.jsp","win", "width=550, height=500, scrollbars=no, resizable=no");
} 

//��й�ȣã�� â
function findPwd() 
{  				
	window.open("findPwd.jsp","win", "width=550, height=500, scrollbars=no, resizable=no");
} 


//																 //
// ******************** insertmember ȸ������â ****************** //
//																//
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

// �˷��� ����Ʈ ���
  function createAllergyList(){
	  
  }
  
  function yncheck(item){
	console.log(item);
	console.log(item.id);
	var checkbox = document.getElementById(item.id);
	var check1 = document.getElementById("a_"+item.id);
	console.log(checkbox.checked);
	checkbox.value = checkbox.checked ? "Y" : "N";

	 if (checkbox.checked) {
     document.querySelector('#l_'+item.id+' .circle').classList.add('checked');
  } else {
     document.querySelector('#l_'+item.id+' .circle').classList.remove('checked');
  }
 } 


//																//
// ************************ main ����ȭ�� ************************//
//																//

// �˷����� ���� â
  function modalshow(){
	    document.getElementById("modal_opne_btn").onclick = function() {
        document.getElementById("cont_2_M").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("cont_2_M").style.display="none";
    }   
  }


 function yncheck2(item){
	console.log(item);
	console.log(item.id);
	var checkbox = document.getElementById(item.id);
	var check1 = document.getElementById("a_"+item.id);
	console.log(checkbox.checked);
	checkbox.value = checkbox.checked ? "Y" : "N";

	 if (checkbox.checked) {
     document.querySelector('#l_'+item.id+' .circle').classList.add('checked');
  } else {
     document.querySelector('#l_'+item.id+' .circle').classList.remove('checked');
  }
} 

 function yncheck3(item){
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

function amountCheck()     //   �ֹ������� ��ȿ�� ���� ������ ó���� ��
{
	obj=document.product.qty;
	if(isNaN(obj.value))          //    isNaN(a)�Լ��� a�� ���ڰ� �ƴ� ���, true�� return����
	{
		obj.value="1";
		alert('���ڸ� �Է����ּ���');
		return;
	}

   if(obj.value < 1)
	{
		obj.value="1";
	}
}


 function loadPage(event, url) {
    event.preventDefault();
    $("#main_div").load(url, function() {
      $('html, body').animate({
        scrollTop: $("#mainTop").offset().top
      }, 300);
	});
  }

function resizeIframe(obj){ 
	obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px' ; 
	}


// �˷����� ���� â
  function searchshow(){
	const searchInput = document.getElementById("searchType");
	const searchFilter = document.getElementById("search");

	searchInput.addEventListener("click", function() {

	  const xhr = new XMLHttpRequest();
	  xhr.open("GET", "searchTap.jsp");
	  xhr.onload = function() {
		if (xhr.status === 200) {
		  searchFilter.innerHTML = xhr.responseText;
		  searchFilter.style.display = "block";
		}
	  };
	  xhr.send();
	});

	searchInput.addEventListener("mouseleave", function() {
	  searchFilter.style.display = "none";
	});
	searchFilter.addEventListener("mouseleave", function() {
	  searchFilter.style.display = "none";
	});
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


    function selectOnlyOne(id) {
        for (var i = 1; i <= 3; i++) {
            if ("ingre" + i != id) {
                document.getElementById("ingre" + i).checked = false;
            }
        }
    }



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



// �޴���
function toggleNav2() {
  const nav = document.querySelector('#wrap3 nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu');
  nav2.classList.toggle('show2');
}

function toggleNav() {
  const nav = document.querySelector('#wrap4 nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu');
  nav2.classList.toggle('show2');
}

function toggleNav3() {
  const nav = document.querySelector('#wrap5 nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu');
  nav2.classList.toggle('show2');
}

function toggleNav4() {
  const nav = document.querySelector('#wrap6 nav');
  nav.classList.toggle('show');

  const nav2 = document.querySelector('.menu');
  nav2.classList.toggle('show2');
}
