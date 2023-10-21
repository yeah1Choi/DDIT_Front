<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/board.js"></script>
<%
// 로그인 상태 
MemberVO vo = (MemberVO) session.getAttribute("loginOK");
String ss = null;

Gson gson = new Gson();
if (vo != null) ss = gson.toJson(vo);
// ss = {"mem_id":"a001", "mem_pass":"asdfasdf", "mem_name":"김은대"}
%>
<script>
mvo = <%=ss%>;
mypath = "<%=request.getContextPath()%>";
currentpage = 1;
reply = {}; // 객체 동적으로 추가 - reply.bonum, reply.name, reply.cont

$(function() {
	// 실행하자마자 list출력 - stype, sword 없다
	$.listBoardServer(currentpage);

	// 페이지 번호 클릭 이벤트
	$(document).on('click', '.pageno', function() {
		currentpage = parseInt($(this).text().trim());
		$.listBoardServer(currentpage);
	})

	// 다음 클릭 이벤트
	$(document).on('click', '#next', function() {
		currentpage = parseInt($('.pageno').last().text()) + 1;
		$.listBoardServer(currentpage);
	})

	// 이전 클릭 이벤트
	$(document).on('click', '#prev', function() {
		currentpage = parseInt($('.pageno').first().text()) - 1;
		$.listBoardServer(currentpage);
	})

	// 검색 이벤트
	$(document).on('click', '#search', function() {
		currentpage = 1;
		$.listBoardServer(currentpage);
	})

	// 수정, 삭제, 댓글등록, 제목클릭, 댓글 삭제, 댓글 수정 이벤트
	$(document).on('click', '.action', function() {

		target = $(this);

		vname = $(this).attr('name');
		vidx = $(this).attr('idx');

		if (vname == "delete") {
		//	alert(vidx + "번 글을 삭제합니다.");
			
			// ajax 실행
			$.deleteBoardServer();
			
		} else if (vname == "title") {
			//alert(vidx + "번  글을 출력합니다.");
			// ajax 수행 - 댓글 출력
			$.listReplyServer();
			
			vaex = $(this).attr('aria-expanded');
			if(vaex == "true") {
				//alert("조회수 증가");
				// ajax 수행 - 조회수 증가
				$.updateHitServer();
			}
			
		} else if (vname == "modify") {
			//alert(vidx + "번 글을 수정합니다.");
			
			$('#uModal').modal('show');
			
			// 본문 내용 가져오기
			vparent = $(this).parents('.card');
			vsub = vparent.find('a').text().trim();
			vpass = vparent.find('.bpass').text();
			vwr = vparent.find('.writer').text();
			vem = vparent.find('.email').text();
			vcon = vparent.find('.content').html(); // <br>태그 포함해서 html
			
			vcon = vcon.replace(/<br>/g, "");
			
			// 수정 모달창에 출력
			$('#uform #uwriter').val(vwr);
			$('#uform #upassword').val(vpass);
			$('#uform #umail').val(vem);
			$('#uform #usubject').val(vsub);
			$('#uform #ucont').val(vcon);
			
			// 글번호를 hidden으로 모달창에 설정
			$('#uform #unum').val(vidx);
			
			$('#uform #uwriter').prop('readonly',true);
			
			// 값을 변경, 수정, 입력하고 전송버튼 클릭 이벤트
			
			
		} else if (vname == "reply") {
			// alert(vidx + "번  글에 댓글을 작성합니다.");

			// 입력한 내용 가져오기 - get
			vcont = $(this).prev().val();
			console.log(vcont);

			reply.name = mvo.mem_name;
			reply.bonum = vidx;
			reply.cont = vcont;

			console.log(reply);

			// ajax수행 - 댓글 저장
			$.insertReplyServer();

			// 입력한 값 지우기 - set
			$(this).prev().val("");
			
		} else if (vname == "r_modify") {
			// alert(vidx + "번 댓글을 수정합니다.");
			
			// 댓글 위치의 요소(div.content) 접근
			vp3 = $(this).parents('.reply-body').find('.rcontent');
			// 댓글 원래 내용 가져오기
			vcont = vp3.html().trim();
			// <br>을 \n으로 변경
			vcont = vcont.replace(/<br>/g, "\n");
			// modifyfrom의 mtext에 출력
			$('#modifyform #mtext').val(vcont);
			// modifyform을 현재 p3위치로 append
			vp3.empty().append($('#modifyform'));
			// modifyfrom을 show
			/* $('#modifyform').show(); */
			$('#modifyform').css('display', 'block');
			
			// 수정한 글을 저장하기
			
			// 
			
		} else if (vname == "r_delete") {
			// alert(vidx+"번 댓글을 삭제합니다.");

			// ajax 수행 - 댓글 삭제
			$.deleteReplyServer();
		}
	})
	
	// 댓글 수정에서 확인버튼 클릭
	$('#mok').on('click',function(){
		// modifycont - 수정된내용
		vnewcontsrc = $('#modifyform #mtext').val(); // \r\n 포함됨
		vnewcont = vnewcontsrc.replace(/\r\n/g, "<br>");
		
		// .content 검색 - ajax를 통해서 DB 수정, 성공시 화면 변경해줌
		vp3 = $('#modifyform').parent();
		
		// modifyform을 다시 body로 이동 - hide
		$('#modifyform').appendTo($('body'));
		$('#modifyform').hide();
		
		// ajax 수행 - 댓글 수정 (cont, renum 필요)
		reply.cont = vnewcontsrc;
		reply.renum = vidx;
		
		$.updateReplyServer();
	})
	// 댓글 수정에서 취소버튼 클릭
	$('#mcancel').on('click',function(){
		replyReset();
	})
	// 댓글 수정시 확인 또는 취소 버튼 클릭시 modifyform을 body로 다시 옮겨놓는 작업
	replyReset = function(){
		// content 또는 rcontent 찾기
		vmp = $('#modifyform').parent();
		
		// modifyform을 body태그로 다시 이동 - append
		$('body').append($('#modifyform'));
		$('#modifyform').hide();
		
		// content에 *원래 내용을 출력
		$(vmp).html(vcont);
	}

	// 글쓰기 이벤트
	$("#bwrite").on('click', function() {
		
		// 로그인 체크
		if (mvo == null) {
			alert("로그인 후 사용가능합니다.");
			return false;
		}
		
		$('#wModal').modal('show');

		// 로그인된 사용자 이름을 모달창의 작성자에 출력한다
		$('#bwriter').val(mvo.mem_name);
		$('#bwriter').prop('readonly', true);
		/* prop() : 속성 부여 메소드, true를 해야 값을 부여한다 */
		/* disabled : 사용 불가능, 전송 기능도 못하게 막음 => readonly로 줘야함 */
		
	})
	
	// 전송버튼 클릭 후, 작성 게시글 전송 이벤트
	$('#wsend').on('click',function(){
		/* 
		// 입력한 모든 값을 가져온다
		vwriter = $('#bwriter').val().trim();
		vsubject = $('#bsubject').val().trim();
		
		// data 만들기
		vdata = {"vwriter" : vwriter, "vsubject" : vsubject};
		 */
		 
		// 입력한 모든 값을 가져온다
		vdata = $('#wform').serializeArray();
		console.log(vdata);
		// ajax 실행
		$.insertBoardServer();
		
		// 모달창 닫기
		$('#wModal').modal('hide');
		
		// 모달창 입력 내용 지우기
		$('#wModal .txt').val("");
	})
	
	
	// 게시물 수정 후 전송버튼 클릭, 전송 이벤트
	$('#usend').on('click',function(){
		// 수정 입력한 모든 값을 가져온다
		//vdata = $('#uform').serializeArray();
		vdata = $('#uform').serializeJSON();
		
		console.log(vdata);
		
		// ajax 실행 - DB 수정완료 성공하면 vdata의 내용으로 본문의 내용을 변경
		$.updateBoardServer();
		
		// 모달창 닫기
		$('#uModal').modal('hide');
		
		// 모달창 입력 내용 지우기
		$('#uModal .txt').val("");
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
	/* display : none; */
	visibility: hidden;
}

#pageList {
	margin: 2%;
	margin-left: 10%;
}

.reply-body {
	border: 2px dotted #ccc;
	background: beige;
	margin: 5px;
	padding: 5px;
}

.reply-body {
	display: flex;
	flex-direction: column;
}

.title {
	display: flex;
	justify-content: space-between;
}
#wform label, #uform label {
	width: 80px;
}
#wform input, #uform input {
	margin: 5px;
}
.bpass {
	display : none;
}
#modifyform {
	display : none;
}
</style>
</head>
<body>

