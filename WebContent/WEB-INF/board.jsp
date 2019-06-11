<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시판</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<!--title아이콘 변경하는 link  -->
<link rel="shortcut icon" href="images/title.png">

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
	
	<!-- 아이콘 link -->
<link rel="stylesheet" href="css/font-awesome.min.css">
	

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style>

#wrapper {
	margin-top: 50px;
}

#nav {
	box-sizing: border-box;
	text-align: center;
}

#write {
	margin: 0px;
}

#footer {
	text-align: right;
	padding: 0px;
}

#text {
	height: 600px;
	line-height: 600px;
}

.titleLink {
	border: none;
	background-color: #00000000;
}

#noInput {
	border: none;
	background-color: #00000000;
	width: 90%;
}

.titleLink:hover {
	cursor: pointer;
}

#writer {
	word-wrap: break-word;
}

#searchDiv {
	height: 50px;
}

#select, #search {
	height: 30px;
	padding-left: 5px;
	margin-left: 10px;
	margin-top: 10px;
	margin-left: 10px;
}

#select {
	margin-left: 10px;
}

#search {
	margin-left: 0px;
}

#searchButt {
	margin-left: 7px;
	margin-right: 5px;
}

.myrow {
	margin-left: 0px;
	margin-right: 0px;
}
.adminList{
	color:blue;
	font-weight:800;
}
.adminList2{
	color:blue;
	font-weight:600;
}
</style>
</head>
<body>
	<!-- Left Panel -->

	 <aside id="left-panel" class="left-panel">
      <nav class="navbar navbar-expand-sm navbar-default">
         <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
               	<c:choose>
					<c:when test="${user.id != 'admin' }">
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-home fa-lg"></i>Home </a></li>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/adminmain.jsp"><i
							class="menu-icon fa fa-home fa-lg"></i>Home </a></li>
					</c:when>
				</c:choose>
               <li class="menu-item-has-children dropdown"><a
                  href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
                     class="menu-icon fa fa-desktop fa-lg"></i>잔여좌석
               </a></li>
               	<c:choose>
					<c:when test="${user.id != 'admin' }">
					<li class="menu-item-has-children dropdown"><a
              	         href="ClientSelect.admin"> <i
                         class="menu-icon fa fa-cutlery fa-lg"></i>메뉴
            	    </a></li>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<li class="menu-item-has-children dropdown"><a
              	         href="select.admin"> <i
                         class="menu-icon fa fa-cutlery fa-lg"></i>메뉴
					</a></li>
					</c:when>
					</c:choose>
              <li class="active"><a
                  href="Board.board?currentPage=1"> <i
                     class="menu-icon fa fa-comments fa-lg"></i>고객의소리
               </a></li>
               <c:choose>
                   <c:when test="${user.id == 'admin' }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="member.manage"> <i class="menu-icon fa fa-address-book-o fa-lg"></i>고객관리
                     </a></li>
                   
                  </c:when>
                  <c:when test="${user == null }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="#"> <i class="menu-icon fa fa-usd fa-lg"></i>충전하기
                     </a></li>
                     <script>
                     
                     
                     $("#charge").on("click",function(){
                        alert("로그인 후 이용가능합니다.");   
                        $("#loginbtn").trigger("click");
                     })
                  </script>
                  </c:when>
                  <c:otherwise>
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="page?url=WEB-INF/pay.jsp"> <i
                           class="menu-icon fa fa-usd fa-lg"></i>충전하기
                     </a></li>
                  </c:otherwise>
               </c:choose>
            </ul>
         </div>
      </nav>
   </aside>
   <!-- 왼쪽 네비 끝 -->
   <!-- 상단 검색바 마이페이지 등등 시작 -->
   <div id="right-panel" class="right-panel">
      <!-- Header-->
      <header id="header" class="header">
         <div class="top-left">
            <div class="navbar-header">
               
               <c:choose>
					<c:when test="${user.id != 'admin' }">
					  <a class="navbar-brand" href="page?url=WEB-INF/main.jsp"><img src="images/logo5.png"
                  alt="Logo"></a> <a class="navbar-brand hidden"
                  href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
                  alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
                  class="fa fa-bars"></i></a>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<a class="navbar-brand" href="page?url=WEB-INF/adminmain.jsp"><img src="images/logo5.png"
                  alt="Logo"></a> <a class="navbar-brand hidden"
                  href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
                  alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
                  class="fa fa-bars"></i></a>
					</c:when>
				</c:choose>
            </div>
         </div>
         <c:choose>
            <c:when test="${user != null && user.id != 'admin' }"> 
