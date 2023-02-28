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
<h2>학사 정보 목록</h2>
<%@ include file="dbconn.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String sql="select count(*) from stud0224";
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

<p id=p1> 총 <%=count %>명의 학사정보가 있습니다.<p>
<table border=1 id=tab2>
<tr>
	<th id=th2>학번</th>
	<th id=th2>성명</th>
	<th id=th2>학과</th>
	<th id=th2>학년</th>
	<th id=th2>주소</th>
	<th id=th2>연락처</th>
	<th id=th2>취미</th>
	<th id=th2>관리</th>
</tr>
<%	
	sql="select * from stud0224";
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
		String id=rs.getString("studno");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String address=rs.getString("address");
		String phone=rs.getString("phone");
		String hobby=rs.getString("hobby");

%>
<tr>
	<td id=td1><%=id %></td>
	<td id=td1><%=name %></td>
	<td id=td1><%=dept %></td>
	<td id=td1><%=position %></td>
	<td id=td1><%=address %></td>
	<td id=td1><%=phone %></td>
	<td id=td1><%=hobby %></td>
	<td id=td1>
		<a href="studentUpdate.jsp?id=<%=id %>" id=a1>수정</a> /
		<a href="studentDelete.jsp?id=<%=id %>" 
		onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;" id=a1>삭제</a>
	</td>
</tr>
<%
		}
	}catch(Exception e){
		%>
		<script>
			alert("stu0224 테이블 읽기 실패");
			history.back(-1);
		</script>
		<%
		e.printStackTrace();
	}
%>
</table>
<div align=center>
<button type="button" id=btn2 onclick="location.href='insertStudent.jsp'">학사정보 추가</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>