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
	
	//3. boardinsert로 가는 기능
	else if(command.equals("boardinsert")) {
		String sseq=request.getParameter("Tseq");
		int seq=Integer.parseInt(sseq);
		/* 
		BoardDto dto=dao. */
	}
	
	//4. board update form으로 가는 기능
	else if(command.equals("boardupdateform")) {
		String sseq=request.getParameter("Tseq");
		int seq=Integer.parseInt(sseq);
		
		BoardDto dto=dao.getBoard(seq);
		
		request.setAttribute("dto", dto);
		
		pageContext.forward("boardUpdateForm.jsp");
	}
	
	//5. board update 기능
	else if(command.equals("boardupdate")) {
		String content=request.getParameter("Tcontent");
		String sseq=request.getParameter("Tseq");
		int seq=Integer.parseInt(sseq);

		BoardDto dto=new BoardDto();
		dto.setTseq(seq);
		dto.setTcontent(content);
		//boolean isS=dao.updateBoard(new HkDto(seq,content));
		//이거도 가능. 단, HkDtd에 생성자 오버로딩을 할 필요가 있음
		
		boolean isS=dao.updateBoard(dto);
		
		if(isS) {
		%>
			<script type="text/javascript">
			alert("회원정보를 수정했습니다.");
			location.href="boardController.jsp?command=boarddetail&Tseq=<%=dto.getTseq()%>";
			</script>
		<%
		}
		else { %>
			<h2>게시글 수정에 실패했습니다.</h2>
			<a href="boardController.jsp?command=boardupdateform&Tseq=<%=dto.getTseq()%>">수정 폼으로 돌아가기</a>
		<% 
		}
	}
%>
</body>
</html>