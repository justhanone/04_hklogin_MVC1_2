<%@page import="com.hk.dtos.BoardDto"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp" %>
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
<%
	List<BoardDto> list=(List<BoardDto>)request.getAttribute("list");
	BoardDto dtos=new BoardDto();
%>
<body>
<div id="container">
	<div class="main">
		<div>
			<span>
			<%=ldto.getId()%>[<%=ldto.getRole()%>]
			님이 로그인 하였습니다.
			</span>
			<span>
				<a href="adminController.jsp?command=userlistall">회원전체조회</a>
			</span>|
			<span>
				<a href="adminController.jsp?command=userlist">회원정보[등급]수정</a>
			</span>|
			<span>
				<a href="adminController.jsp?command=admin_main">메인으로 돌아가기</a>
			</span>|
			<span>
				<a href="userController.jsp?command=logout">로그아웃</a>
			</span>
		</div>
	</div>
	<div class="admin_content">
		<h1>관리자 페이지</h1>
		<button id="bb" type="button" class="btn btn-primary" 
			onclick="location.href='boardController.jsp?boardupdate?command=boardinset&Tseq=<%=dtos.getTseq()%>' ">게시글 생성</button>
			
		<div class="userlist">
			<table border="1" class="table  table-striped table-hover">
				<tr class="table-primary">                  
					<th>회원번호</th>
					<th>아이디</th>
					<th>제목</th>
					<th>생성 날짜</th>
				</tr>
				<%
					for(BoardDto dto:list){
						%>
						<tr>
							<td><%=dto.getTseq()%></td>
							<td><%=dto.getTid()%></td>
							<td><a href="boardController.jsp?command=boarddetail&Tseq=<%=dto.getTseq()%>" ><%=dto.getTtitle()%></a></td>
							<td><%=dto.getTregdate()%></td>
						</tr>						
						<%
					}
				%>
			</table>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>