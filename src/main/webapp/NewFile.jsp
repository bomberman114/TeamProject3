<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <a href="url" onclick="window.open('https://prod.danawa.com/info/popup/termDicPopup.php?searchText=CPU 종류','blank','width=600,height=600')">CPU 종류</a>

  <button>CPU 종류</button>
  <script>
    const $btn = document.querySelector("button");
    $btn.addEventListener("click",(e)=>{
      window.open('https://prod.danawa.com/info/popup/termDicPopup.php?searchText=' + e.target.innerHTML ,'blank','width=600,height=600')
    })

  </script>
</body>
</html>