/**
 * 
 */
// 댓글 수정
$.updateReplyServer = function() {
	$.ajax({
		url: `${mypath}/ReplyUpdate.do`,
		type: 'post',
		data: reply, // reply 안에 cont, renum
		success: function(res) {
			if (res.sw == "성공") {
				$(vp3).html(vnewcont);
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 게시물 수정
$.updateBoardServer = function() {
	$.ajax({
		url: `${mypath}/BoardUpdate.do`,
		type: 'post',
		data: vdata, // vdata 안에는 num, writer, mail, content, password가 들어감
		success: function(res) {
			if (res.sw == "성공") {
				// vdata의 내용으로 화면상 게시물을 변경한다
				vparent.find('a').text(vdata.subject);
				vparent.find('.bpass').text(vdata.password);
				vparent.find('.writer').text(vdata.writer);
				vparent.find('.email').text(vdata.mail);
				
				cont = vdata.content;
				cont = cont.replace(/\n/g,"<br>");
				
				vparent.find('.content').html(cont);
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 조회수 증가
$.updateHitServer = function() {
	$.ajax({
		url: `${mypath}/HitUpdate.do`,
		type: 'get',
		data: { "num": vidx },
		success: function(res) {
			if (res.sw == "성공") {
				// 화면부분의 조회수를 변경
				// 공통조상 - 후손 class=hit을 찾는다
				vhit = target.parents('.card').find('.hit');

				// 이 값을 가져와 1 증가시킴 - 출력용
				hitvalue = parseInt(vhit.text()) + 1;

				// 1 증가된 값을 다시 출력한다
				vhit.text(hitvalue);
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 게시글 삭제
$.deleteBoardServer = function() {
	$.ajax({
		url: `${mypath}/BoardDelete.do`,
		type: 'get',
		data: { "num": vidx },
		success: function(res) {
			if (res.sw == "성공") {
				$.listBoardServer(currentpage);
				/* 마지막 페이지인 경우 게시물이 사라지면서 현 페이지에 게시물이 하나도 없을 때 오류가 남*/
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 게시글 저장
$.insertBoardServer = function() {
	$.ajax({
		url: `${mypath}/BoardInsert.do`,
		type: 'post',
		data: vdata,
		success: function(res) {
			if (res.sw == "성공") {
				currentpage = 1;
				$.listBoardServer(currentpage);
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 댓글 삭제
$.deleteReplyServer = function() {
	$.ajax({
		url: `${mypath}/ReplyDelete.do`,
		type: 'post',
		data: { "renum": vidx },
		success: function(res) {
			// DB 삭제 성공했으면 화면에서 삭제
			if (res.sw == "성공") {
				target.parents('.reply-body').remove();
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 댓글 리스트 가져오기
$.listReplyServer = function() {
	$.ajax({
		url: `${mypath}/ReplyList.do`,
		type: 'post',
		data: { "bonum": vidx },
		success: function(res) {
			rcode = "";
			$.each(res, function(i, v) {
				cont = v.cont;
				vcont = cont.replaceAll(/\n/g, "<br>");

				rcode += `<div class="reply-body">
						<div class="title">
							<div class="title-content">
								<p>작성자 : </p><span class="rwriter">${v.name}</span>
								<p>날 짜 : </p><span class="rdate">${v.redate}</span>
							</div>`

				if (mvo != null && mvo.mem_name == v.name) {
					rcode += `<div class="btns">
								<input idx="${v.renum}" type="button" value="댓글수정" class="action" name="r_modify"> 
								<input idx="${v.renum}" type="button" value="댓글삭제" class="action" name="r_delete">
								</div>`
				}

				rcode += `</div>
						<div class="content rcontent">${vcont}</div>
					</div>`
			})
			// 댓글 리스트 출력 => card-body의 클릭된 부모
			$(target).parents('div.card').find('.reply-body').remove();
			$(target).parents('div.card').find('.card-body').append(rcode);
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

$.insertReplyServer = function() {
	$.ajax({
		url: `${mypath}/ReplyInsert.do`,
		type: 'post',
		data: reply,   /*name, bonum, cont*/
		success: function(res) {
			// 댓글을 화면에 추가 - insert가 되야 추가
			// 댓글 리스트 가져오기를 수행한다
			$.listReplyServer();
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 게시판 리스트 출력 이벤트
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
		success: function(res) {
			code = '<div class="container mt-3">';
			code += '<div id="accordion">';

			$.each(res.datas, function(i, v) {
				cont = v.content;
				cont = cont.replace(/\n/g, "<br>"); /*g:global전체, .replaceAll(/\n/,~) 이렇게도 가능*/

				code += `<div class="card">
				<div class="card-header">
					<a class="collapsed btn action" name="title" idx="${v.num}" data-bs-toggle="collapse" href="#collapse${v.num}">${v.subject}</a>
				</div>
				<div id="collapse${v.num}" class="collapse"
					data-bs-parent="#accordion">
					<div class="card-body">
						<div class="title">
							<div class="title-content">
								<span class="bpass">${v.password}</span>
								<p>작성자 : </p><span class="writer">${v.writer}</span>
								<p>이메일 : </p><span class="email">${v.mail}</span>
								<p>조회수 : </p><span class="hit">${v.hit}</span>
								<p>날 짜 : </p><span class="date">${v.wdate}</span>
							</div>`

				if (mvo != null && mvo.mem_name == v.writer) {
					code += `<div class="btns">
								<input idx="${v.num}" type="button" value="수정" class="action" name="modify"> 
								<input idx="${v.num}" type="button" value="삭제" class="action" name="delete">
							</div>`
				}
				code += `</div>
						
						<div class="content">${cont}</div>
						<div class="reply">
							<textarea rows="" cols="50"></textarea>
							<input type="button" idx="${v.num}" class="action" name="reply" value="등록">
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
			pager = pageList(res.sp, res.ep, res.tp)

			// 출력
			$('#pageList').html(pager);
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

pageList = function(sp, ep, tp) {
	pager = '<ul class="pagination">';

	// 이전
	if (sp > 1) {
		pager += `<li class="page-item"><a id="prev" class="page-link">Previous</a></li>`;
	}

	// 마지막 페이지에서 한개 데이터만 남아 이 데이터를 삭제하면서 현 페이지가 없어진 경우를 위함
	if (currentpage > tp) currentpage = tp;

	// 페이지 번호
	for (i = sp; i <= ep; i++) {
		if (i == currentpage) {
			pager += `<li class="page-item active"><a class="page-link pageno">${i}</a></li>`;
		} else {
			pager += `<li class="page-item"><a class="page-link pageno">${i}</a></li>`;
		}
	}

	// 다음
	if (ep < tp) {
		pager += `<li class="page-item"><a id="next" class="page-link">Next</a></li>`;
	}

	pager += '</ul>';

	return pager;
}




