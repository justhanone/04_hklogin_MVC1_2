<%@page import="com.hk.daos.AdminDao"%>
<%@page import="com.hk.dtos.BoardDto"%>
<%@page import="com.hk.daos.UserDao"%>
<%@ include file="header.jsp" %>
<%@page import="java.util.List"%>
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
	Object obj=request.getAttribute("dto");
	BoardDto dto=(BoardDto)obj;
	
%>

<body>
<h1>수정 폼</h1>
<form action="boardController.jsp" method="post">
<input type="hidden" name="command" value="boardupdate"/>
<table border="1">
	<tr>
		<th>작성자(ID)</th>
		<td><%=dto.getTid() %></td>
	</tr>
	
	<tr>
		<th>글 제목</th>
		<td><%=dto.getTtitle()%></td>
	</tr>
	
	<tr>
		<th>글 내용</th>
		<td>
			<textarea rows="10" cols="60" name="Tcontent"><%=dto.getTcontent()%>
			</textarea>
		</td>
	</tr>
	
	<tr>
		<th>작성 날짜</th>
		<td><%=dto.getTregdate()%></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="submit" value="수정"/>
		<input type="button" value="삭제" onclick="delBoard('<%=dto.getTseq()%>')" />
		<input type="button" value="목록으로 돌아가기" onclick="location.href='boardController.jsp?command=boardlist'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>
<%@ include file="footer.jsp" %>