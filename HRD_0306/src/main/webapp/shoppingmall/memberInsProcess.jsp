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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String password=request.getParameter("pass");
	String gender=request.getParameter("gender");
	String address=request.getParameter("address");
	String ema="";
	if(request.getParameter("email").equals("9")){
		ema=request.getParameter("email2");
	}else{
		ema=request.getParameter("email");
	}
	String phone=request.getParameter("phone1")+"-"+
				 request.getParameter("phone2")+"-"+
				 request.getParameter("phone3");		
	String email=request.getParameter("email1")+"@"+ ema;
	String birth=request.getParameter("year")+"-"+
				 request.getParameter("mon")+"-"+
				 request.getParameter("day");
	
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	String val[]=request.getParameterValues("int");
	String interest="";
	if(val!= null){
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)){
				interest += val[i];
			}else{
				interest += val[i]+",";
			}
		}
	}
	try{
		String sql="insert into member0306 values(?,?,?,?,?,?,?,?,?,sysdate)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth);
		pstmt.setString(6, email);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.setString(9, interest);
		pstmt.executeUpdate();
%>
	<script>
		alert("저장 성공");
		location.href="selectMember.jsp";
	</script>
<%
	}catch(Exception e){
		out.println("등록 실패");
		e.printStackTrace();
	}
%>
</body>
</html>