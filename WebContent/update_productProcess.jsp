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
	String sql="update product0803 set productName=?,unitPrice=?,stockQty=? where productCode=? and storeCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(4, productCode);
	pstmt.setString(1, productName);
	pstmt.setString(5, storeCode);
	pstmt.setString(2, unitPrice);
	pstmt.setString(3, stockQty);
	pstmt.executeUpdate();
	%><script>
	alert("상품 테이블 수정 성공");
	location.href="select_product.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}

%>
</body>
</html>