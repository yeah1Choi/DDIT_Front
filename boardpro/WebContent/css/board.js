/**
 * 
 */

$.listBoardServer = function(cpage) {
	
	vtype = $('#stype option:selected').val().trim();
	vword = $('#sword').val().trim();
	
	console.log(vtype, vword);
	
	$.ajax({
		url : `${mypath}/BoardList.do`,
		type : 'post',
		data : {
			"page" : cpage,
			"stype" : vtype,
			"sword" : vword
		},
		success : function(res) {
			code = "<div class='container mt-3'>";
			code += "<div id='accordion'>";
			
			$.each(res.datas, function(i, v) {
				code += 
					`<div class="card">
				      <div class="card-header">
				        <a class="btn" data-bs-toggle="collapse" href="#collapse${v.num}">
				         	${v.subject}
				        </a>
				      </div>
				      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
				        <div class="card-body">
							<div class="pp">
								<p class="p1">
									작성자<span class="writer">${v.writer}</span>
									이메일<span class="emmail">${v.mail}</span>
									조회수<span class="hit">${v.hit}</span>
									날짜<span class="date">${v.wdate}</span>
								</p>
								<p class="p2">
									<input idx="${v.num}" type="button" value="수정" class="action" name="modify">
									<input idx="${v.num}" type="button" value="삭제" class="action" name="delete">
								</p>
							</div>
							<p class="p3">${v.content}</p>
							<p class="p4">댓글쓰기 textarea 등록버튼</p>
				        </div>
				      </div>
				    </div>`;
			})
			
			code += "</div>";
			code += "</div>";
			
			$('#result').html(code);
			
			// 페이지번호 만들기
			pager = pageList(res.sp, res.ep, res.tp);
			
			// 출력
			$('#pageList').html(pager);
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
} /* 리스트 끝 */

pageList = function(sp, ep, tp) {
	
	pager = `<ul class="pagination">`;
	
	// 이전
	if(sp > 1) {
		pager += `<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`;
		
	}
	
	// 페이지 번호
	for(i=sp; i<=ep; i++) {
		if(i==currentpage) {
			pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;
		} else {
			pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
		}
	}
	
	// 다음
	if(ep < tp) {
		pager += `<li class="page-item"><a id="next" class="page-link" href="#">Next</a></li>`;
	}
	
	
	pager += "</ul>";
	
	return pager;
}