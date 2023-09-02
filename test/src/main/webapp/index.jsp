<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<h2 style="text-align: center;">타자 성적관리 프로그램</h2>
		<pre>
· 엄무요건에 따라 선수 정보 테이블, 타격 정보 테이블, 주루 정보 테이블을 생성하여야 한다.

· 선수 정보 테이블 입력 데이터들은 샘플데이터를 참조하여 입력하고, 해당 데이터를 이용하여 프로그램

작성과 테스트를 실시하여야 한다.

· 타격 정보 테이블의 입력과 주루 정보 테이블의 데이터는 샘플데이터를 참조하며, 타자 성적관리 등록

화면을 이용하여 입력한다.

· 개별 타자 성적 조회 업무는 선수 등록 코드를 활용하여 개별 타자 성적관리 를 조회할 수 있다.

· 전체 차자 성적 조회 업무는 전체 타자의 성적 정보를 조회할 수 있다.
		</pre>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>