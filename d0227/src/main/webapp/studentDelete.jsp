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
	String sql="delete from stud0224 where studno=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		%>
		<script>
		alert("학사정보 삭제 성공");
		location.href="selectStudent.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("학사정보 테이블 삭제 실패");
		e.printStackTrace();
	}
%>
</body>
</html>