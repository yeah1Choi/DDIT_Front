<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
button {
	margin: 10px;
}
input[type=button] {
	margin: 5px;
	border-radius: 20px;
}
span {
	color: green;
	font-weight: bold;
}
</style>
<script type="text/javascript">
proc1 =()=> {
	// 입력 값 가져오기
	dongvalue = $('#dong').val().trim();
	console.log(dongvalue);
	
	if(dongvalue.length < 1) {
		alert("동 이름 입력하세요.");
		return false;
	}
	
	// 값 형식 비교
	dongreg = /^[가-힣]+$/;
	
	if(!(dongreg.test(dongvalue))) {
		alert("입력 형식에 맞지 않습니다.");
		return false;
	}
	
	// 서버로 전송 - 비동기로 이 페이지에서 결과 출력
	$.ajax({
		url : 'http://localhost/memberpro/selectByDong.do', // html이라서 풀 주소 씀
		data : {"dong" : dongvalue},
		type : 'post',
		success : function(res) {
			code = "<table class='table table-hover'>";
			code += "<tr><th>우편번호</th><th>주소</th><th>번지</th></tr>";			
			$.each(res, function(i,v){
				bunji = v.bunji;
				if(typeof bunji=="undefined") bunji="";
				
				code += `<tr class="ziptr"><td>${v.zipcode}</td>`;
				code += `<td>${v.sido}시 ${v.gugun} ${v.dong}</td>`;
				code += `<td>${bunji}</td></tr>`;
			})
			code += "</table>";
			
			$('#result1').html(code);
		},
		error : function(xhr) {
			alert("상태 : "+xhr.status);	
		},	
		dataType : 'json'
	})
}

$(function(){
	// 우편번호 검색 결과에서 한 행을 선택하기 위한 식
	$(document).on('click','.ziptr',function(){
		zipcode = $('td:eq(0)', this).text();
		add1 = $('td:eq(1)',this).text();
		
		$('#zip').val(zipcode);
		$('#add1').val(add1);
		
		$('#dong').val("");
		$('#result1').empty();
		
		$('#myModal').modal('hide');
	})
	
	$('input[value=중복검사]').on('click',function(){
		// 입력한 값 가져오기
		idvalue = $('#id').val().trim();
		console.log(idvalue);
		// 값의 형식 비교
		idreg = /^[a-z][a-zA-Z0-9]{3,10}$/
		if(!(idreg.test(idvalue))) {
			alert("입력하신 아이디가 형식에 맞지 않습니다");
			return false;
		}
		// 서버로 전송
		$.ajax({
			url : "<%= request.getContextPath() %>/idCheck.do",
			data : {"id" : idvalue},
			type : 'get',
			success : function(res){
				$('#idcheck').text(res.flag);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			},
			dataType : 'json'
		})
	})
	
	$('#zipbtn').on('click',function(){
		window.open("searchAddress.html", "우편번호찾기", "width=520px height=400px")
	})

 	$('button[type=button]').on('click',function(){
		
/* 		// 입력한 모든 값을 가져온다
		idvalue = $('#id').val();
		pwdvalue = $('#pwd').val();
		namevalue = $('#name').val();
		birthvalue = $('#birth').val();
		telvalue = $('#tel').val();
		emailvalue = $('#email').val();
		zipvalue = $('#zip').val();
		add1value = $('#add1').val();
		add2value = $('#add2').val();
		
		vdata = {"id":idvalue,"pass":pwdvalue,"name":namevalue,"birth":birthvalue,
				"tel":telvalue,"email":emailvalue,"zip":zipvalue,"add1":add1value,"add2":add2value}; */
				
		// 위의 식을 자동으로 간단히 작성: name 속성이용
		
		sv = $('form').serialize();
		vdata = $('form').serializeArray();
		console.log(sv);
		console.log(vdata);
		
		
 		$.ajax({
			url : "<%=request.getContextPath()%>/Insert.do",
			data : vdata,
			type : "post",
			success : function(res){
				$('#join').html(res.sw);
				// 다른 페이지로 이동 - 뷰가 아닌 서블릿으로 이동하기
//				location.href = "";
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType : 'json'
		}) 
	})
})
</script>
<style type="text/css">
.ziptr:hover {
 	cursor: pointer;
}
</style>
</head>
<body>
<div class="container mt-3">
  <h2>회원가입</h2>
  <form>
    <div class="mb-3 col-sm-7">
      <label for="id">ID:</label>
      <input type="button" value="중복검사" class="btn btn-outline-success btn-sm" id="idbtn">
      <span id="idcheck"></span>
      <input type="text" class="form-control" id="id" name="mem_id"  placeholder="소문자로 시작하는 8자리 입력">
    </div>
    <div class="mb-3 col-sm-7">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" name="mem_name">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="birth">Birth Date:</label>
      <input type="date" class="form-control" id="birth" name="mem_bir">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="tel">Phone Number:</label>
      <input type="text" class="form-control" id="tel" name="mem_hp">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="mem_mail">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="zip">ZIP code:</label>
      <input type="button" value="번호검색" class="btn btn-outline-success btn-sm" id="zipbtn">
      <!-- Button to Open the Modal -->
      <input type="button" value="번호검색모달" class="btn btn-outline-success btn-sm" data-bs-toggle="modal" data-bs-target="#myModal">
      <input type="text" class="form-control" id="zip" name="mem_zip">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="add1">Address:</label>
      <input type="text" class="form-control" id="add1" name="mem_add1">
     </div>
    <div class="mb-3 col-sm-7">
      <label for="add2">Detail address:</label>
      <input type="text" class="form-control" id="add2" name="mem_add2">
     </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
      </div>
    <button type="button" class="btn btn-outline-primary btn-lg">제출</button>
    <button type="reset" class="btn btn-outline-secondary btn-lg">초기화</button>
    
    <span id="join"></span>
  </form>
</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호 찾기</h4>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal"></button> -->
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<p>찾는 동이름을 입력하세요</p>
		<input type="text" id="dong">
		<input type="button" value="찾기" id="btn1" onclick="proc1()" class="btn btn-outline-primary btn-sm">
		<br>
		<div id="result1"></div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>