<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<h2 style="text-align: center;">전체 타자 성적 조회</h2>
		<table border="1" class="select_table">
				<tr>
					<td>선수 등록 코드</td>
					<td>선수명</td>
					<td>생년월일</td>
					<td>키</td>
					<td>몸무게</td>
					<td>소속</td>
					<td>선수 등급</td>
					<td>순위</td>
				</tr>
			<%
			
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					
					String sql = "SELECT P.REGISTRATION_CODE, P.NAME, SUBSTR(BIRTH_DAY, 0, 4)||'년'||SUBSTR(BIRTH_DAY, 5, 2)||'월'||SUBSTR(BIRTH_DAY, 7, 2)||'일' AS PDATE, "+
						"	P.HEIGHT, P.WEIGHT, DECODE(SUBSTR(P.REGISTRATION_CODE, 1, 1), 'A', '1군', 'B', '2군') AS reserve, "+
				 		"	ROUND((((((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + H.HOME_RUNS) + ((H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5))))/2) AS TOTAL, "+
						"	RANK() OVER(ORDER BY (((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + ((H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5)))/2 DESC ) AS RANK "+
						"	FROM TBL_PLAYER_INFO P "+
						"	INNER "+
						"	JOIN TBL_HITTER_INFO H ON P.REGISTRATION_CODE = H.REGISTRATION_CODE "+
						"	ORDER BY 8";
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
							
					int grade   =	Integer.parseInt(rs.getString(7));
					String grade_s = "";
					if(100>=grade && grade >=90){
						grade_s = "A";
					}else if(90>grade && grade >=80){
						grade_s = "B";
					}else if(80>grade && grade >=70){
						grade_s = "C";
					}
					else if(70>grade && grade >=60){
						grade_s = "D";
					}else {
						grade_s = "F";
					}
						
						%>
						<tr>
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td style="text-align: left;"><%= rs.getString(5) %></td>
							<td style="text-align: left;"><%= rs.getString(6) %></td>
							<td><%= grade_s %></td>
							<td><%= rs.getString(8) %></td>
						</tr>
						<%
					}
					
					
				}catch(Exception e) {
					e.printStackTrace();
				} 
			%>
			
		</table>
	</section>

	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>