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
<h2>교과목 목록</h2>
<%@ include file="dbconn.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String sql="select count(*) from sub0224";
	int count=0;
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
	}catch(Exception e){
		System.out.println("테이블 읽기 실패");
		e.printStackTrace();
	}
%>
<p id=p1> 총 <%=count %>개의 교과목이 있습니다.<p>
<table border=1 id=tab2>
<tr>
	<th id=th2>과목코드</th>
	<th id=th2>과목명</th>
	<th id=th2>학점</th>
	<th id=th2>담당강사</th>
	<th id=th2>요일</th>
	<th id=th2>시작시간</th>
	<th id=th2>종료시간</th>
	<th id=th2>관리</th>
</tr>
<%
	sql="select * from sub0224 a, lecturer0224 b where lecturer=idx order by id";
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
		String id=rs.getString("id");
		String subject_name=rs.getString("subject_name");
		String credit=rs.getString("credit");
		String lecturer=rs.getString("name");
		String week=rs.getString("week");
		String start_hour=rs.getString("start_hour");
		String end_hour=rs.getString("end_hour");
%>
<tr>
	<td id=td1><%=id%></td>
	<td id=td1><%=subject_name %></td>
	<td id=td1><%=credit %></td>
	<td id=td1><%=lecturer %></td>
	<td id=td1><%=week %></td>
	<td id=td1><%=start_hour %></td>
	<td id=td1><%=end_hour %></td>
	<td id=td1>
	<a href="subjectUpdate.jsp?id=<%=id %>" id=a1>수정</a> /
	<a href="subjectDelete.jsp?id=<%=id %>" 
	onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;" id=a1>삭제</a></td>
</tr>
<%
	}
	 }catch(Exception e){
		 e.printStackTrace();
	 }
%>
</table>
<div align=center>
<button type="button" id=btn2 onclick="location.href='insertSubject.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>