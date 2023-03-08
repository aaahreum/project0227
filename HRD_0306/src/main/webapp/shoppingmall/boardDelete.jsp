<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	form.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%
	String num=request.getParameter("num");
%>
<h2>삭제</h2>
<form name="form" method="post" action="boardDeleteProcess.jsp?num=<%=num%>">
<table border=1 id=tab5>
<tr>
	<th id=td2>비밀번호</th>
	<td><input id=in4 type="password" name="password"></td>
</tr>	
</table>
</form>
<div align=center>
	<button type="button" id=btn2 onclick="check()">삭제</button>
	<button type="button" id=btn2 onclick="history.back(-1)">취소</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>