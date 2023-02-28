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
<%@ include file="dbconn.jsp" %>
<h2>강사 리스트</h2>
<table border=1 id=tab2>
<tr>
	<th id=th2>강사코드</th>
	<th id=th2>강사명</th>
	<th id=th2>전공</th>
	<th id=th2>세부전공</th>
	<th id=th2>관리</th>
</tr>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String sql="select * from lecturer0224 order by idx";
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			//String id=rs.getString("idx");
		
%>
<tr>
	<td id=td1><%=rs.getString("idx") %></td>
	<td id=td1><%=rs.getString("name") %></td>
	<td id=td1><%=rs.getString("major") %></td>
	<td id=td1><%=rs.getString("field") %></td>
	<td id=td1>
		<a href="lecturerUpdate.jsp?id=<%=rs.getString(1)%>" id=a1>수정</a> /
		<a href="lecturerDelete.jsp?id=<%=rs.getString(1)%>" 
		onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;" id=a1>삭제</a>
	</td>
</tr>
<%
		}
	}catch(Exception e){
		System.out.println("강사 정보 읽기 실패.");
		e.printStackTrace();
	}
%>
</table>
<div align=center>
<button type="button" id=btn2 onclick="location.href='insertLecturer.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>