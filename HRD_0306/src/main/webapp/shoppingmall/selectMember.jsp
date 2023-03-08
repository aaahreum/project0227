<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2>회원 목록</h2>
<%@ include file="dbconn.jsp" %>
<table border=1 id=tab2>
<tr>
	<th id=th2>ID</th>
	<th id=th2>성명</th>
	<th id=th2>비밀번호</th>
	<th id=th2>성별</th>
	<th id=th2>생년월일</th>
	<th id=th2>이메일</th>
	<th id=th2>연락처</th>
	<th id=th2>주소</th>
	<th id=th2>관심분야</th>
	<th id=th2>구분</th>
</tr>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
	
	String sql="select id,password,name,replace(replace(gender,'1','남성'),'2','여성'),to_char(birth,'yyyy-mm-dd'),email,phone,address,interest from member0306";
	pstmt=conn.prepareStatement(sql);	
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");
		String password=rs.getString("password");
		String name=rs.getString("name");
		String gender=rs.getString(4);
		String birth=rs.getString(5);
		String email=rs.getString("email");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String interest=rs.getString("interest");		

%>
<tr>
	<td id=td1><%=id %></td>
	<td id=td1><%=name %></td>
	<td id=td1><%=password %></td>
	<td id=td1><%=gender %></td>
	<td id=td1><%=birth %></td>
	<td id=td1><%=email %></td>
	<td id=td1><%=phone %></td>
	<td id=td1><%=address %></td>
	<td id=td1><%=interest %></td>
	<td id=td1><a href="memberUpdate.jsp?id=<%=id%>">수정</a>/<a href="memberDelete.jsp">삭제</a></td>
</tr>
<%
}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
<div align=center>
<button type="button" id=btn2 onclick="location.href='addMember.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>