<!--             회원일때 -->
               <div class="top-right">
                  <div class="header-menu pt-3">
                     <h5><img src="https://img.icons8.com/color/30/000000/sales-performance.png">
									 <span id="point" class="pr-3"></span>
									</h5>
									<h5><img src="https://img.icons8.com/color/30/000000/alarm-clock.png">
									
										 <span id="timeout" ></span> 
									</h5>
 									<button type="button" class="btn pr-1 pt-0" id="msg" style="background-color:#00000000"><img src="https://img.icons8.com/color/35/000000/filled-sent.png"></button>
 									<div class="user-area  float-right">
                        				<a href="#" class="active" data-toggle="modal"
                           				aria-haspopup="true" aria-expanded="false"
                           				data-target="#exampleModal1"> <img
                          				 class="user-avatar rounded-circle" src="images/profile.jpg"
                          				 alt="profile" height="80%"></a>
                     				</div>
						
                     	</div>
                     <!--  mypage 사람 사진-->
                    
                  </div>
             
            </c:when>
            <c:when test="${user != null && user.id == 'admin' }"> 
             <div class="top-right">
                  <div class="header-menu">
            
            	
            	<div class="user-area  float-right">
                        				<a href="#" class="active" data-toggle="modal"
                           				aria-haspopup="true" aria-expanded="false"
                           				data-target="#exampleModal1"> <img
                          				 class="user-avatar rounded-circle" src="images/profile.jpg"
                          				 alt="profile"></a>
                     				</div>
                     				</div>
                     				</div>
                     				
            </c:when>
            <c:otherwise>
               <div class="top-right">
                  <div class="header-menu">
                     <div class="header-left">
                       
                        <div class="dropdown for-notification">
                           <button type="button"
                              class="btn btn-outline-danger signbt mb-2" data-toggle="modal"
                              data-target="#exampleModal" id="loginbtn">login</button>
                        </div>
                     </div>
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
      </header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>
									<b>자유 게시판</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8"></div>
				</div>
			</div>
		</div>

		
		<div class="content">
         <div class="animated fadeIn">
            <div class="row">
               <div class="col-md-12">
                  <div class="card">
                     <div class="card-header">
                        <strong class="card-title">

                           <form action="BoardSearch.board">
                              <div id="searchDiv" class="row">
                                 <div class="">
                                    <select id="select" name="select">
                                       <option>제목</option>
                                       <option>작성자</option>
                                    </select>
                                 </div>
                                 <div class="col-6 col-sm-5 col-md-4">
                                    <input type="text" id="search" name="search"
                                       style="width: 100%;"> <input type="hidden"
                                       name="currentPage" value="1">
                                 </div>
                                 <div class="">
                                    <button id="searchButt" class="btn btn-secondary mt-2">검색</button>
                                 </div>
                              </div>
                           </form>

                        </strong>
                     </div>
                     <div class="card-body">
                        <table id="bootstrap-data-table"
                           class="table table-striped table-bordered">
                           <thead>
                              <tr class="row myrow">
                                 <th
                                    class="col-lg-2 col-md-2 col-sm-2 col-5 order-lg-1 order-md-1 order-sm-2 order-2">글
                                    번호</th>
                                 <th
                                    class="col-lg-4 col-md-4 col-sm-12 col-12 order-lg-2 order-md-2 order-sm-1 order-1">글
                                    제목</th>
                                 <th
                                    class="col-lg-2 col-md-2 col-sm-4 col-7 order-md-2 order-sm-2 order-2">작성자
                                 </th>
                                 <th
                                    class="col-lg-2 col-md-2 col-sm-4 col-4 order-md-2 order-sm-2 order-2 d-none d-sm-block">작성
                                    시간</th>
                                 <th
                                    class="col-lg-2 col-md-2 col-sm-2 col-2 order-md-2 order-sm-2 order-2 d-none d-sm-block">조회
                                    수</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="admin" items="${adminList}">
                                 <form action="ShowContents.board" id="formContents">
                                    <tr class="row myrow">
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-2 col-5 order-lg-1 order-md-1 order-sm-2 order-2"><input
                                          type="text" id="noInput" value="[공지 사항]" readonly
                                          class="adminList"><input type="hidden" value="${admin.board_seq}" name="no" ></td>
                                       <td
                                          class="col-lg-4 col-md-4 col-sm-12 col-12 order-lg-2 order-md-2 order-sm-1 order-1"><button
                                             class="titleLink adminList" >${admin.title}</button></td>
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-4 col-7 order-md-2 order-sm-2 order-2 adminList">관리자</td>
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-4 col-4 order-md-2 order-sm-2 order-2 d-none d-sm-block adminList2">${admin.writeDate}</td>
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-2 col-2 order-md-2 order-sm-2 order-2 d-none d-sm-block adminList2">${admin.viewCount}</td>
                                    </tr>
                                 </form>
                              </c:forEach>
                              <c:forEach var="dto" items="${list}">
                                 <form action="ShowContents.board" id="formContents">
                                    <tr class="row myrow">
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-2 col-5 order-lg-1 order-md-1 order-sm-2 order-2"><input
                                          type="text" id="noInput" name="no"
                                          value="${dto.board_seq}" readonly></td>
                                       <td
                                          class="col-lg-4 col-md-4 col-sm-12 col-12 order-lg-2 order-md-2 order-sm-1 order-1"><button
                                             class="titleLink">${dto.title}</button></td>
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-4 col-7 order-md-2 order-sm-2 order-2">${dto.writer}</td>
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-4 col-4 order-md-2 order-sm-2 order-2 d-none d-sm-block">${dto.writeDate}</td>
                                       <td
                                          class="col-lg-2 col-md-2 col-sm-2 col-2 order-md-2 order-sm-2 order-2 d-none d-sm-block">${dto.viewCount}</td>
                                    </tr>
                                 </form>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- .animated -->
         <footer>
            <div>
               <div id="nav" class="col-sm-12">
                  <h5>${navi }</h5>
               </div>
            </div>
            <div>
               <div class="col-12 mt-3" id="footer">
                  <c:if test="${user != null }">
                     <input type="button" id="write" value="글쓰기"
                        class="btn btn-secondary">
                  </c:if>
                  <input type="button" value="전체 글 목록" id="showAll"
                     class="btn btn-secondary"> <input type="button"
                     id="goMain" value="메인 페이지로" class="btn btn-secondary">
               </div>
            </div>
         </footer>
      
        </div>
      <!-- .content -->
   

      <div class="clearfix"></div>

      <footer class="site-footer">
         <div class="footer-inner bg-white">
            <div class="row">
               <div class="col-sm-6">2019년 PC방의 혁신을 일으키다</div>
               <div class="col-sm-6 text-right">
                  Designed by <a href="https://colorlib.com">Amanda</a>
               </div>
            </div>
         </div>
      </footer>
   
      <!--                여기부터 진향이가 만든 로그인폼 -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">L O G I N</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form action="loginProc.member" id="form" name="formname"
                     method="post">
                     <div class="form-group">
                        <label for="exampleFormControlInput1">ID</label> <input
                           type="text" class="form-control" id="joinemail"
                           placeholder="ID를 입력하시오" required name="loginid"
                           onkeypress="press(this.form)">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1">Password</label> <input
                           type="password" class="form-control" id="joinpassword"
                           placeholder="비밀번호 입력하시오" required name="loginpw"
                           onkeypress="press(this.form)">
                     </div>
                     <div class=row>
                        <button type="button"
                           class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 ml-sm-5"
                           type="button" id="findId">ID 찾기</button>
                        <button type="button"
                           class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 "
                           type="button" id="reinputpw">PW 찾기</button>
                        <button type="button"
                           class="btn btn-outline-info col-6 col-sm-3 mr-sm-2"
                           type="button" id="joinMem">회원 가입</button>
                        <button type="submit"
                           class="btn btn-outline-info col-6 col-sm-2 mr-sm-2" id="login">login</button>
                     </div>
                     <div class="modal-footer"></div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <script>
   
   //엔터 입력시 로그인
    function press(f){ if(f.keyCode == 13){  
       formname.submit();  
       } }
   
   $("#findId").on("click",function(){

      location.href = "page?url=WEB-INF/modifyid.jsp";
      })
   
   
                           $("#reinputpw").on("click",function(){
                           location.href = "page?url=WEB-INF/modifypassword.jsp";
                           })
                           $("#joinMem").on("click",function() {
                           location.href = "page?url=WEB-INF/joinMem.jsp";
                           })
                           document.getElementById("login").onclick = function() {
                           document.getElementById("form").submit();
                           }
                           //                            로그인 버튼과 회원가입 버튼의 script
   </script>

      <!--                   진향이 로그인폼끝 -->
      <!--                         진향이 마이페이지 폼 -->
      <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel1" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <form class="modal-body1">
                  
                     <div class="form-group m-0 p-0">
                        <div class="card">
                           <div class="card-header">
                              <i class="fa fa-user"></i><strong class="card-title pl-2">
                                 My Page </strong>
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                              </button>
                           </div>
                           <div class="card-body">
                              <div class="mx-auto d-block">
                                 <img class="rounded-circle mx-auto d-block"
                                    src="images/profile.jpg" alt="profile image" width="130px">
                                 <h5 class="text-center mt-2 mb-1">
                                    <b>${user.id} 님</b>
                                 </h5>
                                 <!-- <div class="location text-center">Lv. 일반회원</div> -->
                              </div>
                              <hr>
                              <div class="card-text">
                                 <div>
                                    <b>이름 </b>
                                    <p>${user.name}</p>
                                 </div>
                                 <div>
                                    <b>생년월일</b>
                                    <p>${user.birth}</p>
                                 </div>
                                 <div>
                                    <b>이메일</b>
                                    <p>${user.email}</p>
                                 </div>
                                 <div>
                                    <b>핸드폰번호</b>
                                    <p>${user.phone}</p>
                                 </div>
                                 <div>
                                    <b>잔여포인트</b>
                                    <p>${user.point}</p>
                                 </div>
                                 <div>
                                    <b>주소</b>
                                    <p>${user.address1 }</p>
                                    <p>${user.address2 }</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row p-3">
                        <c:if test="${user.id != 'admin' }">
                           <button id="deleteMembtn" type="button"
                              class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 ml-sm-4 p-0" data-dismiss="modal">회원
                              탈퇴</button>
                           <button id="pointPagebtn" type="button"
                              class="btn btn-outline-info col-6 col-sm-3 mr-sm-2" data-dismiss="modal">포인트
                              충전</button>
                           <button id="updatememberbtn" type="button"
                              class="btn btn-outline-info col-6 col-sm-3 mr-sm-2" data-dismiss="modal">정보수정</button>
                        </c:if>
                        <button type="button" class="btn btn-primary col-6 col-sm-2 mr-sm-2 ㅔ-0" id="logoutbtn1">로그아웃</button>

                     </div>
                  </form>

               
            </div>
         </div>
      </div>



      <script>
   
   
   $("#logoutbtn1")
   .on(
         "click",
         function() {
             if(${user.id == 'admin' }){
                location.href = "adminlogoutProc.member";   
             }else{
                location.href = "logoutProc.member";   
             }
             
          })
   
                     $("#updatememberbtn")
                           .on(
                                 "click",
                                 function() {
                                    location.href = "page?url=WEB-INF/ModifyMembers.jsp";
                                 })
                     $("#deleteMembtn")
                           .on(
                                 "click",
                                 function() {
                                    location.href = "page?url=WEB-INF/deleteMem.jsp";
                                 })
                     $("#pointPagebtn").on("click", function() {
                        location.href = "page?url=WEB-INF/pay.jsp";
                     })
                  </script>

		<!-- 진향이 마이페이지 폼끝 -->
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>


	<script>

		$("#showAll").on("click", function() {
			location.href = "Board.board?currentPage=1";
		})

		document.getElementById("goMain").onclick = function() {
			location.href = "page?url=WEB-INF/main.jsp"
		}
		if("${user.id}"!=""){
		document.getElementById("write").onclick = function() {
			location.href = "Write.board"
		}
		}
				   
	</script>
	<!--메시지  -->
		<script>
										//msg보내는 소켓 및 버튼
										 var webSocket = new WebSocket('ws://192.168.60.20/broadcasting');
									    webSocket.onerror = function(event) {
     									 onError(event)
   											 };
  										 webSocket.onmessage = function(event) {
   										   onMessage(event)
  										  };
  										if("${user.id}"=="admin"){
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; 
       											var contents = msg[1];
       											 var who2=msg[2];
       											
     								 if(who!="admin"&&who2=="admin"){
    								window.open("reply.message?who="+who+"&&content="+contents, "",
									"width=500px,height=300px");
     										 }
     								 
    											}
  											
  										  }		 
  									 
  										else{
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; //admin
       											var contents = msg[1];
       											 var who2=msg[2]; //clinet이름      											    							
     								 if("${user.id}"==who2&&who=="admin") 
     								{
    								window.open("replytoclient.message?who="+who2+"&&content="+contents, "",
									"width=500px,height=300px");
     										 
     								 }
     								 else if("admin"==who&&who2=="all")
     								 {
     									 console.log("kk");
     									window.open("page?url=WEB-INF/allclient.jsp","",
    									"location=no, directories=no,width=500px,height=300px");
     									  }
     								 
     							 }
     							
  								}	
  								//메시지 끝
  								
								
											$("#msg")
									.on(
											"click",
											function() {
												
												window.open("page?url=WEB-INF/newmessage.jsp", "","width=500px,height=300px");
											
											})

											                                                         
                           </script>

	<!-- 5분(포인트 300)이 되면 경고창을 날림 / 포인트가 0이 되는 순간 강제 로그아웃되게 만드는 함수 -->
	
	<c:choose>
		<c:when test="${user != null }">
			<script>
	
     function msg_time(){  
		   
    	  $.ajax({  	    	 
    		         url: 'usertime.com', //ComController에 있는 usertime으로 이동함
    		         type: 'POST'
    		          
    		 }).done(function(point){ //컨트롤러에서 1초마다 1씩 감소시키는 포인트값을 수시로 받아온다
    		         		
    			 $("#point").html(point);
    		       	   
    		      m = (Math.floor(point/60)) + "분 "; 
    		      var msg = "<font color='red'>" + m +"</font>";
    		      
    		     $("#timeout").html(msg);
    		                       
    		      if (point == 300){    
    		    	  
    		         alert("선불시간이 5분 남았습니다.");  
    		         
    		      }else if(point == 0){
    		    	  
    		    	  alert("포인트가 0이 되었으므로 자동 로그아웃됩니다.");
    		    	  location.href = "logoutProc.member";
    		    	  clearInterval(tid);   
    		    	  
    		      }else if(point == -1){
    		    	     		    	 
    		    	  $("#point").html(${user.point}); 		    	  
    		    	  $("#timeout").html( "<font color='red'>" + (Math.floor(${user.point}/60))+ "분 " +"</font>");      		    	  		    	 	  
    		    	  clearInterval(tid);     
    		    	  
    		      }   	     	                   		      		      
    		 });   	     
    	   }
    	   		
    	  								
    	   setTimeout(msg_time());//아래의 setInterval코드만 실행할 경우 1초의 딜레이가 생기는데 즉시 포인트와 남은 시간을 보여주기 위해 만듬
    	   
    	   function TimerStart(){tid=setInterval('msg_time()',1000) };
    	   TimerStart();                          
    	  
    	  
   </script>
		</c:when>
	</c:choose>

</body>
</html>
