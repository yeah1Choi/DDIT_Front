<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %> 
<!-- el 태그를 무시한다 : el태그 변환없이 사용가능 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    
    // ${}은 jsp에서 el태그로 사용되는 기호
    // ${} el태그가 아닌 템플릿 리터럴 기호로 설정해야한다
    
    String userId = request.getParameter("id");
    
    %>
    
    <%= userId %>님 환영합니다
    <br>
    <div id="result1"></div>

    <script>
        str = `protocal : ${location.protocal} <br>`;
        str += `hostname : ${location.hostname} <br>`;
        str += `port : ${location.port} <br>`; // 안뜸
        str += `host : ${location.host} <br>`;
        str += `search : ${location.search} <br>`;
        str += `pathname : ${location.pathname} <br>`;

        document.querySelector('#result1').innerHTML = str;
    </script>
</body>
</html>