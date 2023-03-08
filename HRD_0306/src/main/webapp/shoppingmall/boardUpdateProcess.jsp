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
	ResultSet rs=null;
	int num = Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	System.out.println(num+" "+title);
	String password=request.getParameter("password");
	String memo=request.getParameter("memo");
	String sql="update board0306 set name=?,password=?,title=?,memo=? where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(5, num);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.executeUpdate();
		%>
		<script>
			alert("수정 완료");
			location.href="boardList.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>
</body>
</html>