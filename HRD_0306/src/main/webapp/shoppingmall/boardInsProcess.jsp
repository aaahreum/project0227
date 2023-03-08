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
	request.setCharacterEncoding("utf-8");
	
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	int num=0;
    String sql="select max(num) from board0306";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		num=rs.getInt(1)+1;
	}else{
		num=1;
	}
	
	
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String title=request.getParameter("title");
	String memo=request.getParameter("memo");
	
	
	try{
		sql="insert into board0306(num,name,password,title,memo,time) values(?,?,?,?,?,sysdate)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, title);
		pstmt.setString(5, memo);

		pstmt.executeUpdate();
%>
	<script>
		alert("저장 성공");
		location.href="boardList.jsp";
	</script>
<%
	}catch(Exception e){
		out.println("등록 실패");
		e.printStackTrace();
	}
%>
</body>
</html>