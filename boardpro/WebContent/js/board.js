/**
 * 
 */
$.listBoardServer = function(cpage) {
	vtype = $('#stype option:selected').val().trim();
	vword = $('#sword').val().trim();

	console.log(vtype, vword);

	$.ajax({
		url: `${mypath}/boardList.do`,
		type: 'post',
		data: { 
			"page": cpage, 
			"stype": vtype, 
			"sword": vword 
		},
		success : function(res) {
			code = '<div class="container mt-3">';
			code += '<div id="accordion">';
			
			$.each(res.datas, function(i,v){
				code += `<div class="card">
				<div class="card-header">
					<a class="collapsed btn" data-bs-toggle="collapse" href="#collapse${v.num}">게시판 제목 #1</a>
				</div>
				<div id="collapse${v.num}" class="collapse show"
					data-bs-parent="#accordion">
					<div class="card-body">
						<div class="title">
							<div class="title-content">
								<p>작성자 : </p><span class="writer">${v.writer}</span>
								<p>이메일 : </p><span class="email">${v.mail}</span>
								<p>조회수 : </p><span class="hit">${v.hit}</span>
								<p>날 짜 : </p><span class="date">${v.wdate}</span>
							</div>
							<div class="btns">
								<input idx="${v.num}" type="button" value="수정" class="action" name="modify"> 
								<input idx="${v.num}" type="button" value="삭제" class="action" name="delete">
							</div>
						</div>
						<hr>
						<div class="content">${v.content}</div>
						<div class="reply">
							<textarea rows="" cols="">댓글 작성 칸</textarea>
							<input type="button" value="등록">
						</div>
					</div>
				</div>
			</div>`;
			
			})
			
			code += '</div>';
			code += '</div>';
			
			// 글목록 list 출력
			$('#result').html(code);
			
			// 페이지번호 만들기
			pager = pageList()
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
} 

pageList = function(sp,ep,tp){
	pager = "<ul class='pagination'>";
	
	// 이전
	
	// 페이지 번호
	
	// 다음
}




