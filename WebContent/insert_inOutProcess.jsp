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
String gubun=request.getParameter("gubun");
String storeCode=request.getParameter("storeCode");
String inOutDate=request.getParameter("inOutDate");
String saleQty=request.getParameter("saleQty");
try{
	String sql="insert into inOut0803 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, inOutDate);
	pstmt.setString(2, storeCode);
	pstmt.setString(3, productCode);
	pstmt.setString(4, gubun);
	pstmt.setString(5, saleQty);
	pstmt.executeUpdate();
	%><script>
	alert("입출고 등록 성공");
	location.href="select_inOut.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>