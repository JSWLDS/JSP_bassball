<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css?after">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<%
		String title = "개별 타자 성적 조회";
		String sql = "";
		String bool = "y";
		String REGISTRATION_CODE = request.getParameter("REGISTRATION_CODE");
		if(REGISTRATION_CODE != null){
			title = "선수 등록 코드 : " + REGISTRATION_CODE + " 성적 조회";
		}
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
	%>
<section>
	<%
	
		sql = "SELECT REGISTRATION_CODE FROM TBL_PLAYER_INFO WHERE REGISTRATION_CODE  like '" + REGISTRATION_CODE +"'";
		conn = Util.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(!rs.next()){
			bool = "n";
		}
	%>
	
	
	<% if(REGISTRATION_CODE == null){%>
		<h2 style="text-align: center;"><%= title %></h2>
	
	
	<form action="db_select_1.jsp" method="post" name="form2">
			
		<table border="1">
	
			<tr>
				<td>선수 등록 코드를 입력 하시오</td>
				<td><input type="text" name="REGISTRATION_CODE" ></td>
			</tr>
			<tr>
				<td colspan='2'>
					<input type="submit" value="선수조회">
					<input type="button" value="홈으로" onclick="location.href='index.jsp';">
				</td>
			</tr>
						
		</table>
	</form>
			<%} else if(bool.equals("y")){%>
			<h2 style="text-align: center;"><%= title %></h2>
			<table border="1">
				<tr>
					<td>선수 등록 코드</td>
					<td>선수명</td>
					<td>게임수</td>
					<td>타석수</td>
					<td>안타수</td>
					<td>홈런 수</td>
					<td>공격 포인트</td>
					<td>아웃 카운트 수</td>
					<td>더블 플레이 수</td>
					<td>에러 수</td>
					<td>수비 포인트</td>	
				</tr>
			<%
	
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					
					sql = "SELECT P.REGISTRATION_CODE, P.NAME, H.GAME_NUMBERS, H.APPEARANCE, H.HIT_NUMBERS, H.HOME_RUNS, "+
						"	TO_CHAR((((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + H.HOME_RUNS, '999.00') AS ATK_POINT ,"+
						"	H.PUT_OUT, H.DOUBLE_PLAY, H.ERROR_COUNT, (H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5)) AS DEF "+
						"	FROM TBL_PLAYER_INFO P "+
						"	INNER "+
							"	JOIN TBL_HITTER_INFO H ON P.REGISTRATION_CODE = H.REGISTRATION_CODE "+
						"	WHERE P.REGISTRATION_CODE LIKE '" + REGISTRATION_CODE + "'";
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
						%>
						<tr>
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><%= rs.getString(5) %></td>
							<td><%= rs.getString(6) %></td>
							<td><%= rs.getString(7) %></td>
							<td><%= rs.getString(8) %></td>
							<td><%= rs.getString(9) %></td>
							<td><%= rs.getString(10) %></td>
							<td><%= rs.getString(11) %></td>
						</tr>
						<%
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}%>
				</table>
				<%
			}else { %>
				<div  class="section_1">
					<h1 style="text-align: center; font-size: 50px; margin-bottom: 30px;">선수 등록 코드 : <%= REGISTRATION_CODE %> 성적 조회 결과가 없습니다.</h1>
					<div style="width:100%; text-align: center; margin-top: 5px;">
						<input type="button" onclick="location.href='db_select_1.jsp'" value="돌아가기" />
					</div>
				</div>
			<%
			}
			%>

		<%

			if(REGISTRATION_CODE != null && bool.equals("y")){%>
				<div style="width:100%; text-align: center; margin-top: 5px;">
					<input type="button" onclick="location.href='db_select_1.jsp'" value="돌아가기" />
				</div>
			<%}%>

</section>

	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>