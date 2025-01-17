# 컴퓨터/PC 중계사이트 찾았닷컴
<img src="https://github.com/user-attachments/assets/81370930-4f5b-45a7-a9b2-cb6eed19022f" alt="배너" width="100%"/>

<br/>
<br/>

<br/>
<br/>

# 프로젝트 소개
- 초급자 + 중급자 + 상급자, 모두를 위한 컴퓨터/PC 중계사이트입니다.
- 프로그램별 제품 사양을 그래프로 표시하여 시각적으로 확인할 수 있습니다.
- PC견적에서 부품들간의 호환성 여부와 호환성을 수치화하여 확인할 수 있습니다.
- 커뮤니티에 등록된 데스크탑 셋업을 바로 견적에 담아서 확인할 수 있습니다.


<br/>
<br/>

# 팀원 및 팀 소개
<table border=1 width=100% style=text-align:center>
  <tr>
    <td>박정환</td><td>조현길</td><td>정연수</td><td>이동기</td><td>정가영</td>
  <tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/c1c2b1e3-656d-4712-98ab-a15e91efa2da" alt="박정환" width="150">
    </td>
    <td>
     <img src="https://github.com/user-attachments/assets/c1c2b1e3-656d-4712-98ab-a15e91efa2da" alt="조현길" width="150">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/c1c2b1e3-656d-4712-98ab-a15e91efa2da" alt="정연수" width="150">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/c1c2b1e3-656d-4712-98ab-a15e91efa2da" alt="이동기" width="150">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/c1c2b1e3-656d-4712-98ab-a15e91efa2da" alt="정가영" width="150">
    </td>
  <tr>
  <tr>
    <td colspan=5>
     프론트엔드, 백엔드 구분 없이 맡은 파트를 구현했습니다.
    </td>
  </tr>
</table>
<br>
<br>

# 1. 개발환경
- Front    : HTML, CSS, Javascript, JSP
- Back &nbsp; :  Java 17, Oracle, SpringBoot, Spring Security,MyBatis
- 버전 및 이슈 관리 : Github
- 협업툴 : Github, Discord, Notion, Figma 
<br/>
<br/>

# 2. Key Features (주요 기능)
- **회원가입**:
  - 회원가입 시 DB에 유저정보가 등록됩니다.

- **로그인/소셜로그인**:
  - 시큐리티 폼로그인과 Oauth2 클라이언트 세션 방식의 구글, 네이버 소셜로그인이 가능합니다.
이동기
정가영
- **간편검색**:
  - 프로그램 권장사양에 따른 제품의 성능그래프 확인이 가능합니다.
  - 제조사,브랜드, 가격 등의 제품 필터링이 가능하빈다.

- **상세검색**:
  - 카테고리별 제품에 대한 자세한 필터링이 가능합니다.
  - 검색바를 이용한 검색시 해당 제품에 대한 카테고리별 분류가 가능합니다.

- **브랜드관**:
  - 제조사에 대한 설명을 확인할 수 있습니다.
  - 제조사의 서비스센터 위치가 지도에 표시됩니다.
  - 제조사의 홈페이지 정보를 iframe으로 불러와 확인할 수 있습니다.

- **PC견적**:
  - 부품별 필터링이 가능하고 견적담기가 가능합니다.
  - 담은 부품을 확인할 수 있고 담은 제품들의 총합계 금액을 확인할 수 있습니다.
  - 부품 간의 호환성 여부와 호환성에 대한 기준을 점수화하여 확인할 수 있습니다.
  - 담은 부품의 견적을 PNG 파일로 저장할 수 있습니다

- **커뮤니티**:
  - HTML 에디터를 활용한 글 작성이 가능하고 글 작성시 제품 정보를 담고 견적보기 클릭시 PC견적과 연동이 가능합니다.
  - 연동된 견적으로 PC견적에서 해당 제품들이 바로 견적에 담깁니다.
<br/>
<br/>

# 3. Development Workflow (개발 워크플로우)
## 브랜치 전략 (Branch Strategy)
우리의 브랜치 전략은 Git Flow를 기반으로 하며, 다음과 같은 브랜치를 사용합니다.

- Main Branch
  - 배포 가능한 상태의 코드를 유지합니다.
  - 모든 배포는 이 브랜치에서 이루어집니다.
  
- develop Branch
  - 기능 개발 후 머지하기 위한 브랜치입니다.

- {name} Branch
  - 팀원 각자의 개발 브랜치입니다.
  - 모든 기능 개발은 이 브랜치에서 이루어집니다.

<br/>
<br/>
