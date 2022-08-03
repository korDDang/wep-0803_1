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
String storeCode=request.getParameter("storeCode");
try{
	String sql="delete from product0803 where productCode=? and storeCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productCode);
	pstmt.setString(2, storeCode);
	pstmt.executeUpdate();
	%><script>
	alert("삭제 성공");
	location.href="select_product.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}

%>
</body>
</html>