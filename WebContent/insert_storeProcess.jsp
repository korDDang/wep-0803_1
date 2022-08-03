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
String storeName=request.getParameter("storeName");
String storeCode=request.getParameter("storeCode");
String Qty=request.getParameter("Qty");
try{
	String sql="insert into store0803 values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, storeCode);
	pstmt.setString(2, storeName);
	pstmt.setString(3, productCode);
	pstmt.setString(4, Qty);
	pstmt.executeUpdate();
	%><script>
	alert("매장 테이블 등록 성공");
	location.href="select_store.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>