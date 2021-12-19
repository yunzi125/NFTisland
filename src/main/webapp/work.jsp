<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.Work"%>
<%@ page import="dao.WorkRepository"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>작품 상세 정보</title>
 
    <!--    Bootstrap 초기화 부분 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">
	function addToLiked(){
		if(confirm("작품에 '좋아요'를 누르시겠습니까? '좋아요'는 작가에게 큰 힘이 됩니다!")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">NFT 작품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		WorkRepository dao = WorkRepository.getInstance();
		Work work = dao.getWorkById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="./resources/images/<%=work.getFilename()%>" 
				style="width: 100%">
			</div>
			<div class="col-md-8">
				<h4><b>[<%=work.getCategory()%>] <%=work.getName()%></b></h4>
				<p><%=work.getDescription()%>
				<p><b>작품코드 : </b><span class="badge badge-danger"> <%=work.getWorkId()%></span>
				<p><b>작가</b> : <%=work.getWorker()%>
				<p><b>판매일</b> : <%=work.getReleaseDate()%>
				<p><b>남은 판매량</b> : <%=work.getUnitsInStock()%>
				<h4><%=work.getUnitPrice()%> KRW </h4>
				<p> <form name="addForm" action="./addLiked.jsp?id=<%=work.getWorkId()%>" method="post">
				<a href="./shippingInfo.jsp" class="btn btn-info">작품 주문하기&raquo;</a> 
				<a href="./liked.jsp" onclick="addToLiked()" class="btn btn-danger">좋아요&raquo;</a>
				<a href="./works.jsp" class="btn btn-secondary">NFT 작품 목록&raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	<%@ page errorPage="exceptionNoWorkId.jsp" %>
</body>
</html>