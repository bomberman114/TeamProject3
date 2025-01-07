<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
  </head>
  <body>
    <div class="login-wrap">
      <div class="login-inner">
        <h1>
          <a href="#">로고</a
          ><img onclick="history.back();" src="/images/icon/common-icon/back-btn.png" alt="뒤로가기" />
        </h1>
        <form action="POST">
          <ul>
            <li>
              <p>아이디</p>
              <input type="text" placeholder="아이디" name="id" />
            </li>
            <li>
              <p>비밀번호</p>
              <div>
                <input type="password" placeholder="비밀번호" name="passwd" />
                <img
                  class="hidden-btn"
                  src="/images/icon/common-icon/hidden-disable-btn.png"
                  alt="비밀번호 보기"
                />
              </div>
              <span class="hint-text"></span>
            </li>
            <li>
              <button>로그인</button>
            </li>
          </ul>
        </form>
        <p>아직 회원이 아니세요? <a href="/register.html">회원가입</a></p>
      </div>
    </div>
    <script>
      const $form     = document.querySelector("form");
      const $hintText = document.querySelector(".hint-text")
      $form.addEventListener("submit", (e) => {
        e.preventDefault();
        if($form["id"].value == "" || $form["id"].value == null){
          $hintText.innerHTML = "아이디를 입력해주세요." ;
          return false;
        }else if($form["passwd"].value == "" || $form["passwd"].value == null){
          $hintText.innerHTML = "비밀번호를 입력해주세요." ;
          return false;
        }
      });

      const $hiddenBtn = document.querySelector(".hidden-btn");
      let isHidden = true;
      $hiddenBtn.addEventListener("click", (e) => {
        isHidden = !isHidden;
        console.log(e.target.previousSibling.previousSibling);
        if (isHidden) {
          e.target.src = "/images/icon/common-icon/hidden-disable-btn.png";
          $form["passwd"].type = "password";
        } else {
          e.target.src = "/images/icon/common-icon/hidden-active-btn.png";
          $form["passwd"].type = "text";
        }
      });
    </script>
  </body>
</html>





