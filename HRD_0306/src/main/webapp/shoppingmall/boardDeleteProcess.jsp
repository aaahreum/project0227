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
	String num=request.getParameter("num");
	String pass=request.getParameter("password");
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select password from board0306 where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String PASS=rs.getString(1);
			if(pass.equals(PASS)){
				sql="delete from board0306 where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.executeUpdate();
				%>
				<script>
				alert("삭제성공");
				location.href="boardList.jsp";
				</script>
				<%
			}else{
				%>
				<script>
				alert("비밀번호가 틀림");
				history.back(-1);
				</script>
				<%
			}
		}else{
			%>
			<script>
			alert("없는 num");
			history.back(-1);
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>