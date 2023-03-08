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
<h2>수정</h2>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num = Integer.parseInt(request.getParameter("num"));
	String sql="select num,name,title,memo from board0306 where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String name=rs.getString("name");
			String title=rs.getString("title");
			String memo=rs.getString("memo");
%>
<form name="form" method="post" action="boardUpdateProcess.jsp?num=<%=num%>">
<table border=1 id="tab4">
<tr>
	<th id="th4">제목</th>
	<td><input id=in8 type="text" name="title" value="<%=title%>"></td>
</tr>
<tr>
	<th id="th4">이름</th>
	<td><input id=in8 type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
	<th id="th4">비밀번호</th>
	<td><input id=in8 type="password" name="password"></td>
</tr>
<tr>
	<th id="th4">내용</th>
	<td><textarea cols=100 rows=20 name="memo"><%=memo%></textarea></td>
</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}	
 %>		
</table>
<div align=center>
	<button type="button" id=btn2 onclick="check()">수정</button>
	<button type="reset" id=btn2>취소</button>
</div>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>