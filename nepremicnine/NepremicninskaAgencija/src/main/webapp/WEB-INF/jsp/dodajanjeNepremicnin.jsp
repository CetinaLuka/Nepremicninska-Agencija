	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/elements/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="CodePixar">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Real Estate</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/nice-select.css">
		    <link rel="stylesheet" href="css/ion.rangeSlider.css" />
		    <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/main.css">
		</head>
		<body>

			<section class="generic-banner relative">
			<!-- Start Header Area -->
			<header class="default-header">
				<div class="menutop-wrap">
					<div class="menu-top container">
						<div class="d-flex justify-content-end align-items-center">
							<ul class="list">
								<li><a href="tel:+12312-3-1209">+12312-3-1209</a></li>
								<li><a href="#">Sell / Rent Property</a></li>
								<li><a href="#">login / register</a></li>
							</ul>
						</div>
					</div>
				</div>

				<nav class="navbar navbar-expand-lg  navbar-light bg-light">
					<div class="container">
						  <a class="navbar-brand" href="index">
						  	<img src="img/logo.png" alt="">
						  </a>
						  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						    <span class="navbar-toggler-icon"></span>
						  </button>

						  <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
						    <ul class="navbar-nav">
								<li><a href="index.html#home">Home</a></li>
								<li><a href="index.html#service">Service</a></li>
								<li><a href="index.html#property">Property</a></li>
								<li><a href="index.html#contact">Contact</a></li>
								<li><a href="generic.html">Generic</a></li>
								<li><a href="elements.html">Elements</a></li>
						    </ul>
						  </div>
					</div>
				</nav>
			</header>
		<!-- End Header Area -->
			<div class="container pt-90">
				<div class="row align-items-center justify-content-center">
					<div class="col-lg-10">
						<div class="generic-banner-content">
							<p class="text-white">Dodajte hišo, stanovanje ali posest v našo bazo nepremičnin.</p>
						</div>
					</div>
				</div>
			</div>
			</section>
			<br />
			<!-- End banner Area -->
				<!-- Start city Area -->
				<section class="city-area pb-100">
					<div class="container">
						<div class="row">
							<div class="col-4 text-center">
								<a href="#dodaj_stanovanje">
								<button class="genric-btn primary circle">
									Stanovanje
								</button>
								</a>
							</div>
							<div class="col-4 text-center">
								<button class="genric-btn primary circle">
									Hiša
								</button>
							</div>
							<div class="col-4 text-center">
								<button class="genric-btn primary circle">
									Posest
								</button>
							</div>
						</div>
					</div>
				</section>
				<!-- End city Area -->


				<!-- Start Generic Area -->
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h2>Dodaj stanovanje</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<form name="dodaj_stanovanje" id="dodaj_stanovanje" method="POST">
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
									<input type="text" name="naslov" placeholder="Naslov" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Naslov'" required class="single-input">
								</div>
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
									<input type="text" name="kraj" placeholder="Kraj" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kraj'" required class="single-input">
								</div>
								<div class="mt-10">
									<input type="text" name="kvadratura" placeholder="Kvadratura" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kvadratura'" required class="single-input" />
								</div>
								<div class="mt-10">
									<input type="text" name="stevilo_sob" placeholder="Število sob" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Število sob'" required class="single-input" />
								</div>
								<div class="mt-10">
									<input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Letnik izgradnje'" required class="single-input" />
								</div>
								<div class="mt-10">
									<input type="text" name="nadstropje" placeholder="Nadstropje" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nadstropje'" required class="single-input" />
								</div>
								<div class="mt-10">
									<input type="text" name="cena" placeholder="Cena" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Cena'" required class="single-input" />
								</div>
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="prenovljeno" id="prenovljeno" data-toggle="collapse" data-target="#letnik_prenove_skrij">
										<label for="prenovljeno"></label>
									</div>
									<p>Prenovljeno</p>
								</div>
								<div class="mt-10 collapse" id="letnik_prenove_skrij" >
									<input type="text" name="letnik_prenove" placeholder="Letnik prenove" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Letnik prenove'" class="single-input" />
								</div>
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="garaza" id="garaza">
										<label for="garaza"></label>
									</div>
									<p>Garaža</p>
								</div>
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="balkon" id="balkon">
										<label for="balkon"></label>
									</div>
									<p>Balkon</p>
								</div>
								<div class="switch-wrap d-flex">
									<div class="primary-switch mr-10">
										<input type="checkbox" id="dodaten_opis_check" data-toggle="collapse" data-target="#dodaten_opis_skrij">
										<label for="dodaten_opis_check"></label>
									</div>
									<p>Dodaten opis</p>
								</div>
								<div class="mt-10 mb-10 collapse" id="dodaten_opis_skrij">
									<textarea name="dodaten_opis" class="single-textarea" placeholder="Dodaten opis" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Dodaten opis'"></textarea>
								</div>
								<!--Zakomentirano, ker mi hoče s tem gumbom submittat form
								<button class="genric-btn default mb-10">
									Dodaj slike
								</button>-->
								<div class="text-center">
									<button type="submit" class="genric-btn primary-border circle mb-50">
										Dodaj stanovanje
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- End Generic Start -->

				<!-- start footer Area -->
				<footer class="footer-area section-gap">
					<div class="container">
						<div class="row">
							<div class="col-lg-3  col-md-6 col-sm-6">
								<div class="single-footer-widget">
									<h6>About Us</h6>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.
									</p>
								</div>
							</div>
							<div class="col-lg-3  col-md-6 col-sm-6">
								<div class="single-footer-widget">
									<h6>Newsletter</h6>
									<p>Stay update with our latest</p>
									<div class="" id="mc_embed_signup">

											<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">

											<div class="d-flex flex-row">

												<input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">


					                            	<button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
					                            	<div style="position: absolute; left: -5000px;">
														<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
													</div>

												<!-- <div class="col-lg-4 col-md-4">
													<button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
												</div>  -->
											</div>
											<div class="info"></div>
											</form>
									</div>
									</div>
							</div>
							<div class="col-lg-3  col-md-6 col-sm-6">
								<div class="single-footer-widget mail-chimp">
									<h6 class="mb-20">Instragram Feed</h6>
									<ul class="instafeed d-flex flex-wrap">
										<li><img src="img/i1.jpg" alt=""></li>
										<li><img src="img/i2.jpg" alt=""></li>
										<li><img src="img/i3.jpg" alt=""></li>
										<li><img src="img/i4.jpg" alt=""></li>
										<li><img src="img/i5.jpg" alt=""></li>
										<li><img src="img/i6.jpg" alt=""></li>
										<li><img src="img/i7.jpg" alt=""></li>
										<li><img src="img/i8.jpg" alt=""></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="single-footer-widget">
									<h6>Follow Us</h6>
									<p>Let us be social</p>
									<div class="footer-social d-flex align-items-center">
										<a href="#"><i class="fa fa-facebook"></i></a>
										<a href="#"><i class="fa fa-twitter"></i></a>
										<a href="#"><i class="fa fa-dribbble"></i></a>
										<a href="#"><i class="fa fa-behance"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p class="footer-text m-0">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
					</div>
				</footer>
				<!-- End footer Area -->
			</div>
			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
			<script src="js/vendor/bootstrap.min.js"></script>
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.nice-select.min.js"></script>
			<script src="js/jquery.sticky.js"></script>
			<script src="js/ion.rangeSlider.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>
			<script src="js/main.js"></script>
	</body>
</html>
