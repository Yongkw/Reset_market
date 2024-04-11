<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="800px" align="center">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>연락처</th>
			<th>주소</th>
			<th>닉네임</th>
			<th>선호상품</th>
			<th>프로필이미지</th>
		</tr>
		<c:forEach items="${list}" var="dd">
			<tr>
				<td>${dd.member_id}</td>
				<td>${dd.member_pw}</td>
				<td>${dd.member_name}</td>
				<td>${dd.phone}</td>
				<td>${dd.address}</td>
				<td>${dd.nickname}</td>
				<td>${dd.category_check1}</td>
				<td><img src="./image/${dd.profile_image}" width="50px" height="40px"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>