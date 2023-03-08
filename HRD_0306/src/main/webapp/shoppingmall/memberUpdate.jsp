<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
			return false;
		}
		if(document.form.pass.value==""){
			alert("비밀번호를 입력하세요.");
			document.form.pass.focus();
			return false;
		}
		if(document.form.repass.value==""){
			alert("확인비밀번호를 입력하세요.");
			document.form.repass.focus();
			return false;
		}
		if(document.form.pass.value !=document.form.repass.value){
			alert("비밀번호가 일치하지 않습니다.");
			document.form.repass.focus();
			return false;
		}
		if(document.form.phone2.value==""){
			alert("전화번호를 입력하세요.");
			document.form.phone2.focus();
			return false;
		}
		if(document.form.phone2.value.length !=4){
			alert("전화번호는 4자리만 가능합니다.");
			document.form.phone2.focus();
			return false;
		} 
		
		document.form.submit();
	}
	
	function email_change(){
		if(document.form.email.options[document.form.email.selectedIndex].value=='0'){
			document.form.email2.disabled=true;
			document.form.email2.value="";			
		}
		if(document.form.email.options[document.form.email.selectedIndex].value=='9'){
			document.form.email2.disabled=false;
			document.form.email2.value="";
			document.form.email2.focus();
		}else{
			document.form.email2.disabled=true;
			document.form.email2.value=document.form.email.options[document.form.email.selectedIndex].value;
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2>회원 정보 수정 화면</h2>
<%@ include file="dbconn.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String sql="select id,name,password,gender,to_char(birth,'yyyy-mm-dd'),email,phone,address,interest from member0306 where id=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String password=rs.getString("password");
			String gender=rs.getString("gender");
			String birth=rs.getString(5);
			String year=birth.substring(0,4);
			String mon=birth.substring(5,7);
			String day=birth.substring(8,10);
			String email=rs.getString("email");
			String em[]=email.split("@");
			String email1=em[0];
			String email2=em[1];
			String phone=rs.getString("phone");
			String phone1=phone.substring(0,3);
			String phone2=phone.substring(4,8);
			String phone3=phone.substring(9,13);
			String address=rs.getString("address");
			String interest=rs.getString("interest");
			String val[]=interest.split(",");
%>
<form name="form" method="post" action="memberUpdateProcess.jsp">
<table border=1 id="tab1">
<tr>
	<th id="th1">아이디</th>
	<td><input id="in1" type="text" name="id" value="<%=id %>"></td>
</tr>
<tr>
	<th id="th1">성명</th>
	<td><input id="in1" type="text" name="name" value="<%=name%>"></td>
</tr>
<tr>
	<th id="th1">비밀번호</th>
	<td><input id="in1" type="password" name="pass" value="<%=password%>"></td>
</tr>
<tr>
	<th id="th1">비밀번호 확인</th>
	<td><input id="in1" type="password" name="repass" value="<%=password%>"></td>
</tr>
<tr>
	<th id="th1">성별</th>
	<td><input id=in4 type="radio" name="gender" value="1" <%=gender.equals("1")? "checked" : ""%>>남성
		<input id=in4 type="radio" name="gender" value="2" <%=gender.equals("2")? "checked" : ""%>>여성
	</td>
</tr>
<tr>
	<th id="th1">생일</th>
	<td><input  id=in4 type="number" name="year" min=1950 max=2999 
										value="<%=year %>">년
		<input id=in4 type="number" name="mon" min=01 max=12 
										value="<%=mon%>">월
		<input id=in4 type="number" name="day" min=01 max=31
										value="<%=day %>">일								
	</td>
</tr>
<tr>
	<th id="th1">이메일</th>
	<td><input  id=in5 type="text" name="email1" value="<%=email1%>">@
		<input  id=in5 type="text" name="email2"  value="<%=email2%>"disabled>
		<select name="email2" id=in5 onchange="email_change()">
			<option value="0" <%if(email2.equals("0")){%>selected<%}%>>선택하세요</option>
			<option value="9" <%if(email2.equals("9")){%>selected<%}%> >직접입력</option>
			<option value="naver.com" <%if(email2.equals("naver.com")){%>selected<%}%>>naver.com</option>
			<option value="daum.net" <%if(email2.equals("daum.net")){%>selected<%}%>>daum.net</option>
			<option value="nate.com" <%if(email2.equals("nate.com")){%>selected<%}%>>nate.com</option>
			<option value="hotmail.com" <%if(email2.equals("hotmail.com")){%>selected<%}%>>hotmail.com</option>
			<option value="gmail.com" <%if(email2.equals("gmail.com")){%>selected<%}%>>gmail.com</option>
			<option value="korea.com" <%if(email2.equals("korea.com")){%>selected<%}%>>korea.com</option>
		</select>
	</td>
</tr>
<tr>
	<th id="th1">연락처</th>
	<td><select name="phone1" id=in6>
		<option value="010" <%if(phone1.equals("010")){%>selected<%}%>>010</option>
		<option value="011" <%if(phone1.equals("011")){%>selected<%}%>>011</option>
		<option value="070" <%if(phone1.equals("070")){%>selected<%}%>>070</option>
		</select>-
		<input id=in6 type="text" name="phone2" value="<%=phone2 %>">-
		<input id=in6 type="text" name="phone3" value="<%=phone3 %>">
	</td>
</tr>
<tr>
	<th id="th1">주소</th>
	<td><input id="in3" type="text" name="address" value="<%=address%>"></td>
</tr>
<tr>
	<th id="th1">관심분야</th>
	<td><input id=in7 type="checkbox" name="int" value="프로그램" 
		<%for(int i=0;i<val.length;i++) if("프로그램".equals(val[i])) out.print("checked"); %>>프로그램
		<input id=in7 type="checkbox" name="int" value="독서"
		<%for(int i=0;i<val.length;i++) if("독서".equals(val[i])) out.print("checked"); %>>독서
		<input id=in7 type="checkbox" name="int" value="등산"
		<%for(int i=0;i<val.length;i++) if("등산".equals(val[i])) out.print("checked"); %>>등산
		<input id=in7 type="checkbox" name="int" value="여행"
		<%for(int i=0;i<val.length;i++) if("여행".equals(val[i])) out.print("checked"); %>>여행
		<input id=in7 type="checkbox" name="int" value="컴퓨터"
		<%for(int i=0;i<val.length;i++) if("컴퓨터".equals(val[i])) out.print("checked"); %>>컴퓨터
		<input id=in7 type="checkbox" name="int" value="영화"
		<%for(int i=0;i<val.length;i++) if("영화".equals(val[i])) out.print("checked"); %>>영화
		<input id=in7 type="checkbox" name="int" value="운동"
		<%for(int i=0;i<val.length;i++) if("운동".equals(val[i])) out.print("checked"); %>>운동
		<input id=in7 type="checkbox" name="int" value="진학"
		<%for(int i=0;i<val.length;i++) if("진학".equals(val[i])) out.print("checked"); %>>진학
	</td>
</tr>
<%	
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>	
<tr>
	<td colspan=2 align=center id=td1>
	<input id= btn1 type="button" value="수정" onclick="check()">
	<input id= btn1 type="reset" value="취소">
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>