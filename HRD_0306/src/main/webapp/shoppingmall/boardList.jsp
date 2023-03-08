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
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int total=0;
	checkName=(String)session.getAttribute("s_Name");
	if(checkName==null){
		%>
		<script>
			alert("먼저 로그인하세요.");
			history.back(-1);
		</script>
		<%
	}else{
		String sql="select count(*) from board0306";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				total=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<br>
<table id="tab3">
<tr>
	<td id=td3 colspan=5>총 게시물 : <%=total %>개</td>
</tr>
<tr id="th3">
	<th width=5%>번호</th>
	<th width=60%>제목</th>
	<th width=10%>작성자</th>
	<th width=20%>작성일</th>
	<th width=5%>조회수</th>
</tr>
<%
	if(total==0){
		%>
	<tr>
		<td colspan=5 align=center>등록된 글이 없습니다.
	</tr>
		<%
	}else{
		String sql="select * from board0306 order by num desc";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String title=rs.getString("title");
				String time=rs.getString("time");
				int hit=rs.getInt("hit");			
%>
<tr>
	<td id=td2><%=num %></td>
	<td id=td2><a href="write.jsp?num=<%=num %>"><%=title %></a></td>
	<td id=td2><%=name %></td>
	<td id=td2><%=time %></td>
	<td id=td2><%=hit %></td>
</tr>
<%
}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<tr>
	<td colspan=5 align=center>
	<input type="button" id="btn2" value="글쓰기" onclick="location.href='boardInsert.jsp'">
</tr>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>



