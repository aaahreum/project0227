<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String sql="delete from lecturer0224 where idx=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		%>
		<script>
		alert("강사 정보 삭제 성공.");
		location.href="selectLecturer.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("강사 정보 삭제 실패.");
		e.printStackTrace();
	}
%>
</body>
</html>