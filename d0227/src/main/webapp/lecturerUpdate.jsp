<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.id.value==""){
		alert("강사 ID를 입력하세요.");
		document.form.id.focus();
		return false;
	}
	if(document.form.name.value==""){
		alert("강사 이름을 입력하세요.");
		document.form.name.focus();
		return false;
	}
	if(document.form.major.value==""){
		alert("전공을 입력하세요.");
		document.form.major.focus();
		return false;
	}if(document.form.field.value==""){
		alert("세부 전공을 입력하세요.");
		document.form.field.focus();
		return false;
	}
	document.form.submit();
}	
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2>강사 수정</h2>
<form name="form" method="post" action="lecturerUpdateProcess.jsp">
<table border=1 id="tab3">
<tr>
	<th id=th1>강사 ID</th>
	<%@ include file="dbconn.jsp" %>
	<%
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String id=request.getParameter("id");
		int no=0;
		String sql="select * from lecturer0224 where idx=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String name=rs.getString("name");
				String major=rs.getString("major");
				String field=rs.getString("field");
			
	%>
	<td><input type="text" id="in1" name="id" value="<%=id %>"></td>
</tr>
<tr>
	<th id=th1>강사명</th>
	<td><input type="text" id="in1" name="name" value="<%=name %>"></td>
</tr>
<tr>
	<th id=th1>전공</th>
	<td><input type="text" id="in1" name="major" value="<%=major %>"></td>
</tr>
<tr>
	<th id=th1>세부 전공</th>
	<td><input type="text" id="in1" name="field" value="<%=field %>"></td>
</tr>
<tr>
	<td colspan=2 align=center height=50px>
		<input type="button" id="btn1" value="저장" onclick="check()">
		<input type="reset" id="btn1" value="취소" >
</tr>
<%
			}
		}catch(Exception e){
			System.out.println("강사 테이블 조회 실패");
			e.printStackTrace();
		}
%>
</table>
</form>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>