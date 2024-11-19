<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 3</title>
</head>
<body>
<%
	if(request.isRequestedSessionIdValid()) {
		String session_id = session.getId();
		long last_time = session.getLastAccessedTime();
		long start_time = session.getCreationTime();
		long used_time = (last_time - start_time) / 60000;
		
		out.println("세션 아이디: " + session_id + "<br>");
		out.println("오청 시각 시간: " + start_time + "<br>");
		out.println("요청 마지막 시간: " + last_time + "<br>");
		out.println("웹 사이트의 경과시간: " + used_time + "<br>");
	} else {
		out.println("세션이 유효하지 않습니다.");
		
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("pw");
		
		if(user_id.equals("admin") && user_pw.equals("1234")) {
			session.setAttribute("userID", user_id);
			session.setAttribute("userPW", user_pw);
			out.println("세션 설정이 성공했습니다<br>");
			out.println(user_id + "님 환영합니다");
		} else {
			out.println("세션 설정이 실패했습니다");
		}
	}
%>
</body>
</html>