<div id="modifyform">
	<textarea rows="5" cols="40" id="mtext"></textarea>
	<input type="button" value="확인" id="mok">
	<input type="button" value="취소" id="mcancel">
</div>
<br>

	<input type="button" value="글쓰기" id="bwrite">

	<!-- 이벤트 핸들러 없이 부트스트랩으로 모달 이벤트 부여 -->
<!-- 	<input type="button" value="글쓰기" class="btn btn-primary"
		data-bs-toggle="modal" data-bs-target="#wModal"> -->
	<br>
	<br>
	<br>
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
					</select> <input class="form-control me-2" id="sword" type="text"
						placeholder="Search">
					<button id="search" class="btn btn-primary" type="button">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<br>
	<br>

	<div id="result"></div>
	<div id="pageList"></div>

	<!--글쓰기 The Modal -->
	<div class="modal" id="wModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 작성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form name="wform" id="wform">
						<label>작성자</label> 
						<input type="text" class="txt" name="writer" id="bwriter"> <br> 
						<label>제 목</label> 
						<input type="text" class="txt" name="subject" id="bsubject"> <br>
						<label>비밀번호</label> 
						<input type="password" class="txt" name="password" id="bpassword"> <br> 
						<label>이메일</label>
						<input type="text" class="txt" name="mail" id="bmail"> <br>
						<label>내 용</label>
						<textarea class="txt" rows="7" cols="50" name="content" id="bcont"></textarea>
						<br> <input type="button" value="전송" id="wsend">
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	
	
		<!--글 수정 Modal -->
	<div class="modal" id="uModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form name="uform" id="uform">
						<!-- name 속성이 vo와 같아야 beanUtils 한번에 가져올 수 있음 -->
						<input type="hidden" class="txt" name="num" id="unum">
						<label>작성자</label> 
						<input type="text" class="txt" name="writer" id="uwriter"> <br> 
						<label>제 목</label> 
						<input type="text" class="txt" name="subject" id="usubject"> <br>
						<label>비밀번호</label> 
						<input type="password" class="txt" name="password" id="upassword"> <br> 
						<label>이메일</label>
						<input type="text" class="txt" name="mail" id="umail"> <br>
						<label>내 용</label>
						<textarea class="txt" rows="7" cols="50" name="content" id="ucont"></textarea>
						<br> <input type="button" value="전송" id="usend">
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>