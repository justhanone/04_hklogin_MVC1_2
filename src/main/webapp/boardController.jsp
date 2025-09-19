<%@page import="com.hk.dtos.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.daos.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	String command=request.getParameter("command");

	AdminDao dao=AdminDao.getAdminDao();
	
	//1. boardlist로 가는 기능
	if(command.equals("boardlist")) {
		List<BoardDto> list=dao.getBoardList();
		request.setAttribute("list", list);
		
		pageContext.forward("boardlist.jsp");	
	}
	
	//2. boarddetail로 가는 기능
	else if(command.equals("boarddetail")) {
		String sseq=request.getParameter("Tseq");
		int seq=Integer.parseInt(sseq);
		
		BoardDto dto=dao.getBoard(seq); //dto를 내가 원하는 seq의 내용으로 만듦.
		//dto를 boarddetail.jsp로 전달해야함
		request.setAttribute("dto", dto);
		
		//페이지 이동
		pageContext.forward("boarddetail.jsp");
	}
	
	//3. boardupdate로 가는 기능
	else if(command.equals("boardupdate")) {
		String sseq=request.getParameter("Tseq");
		int seq=Integer.parseInt(sseq);
		
		BoardDto dto=dao.
	}
	
%>
</body>
</html>