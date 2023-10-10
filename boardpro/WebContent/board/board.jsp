<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://localhost/boardpro/js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(function(){
	
	vtype = $('#stype option:selected').val().trim();
	vword = $('#sword').val().trim();
	console.log(vtype, vword);

	$.ajax({
		url : `${mypath}/boardList.do`;
		type : 'post',
		data : {"page" : "1", "stype" : vtype, "sword" : vword},
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType : 'json'
	})
})
</script>
<style type="text/css">
.card-body {
	display: flex;
	flex-direction: column;
}

.card-body>div {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

div.title-content p {
	display: inline-block;
}

div.content {
	margin: 15px 0;
}

nav {
	margin: 2%;
}

nav a {
	display: none;
	visibility: hidden;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="javascript:void(0)">Logo</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">Link</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">Link</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">Link</a></li>
				</ul>
				<form class="d-flex">
					<select class="form-select" id="stype">
						<option value="">전 체</option>
						<option value="writer">작성자</option>
						<option value="subject">제 목</option>
						<option value="content">내 용</option>
					</select>
					<input class="form-control me-2" id="sword" type="text" placeholder="Search">
					<button class="btn btn-primary" type="button">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div id="result"></div>
	<div id="pageList"></div>
</body>
</html>