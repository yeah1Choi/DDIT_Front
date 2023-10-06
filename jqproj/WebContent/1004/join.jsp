<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

</head>
<body>
<div class="container mt-3">
  <h2>회원가입</h2>
  <form>
    <div class="mb-3 col-sm-5">
      <label for="id">ID:</label>
      <input type="button" value="중복검사" class="btn btn-outline-primary btn-sm" id="idbtn">
      <span id="idcheck"></span>
      <input type="text" class="form-control" id="id" name="id">
    </div>
    <div class="mb-3 col-sm-5">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" name="mem_name">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="birth">Birth Date:</label>
      <input type="date" class="form-control" id="birth" name="mem_bir">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="tel">Phone Number:</label>
      <input type="text" class="form-control" id="tel" name="mem_hp">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="mem_mail">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="zip">ZIP code:</label>
      <input type="button" value="번호검색" class="btn btn-outline-primary btn-sm" id="zipbtn">
      <input type="text" class="form-control" id="zip" name="mem_zip">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="add1">Address:</label>
      <input type="text" class="form-control" id="add1" name="mem_add1">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="add2">Detail address:</label>
      <input type="text" class="form-control" id="add2" name="mem_add2">
     </div>
    <div class="mb-3 col-sm-5">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass">
     </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
      </div>
    <button type="submit" class="btn btn-outline-success btn-lg">제출</button>
    <button type="reset" class="btn btn-outline-secondary btn-lg">초기화</button>
    
    <span id="join"></span>
  </form>
</div>
</body>
</html>