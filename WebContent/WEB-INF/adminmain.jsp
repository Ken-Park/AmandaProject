<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Main</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>

<body>
	<!-- 왼쪽 네비 시작 -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
							class="menu-icon fa fa-cogs"></i>잔여좌석
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/manu.jsp"> <i
							class="menu-icon fa fa-table"></i>메뉴
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="Board.board?currentPage=1"> <i
							class="menu-icon fa fa-th"></i>고객의소리
					</a></li>
					<c:choose>
						<c:when test="${user == null }">
							<li id="charge" class="menu-item-has-children dropdown"><a
								href="#"> <i class="menu-icon fa fa-tasks"></i>충전하기
							</a></li>
							<script>
                     $("#charge").on("click",function(){
                        alert("로그인 후 이용가능합니다.");   
                     })
                  </script>
						</c:when>
						<c:otherwise>
							<li id="charge" class="menu-item-has-children dropdown"><a
								href="page?url=WEB-INF/pay.jsp"> <i
									class="menu-icon fa fa-tasks"></i>충전하기
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
					<a class="navbar-brand" href="./"><img src="images/logo.png"
						alt="Logo"></a> <a class="navbar-brand hidden"
						href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
						alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
						class="fa fa-bars"></i></a>
				</div>
			</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		</header>
		<!--       상단 네비 끝 -->
		<!-- Content 시작 -->
		<div class="content">
<!--chart 시작  -->
			<div >오늘 누적 방문자 수</div>
	<canvas id="myChart"></canvas>
	<script>
			
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {  
  
    type:'line',
 
    data: {
    			
    			  labels: [
    				  <c:forEach var="dto" items="${list}">
    				 '${dto.date}',
    				 </c:forEach>
    			  ],
    		  datasets: [{
    	            label: 'Date',
    	            backgroundColor: 'rgb(255, 99, 132)',
    	            borderColor: 'rgb(255, 99, 132)',
    	            data: [ <c:forEach var="dto" items="${list}">
   				 '${dto.vcount}',
				 </c:forEach>]
    	        }]
    			 
        
       
    },
    options:{},
	 title: {
		 text: '최근 5일 하루 총 방문자 수 ' 
	 }

});

</script>
<!--  3시간전 방문자 수 -->

<div >3시간전 방문자 수</div>
	<canvas id="myChart2"></canvas>
	<script>
			
var ctx = document.getElementById('myChart2').getContext('2d');
var chart = new Chart(ctx, {  
  
    type:'line',
 
    data: {
    			
    			  labels: ['9시간전','6시간전','3시간전'
    				 
    			  ],
    		  datasets: [{
    	            label: 'Date',
    	            backgroundColor: 'rgb(255, 99, 132)',
    	            borderColor: 'rgb(255, 99, 132)',
    	            data: [ <c:forEach var="dto" items="${list1}">
      				 '${dto.vcount}',
    				 </c:forEach>
				]
    	        }]
    			 
        
       
    },
    options:{},
	 title: {
		 text: '오늘 하루 최근 방문자 수  ' 
	 }

});

</script>

</body>
</html>



