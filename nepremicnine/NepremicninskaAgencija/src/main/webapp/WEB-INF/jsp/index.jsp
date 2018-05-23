	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
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

			<!-- Start Header Area -->
			<header class="default-header">
				<nav class="navbar navbar-expand-lg  navbar-light bg-light">
					<div class="container">
						  <a class="navbar-brand" href="index">
						  	<img src="img/logo/logo2.svg" alt="ikonična slika" height="50" width="70">
						  </a>
						<!-- Gumb pri pomanjšanju-->
						  <button class="navbar-toggler" type="button"
								  data-toggle="collapse"
								  data-target="#navbarSupportedContent"
								  aria-controls="navbarSupportedContent"
								  aria-expanded="false"
								  aria-label="Toggle navigation">
						    <span class="navbar-toggler-icon"></span>
						  </button>
						  <div class="collapse navbar-collapse  align-items-end justify-content-end" id="navbarSupportedContent">
						    <ul class="navbar-nav">
								<li><a href="#home">Domov</a></li>
								<li><a href="#service">Storitve</a></li>
								<li><a href="#property">Ponudba</a></li>
								<li><a href="#contact">Kontakt</a></li>
								<li class=""><a href="prijava">Prijava</a></li>
								<li class=""><a href="registracija">Registracija</a></li>
						    </ul>

						  </div>
					</div>
				</nav>


			</header>
			<!-- End Header Area -->

			<!-- start banner Area -->
			<section class="banner-area relative" id="home">
				<div class="overlay overlay-bg"></div>
				<div class="container">
					<div class="row fullscreen align-items-center justify-content-center" style="height: 915px;">
						<div class="banner-content col-lg-12 col-md-12">
							<h1 class="text-uppercase">
								Nepremičninska Agencija
							</h1>
							<div class="search-field">
								<form class="search-form" action="#">
									 <div class="row">
									 	<div class="col-lg-12 d-flex align-items-center justify-content-center toggle-wrap">
											<div class="row">
												<div class="col">
													<h4 class="search-title">Iščite nepremičnine za</h4>
												</div>
												<div class="col">
													<div class="onoffswitch3 d-block mx-auto">
													    <input type="checkbox" name="onoffswitch3" class="onoffswitch3-checkbox" id="myonoffswitch3" checked>
													    <label class="onoffswitch3-label" for="myonoffswitch3">
													        <span class="onoffswitch3-inner">
													            <span class="onoffswitch3-active">
													            	<span class="onoffswitch3-switch">Nakup</span>
													            	<span class="lnr lnr-arrow-right"></span>
													            </span>
													            <span class="onoffswitch3-inactive">
													            	<span class="lnr lnr-arrow-left"></span>
													            	<span class="onoffswitch3-switch">Najem</span>
													            </span>
													        </span>
													    </label>
													</div>													
												</div>
											</div>
									 	</div>
									    <div class="col-lg-3 col-md-6 col-xs-6">
											<select name="location" class="app-select form-control" required>
												<option data-display="Izberite lokacijo">Izberite lokacijo</option>
												<option value="1">Dhaka</option>
												<option value="2">Rangpur</option>
												<option value="3">Bogra</option>
											</select>
									    </div>
									    <div class="col-lg-3 col-md-6 col-xs-6">
											<select name="property-type" class="app-select form-control" required>
												<option data-display="Tip nepremičnine">Tip nepremičnine</option>
												<option value="1">Property type 1</option>
												<option value="2">Property type 2</option>
												<option value="3">Property type 3</option>
											</select>
									    </div>
									    <div class="col-lg-3 col-md-6 col-xs-6">
											<select name="bedroom" class="app-select form-control" required>
												<option data-display="Spalnice">Spalnice</option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
									    </div>
									    <div class="col-lg-3 col-md-6 col-xs-6">
											<select name="bedroom" class="app-select form-control" required>
												<option data-display="Spalnice">Spalnice</option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
									    </div>
									    <div class="col-lg-4 range-wrap">
									    	<p>Cena:</p>
									    	<input type="text" id="range" value="" name="range" />
									    </div>	
									    <div class="col-lg-4 range-wrap">
									    	<p>Velikost(m2):</p>
									    	<input type="text" id="range2" value="" name="range" />
									    </div>										    
									    <div class="col-lg-4 d-flex justify-content-end">
											<button class="primary-btn mt-50" style="height: 45px;">Išči nepremičnine<span class="lnr lnr-arrow-right"></span></button>
										</div>						  
									  </div>
							  	</form>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- End banner Area -->

			<!-- Start service Area -->
			<section class="service-area section-gap" id="service">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="col-md-8 pb-40 header-text">
							<h1>Why we are the best</h1>
							<p>
								Who are in extremely love with eco friendly system.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-6 pb-30">
							<div class="single-service">
								<h4><span class="lnr lnr-user"></span>Expert Technicians</h4>
								<p>
									Usage of the Internet is becoming more common due to rapid advancement of technology and power.
								</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 pb-30">
							<div class="single-service">
								<h4><span class="lnr lnr-license"></span>Professional Service</h4>
								<p>
									Usage of the Internet is becoming more common due to rapid advancement of technology and power.
								</p>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6 pb-30">
							<div class="single-service">
								<h4><span class="lnr lnr-phone"></span>Great Support</h4>
								<p>
									Usage of the Internet is becoming more common due to rapid advancement of technology and power.
								</p>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-service">
								<h4><span class="lnr lnr-rocket"></span>Technical Skills</h4>
								<p>
									Usage of the Internet is becoming more common due to rapid advancement of technology and power.
								</p>				
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-service">
								<h4><span class="lnr lnr-diamond"></span>Highly Recomended</h4>
								<p>
									Usage of the Internet is becoming more common due to rapid advancement of technology and power.
								</p>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-service">
								<h4><span class="lnr lnr-bubble"></span>Positive Reviews</h4>
								<p>
									Usage of the Internet is becoming more common due to rapid advancement of technology and power.
								</p>									
							</div>
						</div>						
					</div>
				</div>	
			</section>
			<!-- End service Area -->

			<!-- Start property Area -->
			<section class="property-area section-gap relative" id="property">
				<div class="overlay overlay-bg"></div>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="col-md-8 pb-40 header-text">
							<h1>Our Top Rated Properties</h1>
							<p>
								Who are in extremely love with eco friendly system.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="single-property">
								<div class="images">
									<img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="">
									<span>For Sale</span>
								</div>
								
								<div class="desc">
									<div class="top d-flex justify-content-between">
										<h4><a href="#">04 Bed Duplex</a></h4>
										<h4>$3.5M</h4>
									</div>
									<div class="middle">
										<div class="d-flex justify-content-start">
										<p>Bed: 04</p>
										<p>Bath: 03</p>
										<p>Area: 750sqm</p>
										</div>
										<div class="d-flex justify-content-start">
										<p>Pool: <span class="gr">Yes</span></p>
										<p>Internet: <span class="rd">No</span></p>
										<p>Cleaning: <span class="rd">No</span></p>
										</div>
									</div>
									<div class="bottom d-flex justify-content-start">
										<p><span class="lnr lnr-heart"></span> 15 Likes</p>
										<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
									</div>	
								</div>	
							</div>
						</div>	
						<div class="col-lg-4">
							<div class="single-property">
								<div class="images">
									<img class="img-fluid mx-auto d-block" src="img/s2	.jpg" alt="">
									<span>For Sale</span>
								</div>
								
								<div class="desc">
									<div class="top d-flex justify-content-between">
										<h4><a href="#">04 Bed Duplex</a></h4>
										<h4>$3.5M</h4>
									</div>
									<div class="middle">
										<div class="d-flex justify-content-start">
										<p>Bed: 04</p>
										<p>Bath: 03</p>
										<p>Area: 750sqm</p>
										</div>
										<div class="d-flex justify-content-start">
										<p>Pool: <span class="gr">Yes</span></p>
										<p>Internet: <span class="rd">No</span></p>
										<p>Cleaning: <span class="rd">No</span></p>
										</div>
									</div>
									<div class="bottom d-flex justify-content-start">
										<p><span class="lnr lnr-heart"></span> 15 Likes</p>
										<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
									</div>	
								</div>	
							</div>
						</div>	
						<div class="col-lg-4">
							<div class="single-property">
								<div class="images">
									<img class="img-fluid mx-auto d-block" src="img/s3.jpg" alt="">
									<span>For Sale</span>
								</div>
								
								<div class="desc">
									<div class="top d-flex justify-content-between">
										<h4><a href="#">04 Bed Duplex</a></h4>
										<h4>$3.5M</h4>
									</div>
									<div class="middle">
										<div class="d-flex justify-content-start">
										<p>Bed: 04</p>
										<p>Bath: 03</p>
										<p>Area: 750sqm</p>
										</div>
										<div class="d-flex justify-content-start">
										<p>Pool: <span class="gr">Yes</span></p>
										<p>Internet: <span class="rd">No</span></p>
										<p>Cleaning: <span class="rd">No</span></p>
										</div>
									</div>
									<div class="bottom d-flex justify-content-start">
										<p><span class="lnr lnr-heart"></span> 15 Likes</p>
										<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
									</div>	
								</div>	
							</div>
						</div>																											
					</div>
				</div>	
			</section>
			<!-- End property Area -->	
				
			<!-- Start city Area -->
			<section class="city-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-4 mb-10">
						  <div class="content">
						    <a href="#" target="_blank">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/p1.jpg" alt="">
						      <div class="content-details fadeIn-bottom">
						        <h3 class="content-title">San Fransisco Properties</h3>
						      </div>
						    </a>
						  </div>
						</div>
						<div class="col-lg-8 col-md-8 mb-10">
							<div class="content">
							    <a href="#" target="_blank">
							      <div class="content-overlay"></div>
							  		 <img class="content-image img-fluid d-block mx-auto" src="img/p2.jpg" alt="">
							      <div class="content-details fadeIn-bottom">
							        <h3 class="content-title">New York Properties</h3>
							      </div>
							    </a>
						  	</div>
							<div class="row city-bottom">
								<div class="col-lg-6 col-md-6 mt-30">
									<div class="content">
									    <a href="#" target="_blank">
									      <div class="content-overlay"></div>
									  		 <img class="content-image img-fluid d-block mx-auto" src="img/p3.jpg" alt="">
									      <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Boston Properties</h3>
									      </div>
									    </a>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 mt-30">
									<div class="content">
									    <a href="#" target="_blank">
									      <div class="content-overlay"></div>
									  		 <img class="content-image img-fluid d-block mx-auto" src="img/p4.jpg" alt="">
									      <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Elay Properties</h3>
									      </div>
									    </a>
									</div>
								</div>								
							</div>
						</div>
					</div>
				</div>	
			</section>
			<!-- End city Area -->

			<!-- Start About Area -->
		<!--	<section class="about-area">
				<div class="container-fluid">
					<div class="row d-flex justify-content-end align-items-center">
						<div class="col-lg-6 about-left">
							<div class="single-about pb-30">
								<h4>Why Choose Us</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
								</p>
							</div>
							<div class="single-about pb-30">
								<h4>Our Properties</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
								</p>
							</div>
							<div class="single-about">
								<h4>legal notice</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
								</p>
							</div>																
						</div>			
						<div class="col-lg-6 about-right no-padding">
							<img class="img-fluid" src="img/about-img.jpg" alt="">
						</div>			
					</div>
				</div>	
			</section>-->
			<!-- End About Area -->
		
			<!-- Start contact-info Area -->
			<section class="contact-info-area section-gap">
				<div class="container">
					<div class="row">
						<div class="single-info col-lg-3 col-md-6">
							 <h4>Obiščite nas</h4>
							 <p>
							 	 Smetanova ulica 17<br>
								 2000 Maribor<br>
								 Slovenija
							 </p>                                   
						</div>
						<div class="single-info col-lg-3 col-md-6">
							 <h4>Pokličite nas</h4>
							 <p>
								Tel-pisarna: 02 88 86 668 <br>
								Tel-info: 02 22 33 333
							 </p>                                   
						</div>
						<div class="single-info col-lg-3 col-md-6">
							 <h4>Pišite nam</h4>
							 <p>
								 Email: agencija.praktikum@gmail.com<br>
								 FAX: 02-6532-568-746
							 </p>                                   
						</div>
						<div class="single-info col-lg-3 col-md-6">
							<h4>Tehnična pomoč</h4>
							<p>
								pomoc@colorlib.com <br>
								tehnicne.tezave@colorlib.com <br>
								navoljo24@gmail.com
							</p>
						</div>
					</div>
				</div>	
			</section>
			<!-- End contact-info Area -->

			<!-- Start Contact Area -->
			<section class="contact-area" id="contact">
				<div class="container-fluid">
					<div class="row align-items-center d-flex justify-content-start">
						<div class="col-lg-6 col-md-12 contact-left no-padding">

							<!-- AIzaSyAJrW-1laCws0wiUaBUkFlj3mcfRbIOaB8 -->
								<iframe width="650" height="545" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJf4rU2K93b0cRLmIL3dGAiTk&key=AIzaSyAJrW-1laCws0wiUaBUkFlj3mcfRbIOaB8" allowfullscreen></iframe>
						</div>
						<div class="col-lg-4 col-md-12 pt-100 pb-100">
							<form class="form-area" id="myForm" action="mailto:agencija.praktikum@gmail.com" method="GET" class="contact-form text-right">
								<input name="ime" placeholder="Vnesite vaše ime" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Vnesite vaše ime'" class="common-input mt-10" required="" type="text">
								<input name="email" placeholder="Vnesite vaš email naslov" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Vnesite vaš email naslov'" class="common-input mt-10" required="" type="email">
								<textarea name="body" class="common-textarea mt-10" name="sporocilo" placeholder="Sporočilo" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Sporočilo'" required=""></textarea>
								<button type="submit" class="primary-btn mt-20" >Pošlji sporočilo<span class="lnr lnr-arrow-right"></span></button>
								<div class="alert-msg">
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
			<!-- End Contact Area -->	

			<!-- start footer Area -->
			<jsp:include page="includes/footer.jsp" />
			<!-- End footer Area -->		

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