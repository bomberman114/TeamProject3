const prevBtn = document.querySelector(".carousel-button.prev");
const nextBtn = document.querySelector(".carousel-button.next");
const dimPrevBtn = document.querySelector(".home__main-carousel .dim-prev");
const dimNextBtn = document.querySelector(".home__main-carousel .dim-next");
const carousel = document.querySelector(".carousel-container");
const slides = carousel.querySelectorAll(".carousel-slide");
const size = slides[0].clientWidth;
let index = 0;
let autoSlide;

// 클론 생성 함수
function cloneSlides() {
  const totalSlides = slides.length;
  for (let i = 0; i < totalSlides; i++) {
    const liClone = slides[i].cloneNode(true);
    liClone.setAttribute("aria-hidden", "true");
    carousel.appendChild(liClone);
  }
  for (let i = totalSlides - 1; i >= 0; i--) {
    const liClone = slides[i].cloneNode(true);
    liClone.setAttribute("aria-hidden", "true");
    carousel.prepend(liClone);
  }
  carousel.style.transform = `translateX(-${totalSlides * size}px)`;
}

// 초기화 및 이벤트 리스너 설정
function init() {
  cloneSlides();
 // autoSlide = setInterval(nextSlide, 2000);
  prevBtn.addEventListener("click", prevSlide);
  nextBtn.addEventListener("click", nextSlide);
  dimPrevBtn.addEventListener("click", prevSlide);
  dimNextBtn.addEventListener("click", nextSlide);
  carousel.addEventListener("transitionend", resetSlide);
  //carousel.addEventListener("mouseover", handleMouseOver);
  //carousel.addEventListener("mouseleave", handleMouseLeave);
}

// 다음 슬라이드로 이동
function nextSlide() {
  index++;
  moveSlide();
}

// 이전 슬라이드로 이동
function prevSlide() {
  index--;
  moveSlide();
}

// 슬라이드 이동
function moveSlide() {
  carousel.style.transition = "transform 0.4s ease-in-out";
  carousel.style.transform = `translateX(-${(index + slides.length) * size}px)`;
  updateCurrentSlide();
}

// 슬라이드 리셋
function resetSlide() {
  if (index <= -slides.length) {
    carousel.style.transition = "none";
    index = 0;
    carousel.style.transform = `translateX(-${slides.length * size}px)`;
  } else if (index >= slides.length) {
    carousel.style.transition = "none";
    index = 0;
    carousel.style.transform = `translateX(-${slides.length * size}px)`;
  }
  setTimeout(() => {
    carousel.style.transition = "transform 0.4s ease-in-out";
  }, 10);
  updateCurrentSlide();
}

// 현재 슬라이드 번호 업데이트
function updateCurrentSlide() {
  const currentIndex = ((index % slides.length) + slides.length) % slides.length;
  document.querySelector(".nowpage").textContent = currentIndex + 1;
  document.querySelector(".slide-length").textContent = slides.length;
}

// 마우스 이벤트 핸들러
function handleMouseOver() {
  clearInterval(autoSlide);
}

function handleMouseLeave() {
  autoSlide = setInterval(nextSlide, 2000);
}

// 초기화 실행
init();
updateCurrentSlide();
