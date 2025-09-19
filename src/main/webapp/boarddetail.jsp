<%@page import="com.hk.dtos.BoardDto"%>
<%@ include file="header.jsp" %>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 내용</title>

</head>

<%
	//전달된 파라미터를 받아준다.
	Object obj=request.getAttribute("dto");
	BoardDto dto=(BoardDto)obj;
	
	// HkDto dto=(HkDto)request.getAttribute("dto"); 한번에 하기
	
%>

<body>
<h1>게시판 상세보기</h1>
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
			<textarea rows="10" cols="60" name="content" readonly="readonly"><%=dto.getTcontent()%>
			</textarea>
		</td>
	</tr>
	
	<tr>
		<th>작성 날짜</th>
		<td><%=dto.getTregdate()%></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="button" value="수정" onclick="updateForm()" />
		<input type="button" value="삭제" onclick="delBoard('<%=dto.getTseq()%>')" />
		<input type="button" value="목록으로 돌아가기" onclick="location.href='boardController.jsp?command=boardlist'"/>
		</td>
	</tr>
</table>

<script type="text/javascript">
	//위에 '" 뒤에 붙였던거 
	<%-- <%=dto.getSeq()%> --%>
	//필요한 파라미터=pk값
	function updateForm() {
		//수정폼 이동->수정폼에서는 글의 상세 내용 보여주고, 수정 완료 버튼 클릭하면 수정되게 처리
		window.location.href="updateForm.jsp?seq=<%=dto.getTseq()%>";
	}
	
	function delBoard(seq) {
		this.seq=seq;
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="boardController.jsp?command=delboard&seq="+seq;
		}
	}
</script>

</body>
</html>
<%@ include file="footer.jsp" %>