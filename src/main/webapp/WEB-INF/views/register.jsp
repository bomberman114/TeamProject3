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
			<h1 class="register__h1">
				<a href="/index.html">로고</a>회원가입<img onclick="history.back();"
					src="/images/icon/common-icon/back-btn.png" alt="뒤로가기" />
			</h1>
			<form action="POST">
				<ul>
					<li>
						<p>아이디</p> <input type="text" placeholder="아이디" name="id" required />
					</li>
					<li>
						<p>비밀번호</p>
						<div>
							<input type="password" placeholder="비밀번호" name="passwd" required />
							<img class="hidden-btn"
								src="/images/icon/common-icon/hidden-disable-btn.png"
								alt="비밀번호 보기" />
						</div> <span class="hint-text"></span>
					</li>
					<li>
						<p>비밀번호 확인</p>
						<div>
							<input type="password" placeholder="비밀번호 한 번 더 입력" required /> <img
								class="pwdup-check"
								src="/images/icon/common-icon/hidden-disable-btn.png"
								alt="비밀번호 보기" />
						</div> <span class="hint-text"></span>
					</li>
					<li>
						<p>이메일 주소</p>
						<div class="register__email-div">
							<input type="text" placeholder="이메일 주소 입력" name="email" required />
							@ <select name="" id="" required aria-placeholder="선택해주세요">
								<option value="" selected style="display: none;" disabled>선택해주세요.</option>
								<option>naver.com</option>
								<option>gmail.com</option>
								<option>hanmail.net</option>
								<option>nate.com</option>
								<option>hotmail.com</option>
								<option>daume.net</option>
								<option>outlook.com</option>
								<option>kakao.com</option>
								<option>직접입력</option>
							</select>
						</div> <span class="hint-text"></span>
					</li>
					<li>
						<p>닉네임</p>
						<div>
							<input type="text" placeholder="닉네임 입력" name="name" />
						</div>
					</li>
					<li>
						<button>회원가입</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<script>
      const $form     = document.querySelector("form");
      const $select   = document.querySelector("select")
      const $hintText = document.querySelector(".hint-text")
      $form.addEventListener("submit", (e) => {
        e.preventDefault();
      });

      const $hiddenBtn = document.querySelector(".hidden-btn");
      let isHidden    = true;
      let isDupHidden = true;
      document.addEventListener("click", (e) => {
        if(e.target.matches(".hidden-btn")){
          isHidden = !isHidden;
          hiddenBtnClick(isHidden,e.target)
        }
        if(e.target.matches(".pwdup-check")){
          isDupHidden = !isDupHidden;
          hiddenBtnClick(isDupHidden,e.target)
        }
      });

      function hiddenBtnClick(boolVal, target){
        console.log(target.previousSibling.previousSibling)
        if (boolVal) {
          target.src = "/images/icon/common-icon/hidden-disable-btn.png";
          target.previousSibling.previousSibling.type = "password";
        } else {
          target.src ="/images/icon/common-icon/hidden-active-btn.png";
          target.previousSibling.previousSibling.type = "text";
        }
      }

      $select.addEventListener("change",(e)=>{
        if(e.target.value == "직접입력"){
          const $input = document.createElement("input")
          $input.placeholder = "직접입력"
          e.target.replaceWith($input)
        }
      })

    </script>
</body>
</html>




