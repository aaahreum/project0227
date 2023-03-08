<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<%
	String checkName="";
	checkName=(String)session.getAttribute("s_Name");
	if(checkName==null){%>
		<h1 id="log">쇼핑몰에 오신것을 환영합니다.</h1>
		<div class="right" >
		<form method="post" action="login.jsp">
		<label>회원 ID:</label>
			<input  type="text" name="id" size=10>
			비밀번호
			<input  type="password" name="pass" size=10>
			<button type="submit">로그인</button>
			<a href="addMember.jsp">회원가입</a>
		</form>
		</div>
	<%}else{
		session.setMaxInactiveInterval(1000);//세션 유지시간
		%>
		<h1 id="log">쇼핑몰에 오신것을 환영합니다.</h1>
		<div class="right">
		<%=checkName %>님 환영합니다.
		<a href="logout.jsp">logout</a>
		<a href="addMember.jsp">회원가입</a>
		</div>
	<%}
%>
</header>
</body>
</html>