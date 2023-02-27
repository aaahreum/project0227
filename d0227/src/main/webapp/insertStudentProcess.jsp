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
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String hobby="";
	String val[]=request.getParameterValues("hobby");
	if(val !=null){
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)){
				hobby=hobby+val[i];
			}else{
				hobby=hobby+val[i]+",";
			}
		}
	}
	
	String sql="insert into stud0224 values(?,?,?,?,?,?,?)";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.setString(7, hobby);
		pstmt.executeUpdate();
		%>
		<script>
			alert("저장 성공");
			location.href="selectStudent.jsp";
		</script>
		<%
	}catch(Exception e){
		%>
		<script>
			alert("저장 실패");
			history.back(-1);
		</script>
		<%
		e.printStackTrace();
	}
%>
</body>
</html>