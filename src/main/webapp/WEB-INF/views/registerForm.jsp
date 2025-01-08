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
				<a href="/"><img src="/images/logo/logo.svg" alt="찾았닷컴 로고"></a>회원가입<img class="login-back-btn" onclick="history.back();"
					src="/images/icon/common-icon/back-btn.png" alt="뒤로가기" />
			</h1>
			<form action="/register" method="POST">
				<ul>
					<li>
						<p>이메일 주소</p>
						<div>
							<input type="email" placeholder="이메일 주소 입력" name="user_email" required />
						</div><span class="hint-text"></span>
					</li>
					<li>
						<p>비밀번호</p>
						<div>
							<input type="password" placeholder="비밀번호 숫자 영문 특수문자 포함 8자 이상" name="user_password" required />
							<img class="hidden-btn"
								src="/images/icon/common-icon/hidden-disable-btn.png"
								alt="비밀번호 보기" />
						</div><span class="hint-text"></span>
					</li>
					<li>
						<p>비밀번호 확인</p>
						<div>
							<input class="pwdup-input" type="password" placeholder="비밀번호 한 번 더 입력" required /> <img
								class="pwdup-check"
								src="/images/icon/common-icon/hidden-disable-btn.png"
								alt="비밀번호 보기" />
						</div> <span class="hint-text"></span>
					</li>
					<li>
						<p>성함</p>
						<div>
							<input type="text" placeholder="성함 2자 이상" name="user_name" required="required" />
						</div> <span class="hint-text"></span>
					</li>
					<li>
						<p>닉네임</p>
						<div>
							<input type="text" placeholder="닉네임 2자 이상" name="user_nickname" required="required" />
						</div> <span class="hint-text"></span>
					</li>
					<li>
						<button>회원가입</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<script>

      const $form        = document.querySelector("form");
      const $hintText    = document.querySelectorAll(".hint-text")
      const pattern      = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
      const nickpattern  = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
      
      let isEmailVali    = false;
      let isEmaildupVali = false;
      let isPassVali     = false;
      let isPdDuplVali   = false;
      let isNameVali     = false;
      let isNickNameVali = false;
      
      // 입력값 유효성 확인 -> 유효하면 submit
      $form.addEventListener("submit", (e) => {
        e.preventDefault();
        
        if(!isEmailVali){
        	alert("이메일 입력이 올바르지 않습니다.")
        }else if(!isPassVali){
        	alert("비밀번호 입력이 올바르지 않습니다.")
        }else if(!isPdDuplVali){
        	alert("비밀번호가 일치하지 않습니다.")
        }else if(!isNameVali){
        	alert("성함 입력이 올바르지 않습니다.")
        }else if(!isNickNameVali){
        	alert("닉네임 입력이 올바르지 않습니다.")
        }else if(!isEmaildupVali){
        	alert("중복된 이메일이 존재합니다.")
        }else{
        	e.target.submit()
        }
      });
      
      // 비밀번호 확인
      function strongPassword (str) {
    	  return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
    	}
      
      // 입력시 유효성 확인
      document.addEventListener("keyup", (e) => {
    	  // 이메일 유효성 확인
    	  if (e.target.matches("input[type='email']")) {
    	    if (pattern.test(e.target.value)) {
    	      $hintText[0].innerHTML = "";
    	      isEmailVali = true;
    	    } else {
    	      $hintText[0].innerHTML = "이메일 입력이 올바르지 않습니다.";
    	      $hintText[0].style.color = "red";
    	      isEmailVali = false;
    	    }
    	  }
    	  
    	  if (e.target.matches("input[name='user_password']") || e.target.matches(".pwdup-input")) {
    	    const password = $form[1].value;
    	    const confirmPassword = $form[2].value;

    	    // 비밀번호 유효성 확인
    	    if (!strongPassword(password)) {
    	      $hintText[1].innerHTML = "비밀번호 입력이 올바르지 않습니다.";
    	      isPassVali = false;
    	    } else {
    	      $hintText[1].innerHTML = "";
    	      isPassVali = true;
    	      
   	      // 비밀번호 일치 여부 확인
   	      if (confirmPassword && password !== confirmPassword) {
   	        $hintText[2].innerHTML = "비밀번호가 일치하지 않습니다.";
   	        $hintText[2].style.color = "red";
   	        isPdDuplVali = false;
   	      } else if (confirmPassword && password === confirmPassword) {
   	        $hintText[2].innerHTML = "비밀번호가 일치합니다.";
   	        $hintText[2].style.color = "green";
   	        isPdDuplVali = true;
   	      }
    	    }
    	  }
    	  if (e.target.matches("input[name='user_name']")){
    		  if(e.target.value.length > 1 && nickpattern.test(e.target.value)){
    		      $hintText[3].innerHTML = "";
    		      isNameVali   = true;
    		  }else{
    		     $hintText[3].innerHTML = "성함 입력이 올바르지 않습니다.";
    			  isNameVali   = false;
    		  }
    	  }
    	  if (e.target.matches("input[name='user_nickname']")){
    		  if(e.target.value.length > 1 && nickpattern.test(e.target.value)){
    		      $hintText[4].innerHTML = "";
    		      isNickNameVali   = true;
    		  }else{
    		     $hintText[4].innerHTML = "닉네임 입력이 올바르지 않습니다.";
    		     isNickNameVali   = false;
    		  }
    	  }
    	});

      
      // 입력 비밀번호 확인
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

      // 입력 비밀번호 확인 함수
      function hiddenBtnClick(boolVal, target){
        if (boolVal) {
          target.src = "/images/icon/common-icon/hidden-disable-btn.png";
          target.previousSibling.previousSibling.type = "password";
        } else {
          target.src ="/images/icon/common-icon/hidden-active-btn.png";
          target.previousSibling.previousSibling.type = "text";
        }
      }

      // 중복 이메일 확인
      $form[0].addEventListener("blur", async (e) => {
      	if(isEmailVali){
      		const emailDupCheck = await isEmailDupCheck($form[0].value);
      		if(!emailDupCheck){
      			$hintText[0].innerHTML   = "사용가능한 이메일입니다.";
      			$hintText[0].style.color = "green";
      			isEmaildupVali = true
      		}else{
      			$hintText[0].innerHTML = "중복된 이메일이 존재합니다.";
      			isEmaildupVali = false
      		}
      	}
    	  
      })
      
      
			// 중복 이메일 확인 ajax
	  	async function isEmailDupCheck(userEmail) {
		    const res = await fetch("/IsEmailDupCheck", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json",
		        },
		        body: JSON.stringify({ user_email: userEmail})
		    });
		
		    if (!res.ok) {
		        throw new Error(`HTTP error status: ${res.status}`);
		    }
		    return await res.json();
		}

    </script>
</body>
</html>




