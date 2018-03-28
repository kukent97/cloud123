<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
Author: 
	****** Dang Truong Duy Quang - 15110290 ******
-->
<html>
<head>
<title>SEMINAR</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<link href="/Resource/layout/styles/layout.css" rel="stylesheet"
	type="text/css" media="all">
<link rel="shortcut icon" href="/Resource/images/demo/ic_title.png" />
</head>
<body id="top">
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row0">
		<div id="topbar" class="hoc clear">
			<!-- ################################################################################################ -->
			<div class="fl_left">
				<ul class="nospace">
					<li><i class="fa fa-phone"></i> +84 165 9432 579</li>
					<li><i class="fa fa-envelope-o"></i> <a>duyquang24251197@gmail.com</a></li>
				</ul>
			</div>
			<div class="fl_right">
				<ul class="nospace">
					<li><a href="#topbar"><i class="fa fa-lg fa-home"></i></a></li>
					<li><a href="#footer">About</a></li>
					<li><a href="#footer">Contact</a></li>
					<c:choose>
						<c:when test="${empty user }">
							<li><a href="/login">Login</a></li>
							<li><a href="#">Register</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" data-toggle="tooltip"
								data-placement="bottom" title="${user.email }">${user.username }</a></li>
							<li><a href="/logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- Top Background Image Wrapper -->
	<div class="bgded overlay"
		style="background-image: url('/Resource/images/demo/backgrounds/01.jpg');">
		<!-- ################################################################################################ -->
		<div class="wrapper row1">
			<header id="header" class="hoc clear">
				<!-- ################################################################################################ -->
				<div id="logo" class="fl_left">
					<h1>
						<a href="/welcome">INTERNATIONAL CONFERENCE ON SCIENCE & TECHNOLOGY</a>
					</h1>
				</div>
				<!-- ################################################################################################ -->
				<nav id="mainav" class="fl_right">
					<ul class="clear">
						<li class="active"><a href="#">Home</a></li>
						<c:forEach var="category" items="${threecategories}">
							<li><a href="/category/${category.id }">${category.title }</a></li>
						</c:forEach>
						<c:if test="${not empty morecategories }">
							<li><a class="drop" href="#">More</a>
								<ul>
									<c:forEach var="category" items="${morecategories }">
										<li><a href="/category/${category.id }">${category.title }</a></li>
									</c:forEach>
								</ul></li>
						</c:if>
					</ul>
				</nav>
			</header>
			<!-- ################################################################################################ -->
			<div id="pageintro" class="hoc clear">
				<article>
					<h2 class="heading">All the Hot News That's Available to Print</h2>
					<p>We are here to bring you new things! Let's start it now</p>
					<c:choose>
						<c:when test="${empty user }">
							<footer>
								<a class="btn" href="#lastnews">What's new today?</a>
							</footer>
						</c:when>
						<c:otherwise>
							<footer>
								<a class="btn" href="/create/news">Create New Post</a> <a
									class="btn" href="/create/category">Create New Category</a>
							</footer>
						</c:otherwise>
					</c:choose>
				</article>
			</div>
			<!-- ################################################################################################ -->
		</div>
		<!-- ################################################################################################ -->
	</div>
	<!-- End Top Background Image Wrapper -->
	<!-- ################################################################################################ -->

	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body --> <!-- ################################################################################################ -->
		<div class="sidebar one_quarter first">
			<!-- ################################################################################################ -->
			<h6>Best News</h6>
			<nav class="sdb_holder">
				<ul>
					<c:forEach items="${lastnews }" var="news">

						<li><a href="/category/${news.category.id }/news/${news.id }"
							title="${news.title }"> <span
								style="font-family: courier; color: #555555">${fmt.format(news.datecreated) }</span><br />
								${news.title }
						</a></li>
					</c:forEach>

				</ul>
			</nav>
			
			<!-- ################################################################################################ -->
		</div>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div class="content three_quarter">
			<!-- ################################################################################################ -->
			<h1 class="center">WELCOME TO ICST 2018</h1>
			<div>
				<p>&nbsp; &nbsp;System Science and Engineering has emerged as a
					research field that covers a wide spectrum of modern technology. A
					system can be considered as a collection of entities and their
					interrelationships gathered together to form a whole greater than
					the sum of the entities. It also involves people, organizations,
					cultures, activities and interrelationships among them. While
					systems composed of autonomous subsystems are not new, increased
					data density, connectivity and ubiquitous computational resources
					have increased their interdependence and interaction complexity.
					This has in turn made the already difficult job of planning,
					developing and deploying complex systems even more difficult.</p>
				<p>
					&nbsp; &nbsp;Technology advancement not only provides opportunities
					for improving system capabilities but also introduces development
					risks that must be weighed and managed. Thus, it is our goal to
					bring together scholars from all areas to have a forum to discuss,
					demonstrate and exchange research ideas in the scope of system
					science and engineering.<br />
					<br />&nbsp; &nbsp;The International Conference on System Science
					and Engineering 2017 (ICSSE 2017) is an international conference
					that will take place in Ho Chi Minh City during July 21-23, 2017.
					This event will provide a great opportunity for scientists,
					engineers, and practitioners from all over the world to present the
					latest system design concepts, research results, developments and
					applications, as well as to facilitate interactions between
					scholars and practitioners. ICSSE 2017 will feature plenary
					speeches in emerging technology topics given by world renowned
					scholars. The proceedings of ICSSE 2017 will be published by the
					IEEE with EI indexing. In addition, selected high-quality papers
					will be published by special issues of SCI-indexed journals.&nbsp;
				</p>
				<img src="/Resource/images/demo/backgrounds/welcome.jpeg" alt=""
					title="Welcome to YSuria 2018!" />
			</div>
			<!-- ################################################################################################ -->
		</div>
		<!-- ################################################################################################ -->
		<!-- / main body -->
		<div class="clear"></div>
		</main>
	</div>

	<!-- ################################################################################################ -->
	<div class="wrapper row4 bgded overlay"
		style="background-image: url('images/demo/backgrounds/03.png');">
		<footer id="footer" class="hoc clear">
			<!-- ################################################################################################ -->
			<div class="one_quarter first">
				<h6 class="title">OUR Mission</h6>
				<p>It is the leading training, research and technology transfer
					center in Vietnam.</p>
				<p>To continuously innovate and provide human /Resources and
					high-quality scientific products in the fields of vocational
					education, science and technology, meeting the requirements of
					socio-economic development of the land countries and regions.</p>
			</div>
			<div class="one_quarter">
				<h6 class="title">OUR Vision</h6>
				<ul class="nospace linklist">
					<li><p>The University of Technical Education in Ho Chi
							Minh City will become a center of training, research, innovation
							and start-up in leading Vietnam, on a par with prestigious
							universities in the region and the world.</p></li>
				</ul>
			</div>
			<div class="one_quarter">
				<h6 class="title">contact with us</h6>
				<ul class="nospace linklist contact">
					<li><i class="fa fa-map-marker"></i>
						<address>148 Street 2 - Tang Nhon Phu B Ward - District 9- HCMC</address></li>
					<li><i class="fa fa-phone"></i> +84 1659432579</li>
					<li><i class="fa fa-envelope-o"></i> <a
						href="https://www.facebook.com/quang.dang.75248" target="_blank">fb.com/quang.dang.75248</a></li>
					
				</ul>
			</div>
			
			<!-- ################################################################################################ -->
		</footer>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<!-- ################################################################################################ -->
			<p class="fl_left">Copyright © 2018, QUANG GROUP</p>
			<p class="fl_right">Cloud Computing 2018</p>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="/Resource/layout/scripts/jquery.min.js"></script>
	<script src="/Resource/layout/scripts/jquery.backtotop.js"></script>
	<script src="/Resource/layout/scripts/jquery.mobilemenu.js"></script>
	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    if(${not empty deleteMessage})
    	alert("${deleteMessage}");
});
</script>
</body>
</html>