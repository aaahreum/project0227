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
		alert("교과목 코드가 입력되지 않았습니다.");
		document.form.id.focus();
		return false;
	}
	if(document.form.subject_name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		document.form.subject_name.focus();
		return false;
	}
	if(document.form.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		document.form.credit.focus();
		return false;
	}
	if(document.form.lecturer.value==""){
		alert("담당강사가 입력되지 않았습니다.");
		document.form.lecturer.focus();
		return false;
	}
	if(document.form.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		document.form.start_hour.focus();
		return false;
	}
	if(document.form.end_hour.value==""){
		alert("종료시간이 입력되지 않았습니다.");
		document.form.end_hour.focus();
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
<h2>교과목 추가</h2>
<form name="form" method="post" action="insertSubjectProcess.jsp">
<table border=1 id=tab1>
<tr>
	<th id=th1>교과목 코드</th>
	<td><input type="text" id=in1 name="id"></td>
</tr>
<tr>
	<th id=th1>과목명</th>
	<td><input type="text" id=in1 name="subject_name"></td>
</tr>
<tr>
	<th id=th1>학점</th>
	<td><input type="text" id=in1 name="credit"></td>
</tr>
<tr>
	<th id=th1>담당강사</th>
	<td><select name="lecturer" id=in3>
		<option value="">담당강사 선택</option>
	<%@ include file="dbconn.jsp" %>
	<%
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String sql="select idx,name from lecturer0224";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String name=rs.getString("name");
	%>		
		<option value="<%=idx %>"><%=name %></option>
	<%
}
		}catch(Exception e){
			System.out.println("강사명 조회 실패");
			e.printStackTrace();
		}
	%>
		</select></td>
</tr>
<tr>
	<th id=th1>요일</th>
	<td><input type="radio" id=in3 name="week" value="1" checked>월
		<input type="radio" id=in3 name="week" value="2">화
		<input type="radio" id=in3 name="week" value="3">수
		<input type="radio" id=in3 name="week" value="4">목
		<input type="radio" id=in3 name="week" value="5">금
		<input type="radio" id=in3 name="week" value="6">토
	</td>
</tr>
<tr>
	<th id=th1>시작</th>
	<td><input type="text" id=in1 name="start_hour"></td>
</tr>
<tr>
	<th id=th1>종료</th>
	<td><input type="text" id=in1 name="end_hour"></td>
</tr>
<tr>
	<td colspan=2 align=center height=50px>
		<a href="selectSubject.jsp"><input type="button" id=btn1 value="목록"></a>
		<input type="button" id=btn1 value="등록" onclick="check()">
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>