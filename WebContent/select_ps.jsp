
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품/매장 정보 목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<br>
<h2>상품 /매장 정보 목록</h2>
<hr>
<table border="1" class="tab1">
<tr>
	<th class="th1">no</th>
	<th class="th1">상품코<br>드</th>
	<th class="th1">상 품 명</th>
	<th class="th1">매장코<br>드</th>
	<th class="th1">매 장 명</th>
	<th class="th1">단 가</th>
	<th class="th1">수량</th>
</tr>
<%
int no=0;
 try{
	 String sql="select p.productCode,p.productName,s.storeCode,s.storeName,p.unitPrice,p.stockQty from product0803 p,store0803 s where p.storeCode=s.storeCode order by p.productCode";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 while(rs.next()){
		 String productCode=rs.getString(1);
		 String productName=rs.getString(2);
		 String storeCode=rs.getString(3);
		 String storeName=rs.getString(4);
		 int unitPrice=rs.getInt(5);
		 int stockQty=rs.getInt(6);
		no++;
%>
<tr>
	<td class="td1"><%=no %></td>
	<td class="td1"><%=productCode%></td>
	<td class="td1"><%=productName %></td>
	<td class="td1"><%=storeCode%></td>
	<td class="td1"><%=storeName %></td>
	<td class="td1"><%=unitPrice %></td>
	<td class="td1"><%=stockQty %></td>
</tr>
<%
	 }
	 }catch(SQLException e){
		 e.printStackTrace();
		 System.out.println("조회 실패");
	 }
%>
</table>
<br>
<div class="td1"><input type="button" value="상품 정보 추가" onclick="location.href='insert_product.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>