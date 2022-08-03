<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp"%>
<%
String productCode=request.getParameter("productCode");
String productName=request.getParameter("productName");
String storeCode=request.getParameter("storeCode");
String unitPrice=request.getParameter("unitPrice");
String stockQty=request.getParameter("stockQty");
try{
	String sql="insert into product0803 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productCode);
	pstmt.setString(2, productName);
	pstmt.setString(3, storeCode);
	pstmt.setString(4, unitPrice);
	pstmt.setString(5, stockQty);
	pstmt.executeUpdate();
	%><script>
	alert("상품 테이블 등록 성공");
	location.href="select_product.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>