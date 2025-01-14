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
				<a href="/"><img src="/images/logo/logo.svg" alt="찾았닷컴 로고"></a><img class="login-back-btn" onclick="history.back();"
					src="/images/icon/common-icon/back-btn.png" alt="뒤로가기" />
			</h1>
			<form action="/login" method="POST">
				<ul>
					<li>
						<p>이메일</p><input type="email" placeholder="아이디" name="email" autocomplete="email"/>
					</li>
					<li>
						<p>비밀번호</p>
						<div>
							<input type="password" placeholder="비밀번호" name="password" />
							<img class="hidden-btn"
								src="/images/icon/common-icon/hidden-disable-btn.png"
								alt="비밀번호 보기" />
						</div><span class="hint-text"></span>
					</li>
					<li>
						<button>로그인</button>
					</li>
				</ul>
			</form>
			<p>
				아직 회원이 아니세요? <a href="/registerForm">회원가입</a>
			</p>
			<div class="social-login-container">
				<div>
					<hr>
					<span>또는</span>
					<button class="social-btn google-login-btn" data-social="google"><img alt="구글로 로그인" src="/images/icon/social-icon/google.svg">Google 로그인</button>
					<button class="social-btn naver-login-btn" data-social="naver"><img alt="네이버로 로그인" src="/images/icon/social-icon/naver.png">네이버 로그인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	const $form = document.querySelector("form");
	const $ref  = document.querySelector(".hint-text");

	// form 제출 아이디, 비번 유효 확인 -> 유효하면 submit
	$form.addEventListener("submit", async (e) => { 
	  e.preventDefault();
	  $ref.innerHTML = "";

	  if (!$form[0].value.trim()) {
	    $ref.innerHTML = "아이디를 입력해주세요.";
	    return;
	  }
	  if (!$form[1].value.trim()) {
	    $ref.innerHTML = "비밀번호를 입력해주세요.";
	    return;
	  }
	  
	  try {
	    const isExist = await isUserExist($form[0].value, $form[1].value);
	    console.log(isExist)
	    if (isExist) {
	      e.target.submit();
	    } else {
	      $ref.innerHTML = "※ 아이디 또는 비밀번호가 일치하지 않습니다.";
	    }
	  } catch (err) {
	    console.error("로그인 오류:", err);
	    $ref.innerHTML = "로그인 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.";
	  } 
	});
	
	// 아이디, 비번 유효 확인 ajax
	async function isUserExist(userEmail, userPassword) {
	    const res = await fetch("/IsUserExist", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ user_email: userEmail, user_password: userPassword })
	    });
	
	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	    return await res.json();
	}


			
	    // 입력 비밀번호 확인
      const $hiddenBtn = document.querySelector(".hidden-btn");
      let isHidden    = true;
      document.addEventListener("click", (e) => {
        if(e.target.matches(".hidden-btn")){
          isHidden = !isHidden;
          hiddenBtnClick(isHidden,e.target)
        }
      });

      // 입력 비밀번호 확인 함수 
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
      
      // 소셜로그인
      document.addEventListener("click",(e)=>{
    	  const clicked = e.target;
    	  if(clicked.closest(".social-btn")){
    		  window.location.href = "http://localhost:9090/oauth2/authorization/" + clicked.dataset.social
    	  }
      })
      

      
    </script>
</body>
</html>





