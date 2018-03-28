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
<title>Create News</title>
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
						<li class="active"><a href="/welcome">Home</a></li>
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
					<h2 class="heading">All the News That's Fit to Print</h2>
					<p>We are here to bring you new things!</p>
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
			<c:choose>
				<c:when test="${not empty editting}">
					<form action="/update/${editting }/${id }" method="post">
				</c:when>
				<c:otherwise>
					<form action="/create/${isCategory}" method="post">
				</c:otherwise>
			</c:choose>

			<c:if
				test="${not empty idOfCategory || (not empty isCategory && not isCategory)}">
				<label for="slt">Select the category: </label>
				<select name="categoryid" id="slt" class="selectpicker form-control">
					<c:forEach items="${categories}" var="category">
						<c:choose>
							<c:when
								test="${not empty idOfCategory && category.id eq idOfCategory}">
								<option value="${category.id }" selected>${category.title }</option>
							</c:when>
							<c:otherwise>
								<option value="${category.id }">${category.title }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<br />
			</c:if>
			<label for="title">Title: </label> <input value="${title }"
				type="text" id="title" name="title" class="form-control"
				placeholder="Enter title here" required="required" /><br />
			<textarea name="content" id="editor1" rows="10" cols="80">${content }</textarea>
			<br />
			<button type="submit" class="btn btn-success" style="float: right">Next
				>></button>
			</form>
		</div>
		</main>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
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
	<script type="text/javascript"
		src="/Resource/layout/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="/Resource/layout/scripts/jquery.backtotop.js"></script>
	<script type="text/javascript"
		src="/Resource/layout/scripts/jquery.mobilemenu.js"></script>
	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/Resource/ckeditor/ckeditor.js"></script>
	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			CKEDITOR.replace('editor1');
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
</body>
</html>