<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!-- el 태그의 ``기호를 읽을 수 있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 단축메뉴
		//$.get(url, data, success, dataType);
		//$.getJSON(url, data, success);
<%-- 		$.get(
				'<%= request.getContextPath() %>/selectLprod.do',
				function(res){
					code = "";
					$.each(res,function(i,v){
						code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
					})
					$('#lprod').html(code);
				}, 
				'json'
			 );
		$.getJSON(
				'<%= request.getContextPath() %>/selectLprod.do',
				function(res){
					code = "";
					$.each(res,function(i,v){
						code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
					})
					$('#lprod').html(code);
				}); --%>
		
		// lprod list 출력
		$('#btn1').on('click',function(){
			$.ajax({
				url : '<%=request.getContextPath()%>/selectLprod.do',
				type : 'get',
				success : function(res){
					code = "";
					$.each(res,function(i,v){
						code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
					})
					$('#lprod').html(code);
				},
				error : function(xhr){
					alert("상태 : "+xhr.status);
				},
				dataType : 'json'
			})
		})
		
		// lprod 결과 중 하나를 선택
		$(document).on('change','#lprod',function(){
			//console.log($('option:selected',this).val());
			vdata = $('option:selected',this).val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/selectByLgu.do',
				type : 'get',
				data : {"lgu" : vdata},
				success : function(res){
					code = "";
					if(res.sw == "ok") {
						$.each(res.datas,function(i,v){
							code += `<option value="${v.prod_id}">${v.prod_name}</option>`;
						})
					} else {
						code += `<option value="0">데이터 없음</option>`;
					}
					$('#prod').html(code);
				},
				error : function(xhr){
					alert("상태 : "+xhr.status);
				},
				dataType : 'json'
			})
		})
		
		// lprod 결과값을 테이블에 출력
		$(document).on('change','#prod',function(){
			vdata = $('option:selected',this).val();
			
			if(vdata == 0) return false;
			
			$.ajax({
				url : "<%=request.getContextPath()%>/selectByIdDetail.do",
				type : "post",
				data : {"pid" : vdata},
				success : function(res){
					code = "";
					
					code += `<table border = '1' class='table table-hover'>`;
					code += `<tr><td>항목</td><td>내용</td></tr>`;
					code += `<tr><td>prod_id</td><td>${res.prod_id}</td></tr>`;
					code += `<tr><td>prod_name</td><td>${res.prod_name}</td></tr>`;
					code += `<tr><td>prod_lgu</td><td>${res.prod_lgu}</td></tr>`;
					code += `<tr><td>prod_buyer</td><td>${res.prod_buyer}</td></tr>`;
					code += `<tr><td>prod_cost</td><td>${res.prod_cost}</td></tr>`;
					code += `<tr><td>prod_price</td><td>${res.prod_price}</td></tr>`;
					code += `<tr><td>prod_sale</td><td>${res.prod_sale}</td></tr>`;
					code += `<tr><td>prod_outline</td><td>${res.prod_outline}</td></tr>`;
					code += `<tr><td>prod_detail</td><td>${res.prod_detail}</td></tr>`;
					code += `<tr><td>prod_size</td><td>${res.prod_size}</td></tr>`;
					code += `<tr><td>prod_color</td><td>${res.prod_color}</td></tr>`;
					code += `</table>`;
					
					$('#result1').html(code);
				},
				error : function(xhr){
					alert("상태 : "+xhr.status);
				},
				dataType : "json"
			})
		})
	})
</script>
<style type="text/css">
	body {
	padding: 20px;
}
#btn1 {
	margin: 10px 0;
}
</style>
</head>
<body>
	<input type="button" value="click" id="btn1">
	<br>
	<select id="lprod">
		<!-- lprod 컬럼 값이 option으로 나옴 -->
	</select>
	<select id="prod">
		<!-- lprod로부터 prod 컬럼값이 option으로 나옴 -->
	</select>
	<div id="result1">
		<!-- prod의 결과값이 테이블로 나옴 -->
	</div>
	<hr color="red" />
</body>
</html>