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
		alert("학번이 입력되지 않았습니다.")
		document.form.id.focus();
		return false;
	}
	if(document.form.id.value==0||isNaN(document.form.id.value)){
		alert("학번은 숫자만 가능합니다.")
		document.form.id.focus();
		return false;
	}
	if(document.form.name.value==""){
		alert("이름이 입력되지 않았습니다.")
		document.form.name.focus();
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
<h2>학사 정보 수정 화면</h2>
<%@ include file="dbconn.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String sql="select * from stud0224 where studno=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String dept=rs.getString("dept");
			String position=rs.getString("position");
			String address=rs.getString("address");
			String phone=rs.getString("phone");
			String hobby=rs.getString("hobby");
			String val[]=hobby.split(",");
		
%>
<form name="form" method="post" action="studentUpdateProcess.jsp">
<table border=1 id=tab1>
<tr>
	<th id=th1>학번</th>
	<td><input id=in1 type="text" name="id" value="<%=id %>"></td>
</tr>
<tr>
	<th id=th1>성명</th>
	<td><input id=in1 type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
	<th id=th1>학과</th>
	<td><select name="dept">
		<option value=1 <%if(dept.equals("1")) {%>selected <%}%>>컴퓨터공학과</option>
		<option value=2 <%if(dept.equals("2")) {%>selected <%}%>>기계공학과</option>
		<option value=3 <%if(dept.equals("3")) {%>selected <%}%>>전자과</option>
		<option value=4 <%if(dept.equals("4")) {%>selected <%}%>>영문학과</option>
		<option value=5 <%if(dept.equals("5")) {%>selected <%}%>>일어과</option>
		<option value=6 <%if(dept.equals("6")) {%>selected <%}%>>경영학과</option>
		<option value=7 <%if(dept.equals("7")) {%>selected <%}%>>무역학과</option>
		<option value=8 <%if(dept.equals("8")) {%>selected <%}%>>교육학과</option>
		</select>
</tr>
<tr>
	<th id=th1>학년</th>
	<td><input type="radio" name="position" value=1 <%=position.equals("1")? "checked" : ""%>>1학년
	<input type="radio" name="position" value=2 <%=position.equals("2")? "checked" : ""%>>2학년
	<input type="radio" name="position" value=3 <%=position.equals("3")? "checked" : ""%>>3학년
	<input type="radio" name="position" value=4 <%=position.equals("4")? "checked" : ""%>>4학년
</tr>
<tr>
	<th id=th1>취미</th>
	<td>
	<input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<val.length;i++){if(val[i].equals("프로그램")) out.print("checked");} %>>프로그램
	<input type="checkbox" name="hobby" value="독서"  <%for(int i=0;i<val.length;i++){if(val[i].equals("독서")) out.print("checked");} %>>독서
	<input type="checkbox" name="hobby" value="등산" <%for(int i=0;i<val.length;i++){if(val[i].equals("등산")) out.print("checked");} %>>등산
	<input type="checkbox" name="hobby" value="여행" <%for(int i=0;i<val.length;i++){if(val[i].equals("여행")) out.print("checked");} %>>여행
	<input type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<val.length;i++){if(val[i].equals("낚시")) out.print("checked");} %>>낚시
	<input type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<val.length;i++){if(val[i].equals("영화보기")) out.print("checked");} %>>영화보기
	<input type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<val.length;i++){if(val[i].equals("잠자기")) out.print("checked");} %>>잠자기
	<input type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<val.length;i++){if(val[i].equals("멍때리기")) out.print("checked");} %>>멍때리기	
	</td>
</tr>
<tr>
	<th id=th1>주소</th>
	<td><input id="in1" type="text" name="address" value="<%=address %>"></td>
</tr>
<tr>
	<th id=th1>연락처</th>
	<td><input id=in1 type="text" name="phone" value="<%=phone %>"></td>
</tr>
<tr>
	<td colspan=2 align=center height=50px>
	<input id=btn1 type="button" value="등록" onclick="check()">
	<input id=btn1 type="reset" value="취소" ></td>
</tr>
<%
		}
	}catch(Exception e){
		System.out.println("학사 정보 읽기 실패");
		e.printStackTrace();
	}

%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>