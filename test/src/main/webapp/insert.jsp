<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<form name="form1" method="post" action="action.jsp">
			<h2 style="text-align: center;">타자 성적 등록</h2>
			<table border='1'>
				<tr>
					<td>타자 선택</td>
					<td>
						<select name="REGISTRATION_CODE">
							<option value="0">타자 선택</option>
							<option value="A001">[A001]김길동</option>
							<option value="A005">[A005]이길동</option>
							<option value="B002">[B002]홍길동</option>
							<option value="B006">[B006]조길동</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">공격 포인트</td>
				</tr>
				<tr>
					<td>게임 수</td>
					<td><input type="number" name="GAME_NUMBERS" value="">게임</td>
				</tr>
				<tr>
					<td>타석 수</td>
					<td><input type="number" name="APPEARANCE" value="">타수</td>
				</tr>
				<tr>
					<td>안타 수</td>
					<td><input type="number" name="HIT_NUMBERS" value="">안타</td>
				</tr>
				<tr>
					<td>홈런 수</td>
					<td><input type="number" name="HOME_RUNS" value="">홈런</td>
				</tr>
				<tr>
					<td colspan="2">수비 포인트</td>
				</tr>
				<tr>
					<td>아웃 카운트 수</td>
					<td><input type="number" name="PUT_OUT" value="">회</td>
				</tr>
				<tr>
					<td>더블 플레이 수</td>
					<td><input type="number" name="DOUBLE_PLAY" value="">회</td>
				</tr>
				<tr>
					<td>에러</td>
					<td><input type="number" name="ERROR_COUNT" value="">회</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript" src="check.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>