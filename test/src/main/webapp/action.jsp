<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<%
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String REGISTRATION_CODE = request.getParameter("REGISTRATION_CODE");
			int GAME_NUMBERS = Integer.parseInt(request.getParameter("GAME_NUMBERS"));
			int APPEARANCE = Integer.parseInt(request.getParameter("APPEARANCE"));
			int HIT_NUMBERS = Integer.parseInt(request.getParameter("HIT_NUMBERS"));
			int HOME_RUNS = Integer.parseInt(request.getParameter("HOME_RUNS"));
			int PUT_OUT = Integer.parseInt(request.getParameter("PUT_OUT"));
			int DOUBLE_PLAY = Integer.parseInt(request.getParameter("DOUBLE_PLAY"));
			int ERROR_COUNT = Integer.parseInt(request.getParameter("ERROR_COUNT"));
			
			try{
				
				String sql	= "INSERT INTO TBL_HITTER_INFO (REGISTRATION_CODE, GAME_NUMBERS, APPEARANCE, HIT_NUMBERS, HOME_RUNS, PUT_OUT, DOUBLE_PLAY, ERROR_COUNT) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				conn = Util.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, REGISTRATION_CODE);
				pstmt.setInt(2, GAME_NUMBERS);
				pstmt.setInt(3, APPEARANCE);
				pstmt.setInt(4, HIT_NUMBERS);
				pstmt.setInt(5, HOME_RUNS);
				pstmt.setInt(6, PUT_OUT);
				pstmt.setInt(7, DOUBLE_PLAY);
				pstmt.setInt(8, ERROR_COUNT);
				
				pstmt.executeUpdate();
				
				response.sendRedirect("insert.jsp");
								
			}catch(Exception e) {
				e.printStackTrace();
			}
			

		%>
</body>
</html>