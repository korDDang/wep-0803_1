<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 등록 화면</title>
<script>
function ch() {
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	
	if(doc.storeCode.value==""){
	alert("매장코드가 입력되지 않았습니다");
	doc.storeCode.focus();
	return false;
	}if(doc.storeName.value==""){
	alert("매장명이 입력되지 않았습니다");
	doc.storeName.focus();
	return false;	
	}if(doc.productCode.value==""){
		alert("상품 코드가 입력되지 않았습니다");
		doc.productCode.focus();
		return false;
	}if(doc.productName.value==""){
		alert("상품명이 입력되지 않았습니다");
		doc.productName.focus();
		return false;
	}if(doc.Qty.value==""){
		alert("수량이 입력되지 않았습니다");
		doc.Qty.focus();
		return false;	
	}else{
		form.action="insert_storeProcess.jsp";
		doc.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
int sq=0;
try{
	String sql="select stest.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		sq=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
 %>
<section class="sec1">
<h2>매장 등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_store.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">매장 코드(자동생성)</th>
		<td>
			<input type="text" name="storeCode" value="<%=sq%>">
		</td>
</tr>
<%



String productName="";



String Qty=request.getParameter("Qty");
if(Qty==null){
	Qty="";}

String storeName=request.getParameter("storeName");
if(storeName==null){
	storeName="";
}
String storeCode=request.getParameter("storeCode");
if(storeCode==null){
	storeCode="";
}
	

	String productCode=request.getParameter("productCode");
	if(productCode==null){
		productCode="";	
}else{
try{
	String sql="select productName from product0803 where productCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productCode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		productName=rs.getString(1);
	}else{
		%>
		<script>
		alert("등록되어 있지 않은 상품코드 입니다.");
		</script>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
}
%>
<tr>
	<th class="th1">매 장 명</th>
		<td>
			<input type="text" name="storeName" value="<%=storeName%>">
		</td>
</tr>

<tr>
	<th class="th1">상품코드</th>
		<td>
			<input type="text" name="productCode" value="<%=productCode%>" onchange="ch()">
		</td>
</tr>

<tr>
	<th class="th1">상품명</th>
		<td>
			<input type="text" name="productName" value="<%=productName%>">
		</td>
</tr>

<tr>
	<th class="th1">수량</th>
		<td>
			<input type="text" name="Qty" value="<%=Qty%>">
		</td>
</tr>

<tr>
	<td colspan="2" class="td1">
		<input type="button" value="등록" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>