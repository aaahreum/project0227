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
<h2>학사 정보 등록 화면</h2>
<form name="form" method="post" action="insertStudentProcess.jsp">
<table border=1 id=tab1>
<tr>
	<th id=th1>학번</th>
	<td><input id=in1 type="text" name="id"></td>
</tr>
<tr>
	<th id=th1>성명</th>
	<td><input id=in1 type="text" name="name"></td>
</tr>
<tr>
	<th id=th1>학과</th>
	<td><select name="dept" id=in3>
		<option value=1 selected>컴퓨터공학과</option>
		<option value=2>기계공학과</option>
		<option value=3>전자과</option>
		<option value=4>영문학과</option>
		<option value=5>일어과</option>
		<option value=6>경영학과</option>
		<option value=7>무역학과</option>
		<option value=8>교육학과</option>
		</select>
</tr>
<tr>
	<th id=th1>학년</th>
	<td><input type="radio" id=in3 name="position" value=1 checked>1학년
	<input type="radio" id=in3 name="position" value=2>2학년
	<input type="radio" id=in3 name="position" value=3>3학년
	<input type="radio" id=in3 name="position" value=4>4학년
</tr>
<tr>
	<th id=th1>취미</th>
	<td>
	<input type="checkbox" id=in3 name="hobby" value="프로그램">프로그램
	<input type="checkbox" id=in3 name="hobby" value="독서">독서
	<input type="checkbox" id=in3 name="hobby" value="등산">등산
	<input type="checkbox" id=in3 name="hobby" value="여행">여행
	<input type="checkbox" id=in3 name="hobby" value="낚시">낚시
	<input type="checkbox" id=in3  name="hobby" value="영화보기">영화보기
	<input type="checkbox" id=in3 name="hobby" value="잠자기">잠자기
	<input type="checkbox" id=in3 name="hobby" value="멍때리기">멍때리기	
	</td>
</tr>
<tr>
	<th id=th1>주소</th>
	<td><input id="in2" type="text" name="address" ></td>
</tr>
<tr>
	<th id=th1>연락처</th>
	<td><input id=in1 type="text" name="phone"></td>
</tr>
<tr>
	<td colspan=2 align=center height=50px>
	<input id=btn1 type="button" value="등록" onclick="check()">
	<input id=btn1 type="reset" value="취소" ></td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>