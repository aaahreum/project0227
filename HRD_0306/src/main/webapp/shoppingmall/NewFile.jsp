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
<h2>회원 가입 등록 화면</h2>
<form name="form" method="post" action="memberInsProcess.jsp">
<table border=1 id="tab1">
<tr>
	<th id="th1">아이디</th>
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
		String sql="select max(id) from member0306";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				no=rs.getInt(1)+1;
			}else{
				no=1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<td><input id="in1" type="text" name="id" value="<%=no %>"></td>
</tr>
<tr>
	<th id="th1">성명</th>
	<td><input id="in1" type="text" name="name"></td>
</tr>
<tr>
	<th id="th1">비밀번호</th>
	<td><input id="in1" type="password" name="pass"></td>
</tr>
<tr>
	<th id="th1">비밀번호 확인</th>
	<td><input id="in1" type="password" name="repass"></td>
</tr>
<tr>
	<th id="th1">성별</th>
	<td><input type="radio" name="gender" value="1" checked>남성
		<input type="radio" name="gender" value="2" >여성
	</td>
</tr>
<tr>
	<th id="th1">생일</th>
	<td><input type="number" name="year" min=1950 max=2999 
										value="<%=2020 %>">년
		<input type="number" name="mon" min=01 max=12 
										value="<%=05%>">월
		<input type="number" name="dat" min=01 max=31
										value="<%=15 %>">일								
	</td>
</tr>
<tr>
	<th id="th1">이메일</th>
	<td><input type="text" name="email1" value="이메일">@
		<input type="text" name="email2" value="" disabled>
		<select name="email">
			<option value="0">선택하세요</option>
			<option value="9">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="korea.com">korea.com</option>
		</select>
	</td>
</tr>
<tr>
	<th id="th1">연락처</th>
	<td><select name="phone1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="070">070</option>
		</select>-
		<input id=in2 type="text" name="phone2">-
		<input id=in2 type="text" name="phone3">
	</td>
</tr>
<tr>
	<th id="th1">주소</th>
	<td><input id="in3" type="text" name="address"></td>
</tr>
<tr>
	<th id="th1">관심분야</th>
	<td><input type="checkbox" name="int" value="프로그램">프로그램
		<input type="checkbox" name="int" value="독서">독서
		<input type="checkbox" name="int" value="등산">등산
		<input type="checkbox" name="int" value="여행">여행
		<input type="checkbox" name="int" value="컴퓨터">컴퓨터
		<input type="checkbox" name="int" value="영화">영화
		<input type="checkbox" name="int" value="운동">운동
		<input type="checkbox" name="int" value="진학">진학
	</td>
</tr>
<tr>
	<td colspan=2 align=center id=td1>
	<input id= btn1 type="button" value="등록" onclick="check()">
	<input id= btn1 type="reset" value="취소">
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>