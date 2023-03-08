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
<h2>내용</h2>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num = Integer.parseInt(request.getParameter("num"));
	String sql="select num,name,title,memo,time,hit from board0306 where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		if(rs.next()){
			int hit=rs.getInt("hit");
			String name=rs.getString("name");
			String time=rs.getString("time");
			String title=rs.getString("title");
			String memo=rs.getString("memo");
			hit++;

%>
<table border=1 id=tab4>
<tr>
	<th id="th4">글번호</th>
	<td><%=num %></td>
</tr>
<tr>
	<th id="th4">조회수</th>
	<td><%=hit%></td>
</tr>
<tr>
	<th id="th4">이름</th>
	<td><%=name%></td>
</tr>
<tr>
	<th id="th4">작성일</th>
	<td><%=time%></td>
</tr>
<tr>
	<th id=th4>제목</th>
	<td><%=title%></td>
</tr>
<tr>
	<th id=th4>내용</th>
	<td><textarea cols=100 rows=20 name="memo" ><%=memo %></textarea></td>
</tr>
<%	sql="update board0306 set hit=hit+1 where num=?";

	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.executeUpdate();
	
		}
	}catch(Exception e){
		e.printStackTrace();
	}	
 %>	
</table>
<div align=center>
	<button type="button" id=btn2 onclick="location.href='boardInsert.jsp'">글쓰기</button>
	<button type="button" id=btn2>답글</button>
	<button type="button" id=btn2 onclick="location.href='boardList.jsp'">목록</button>
	<button type="button" id=btn2 onclick="location.href='boardUpdate.jsp?num=<%=num%>'">수정</button>
	<button type="button" id=btn2 onclick="location.href='boardDelete.jsp?num=<%=num%>'">삭제</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>