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
<h2>글쓰기</h2>
<form name="form" method="post" action="boardInsProcess.jsp">
<table border=1 id="tab4">
<tr>
	<th id="th4">제목</th>
	<td><input id=in8 type="text" name="title"></td>
</tr>
<tr>
	<th id="th4">이름</th>
	<td><input id=in8 type="text" name="name" value="<%=checkName %>"></td>
</tr>
<tr>
	<th id="th4">비밀번호</th>
	<td><input id=in8 type="password" name="password"></td>
</tr>
<tr>
	<th id="th4">내용</th>
	<td><textarea cols=100 rows=20 name="memo"></textarea></td>
</tr>

</table>
<div align=center>
	<button type="button" id=btn2 onclick="check()">등록</button>
	<button type="reset" id=btn2 onclick="location.href='boardList.jsp'">취소</button>
</div>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>