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
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String sql="select id,password,name from member0306 where id=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String PWD=rs.getString("password");//테이블에서 가져오는 패스워드
			String UserName=rs.getString("name");
			if(pass.equals(PWD)){
				session.setAttribute("s_Name", UserName);
				session.setAttribute("s_Id", id);
				response.sendRedirect("index.jsp");
			}else{
				%>
				<script>
					alert("비밀번호가 일치하지 않습니다.");
					history.back(-1);
				</script>
				<%
			}
		}else{
			%>
			<script>
				alert("일치하는 ID가 없습니다.");
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