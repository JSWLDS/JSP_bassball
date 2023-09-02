/**
 * 
 */
function check(){
	if(document.form1.orderno.value === ""){
		alert("주문번호가 입력되지 않았습니다.");
		document.form1.orderno.focus;
		return false;
	}
	if(document.form1.mcode.value === "0"){
		alert("메뉴코드가 선택되지 않았습니다.");
		document.form1.mcode.focus;
		return false;
	}
	if(document.form1.orderdate.value === ""){
		alert("주문일이 선택되지 않았습니다.");
		document.form1.orderdate.focus;
		return false;
	}
	if(document.form1.scode.value === ""){
		alert("매장코드가 입력되지 않았습니다.");
		document.form1.scode.focus;
		return false;
	}
	if(document.form1.amount.value === ""){
		alert("수량이 입력되지 않았습니다.");
		document.form1.amount.focus;
		return false;
	}
	return true;
}
function reply(){
	
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	document.form1.orderno.value = ""
	document.form1.mcode.value = "0";
	document.form1.orderdate.value = "";
	document.form1.scode.value = "";
	document.form1.amount.value = "";

	return true;
}