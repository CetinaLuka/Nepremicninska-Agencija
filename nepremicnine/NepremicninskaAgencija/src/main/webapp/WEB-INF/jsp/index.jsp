<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/logo/logo.png">
		<!-- Author Meta -->
		<meta name="author" content="CodePixar">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Nepremičnine</title>

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
			<script>var dolocenaPovezava = true;</script>
		</head>
		<body>

			<!-- Start Header Area -->
			<jsp:include page="includes/navigacijskiMeni.jsp" />
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
									 <div class="row">
									 	<div class="col-lg-12 d-flex align-items-center justify-content-center toggle-wrap">
											<div class="row">
												<div class="col">
													<h4 class="search-title">Iščite med nepremičninami:</h4>
												</div>
											</div>
									 	</div>
									    <div class="col-lg-12 col-md-12 col-xs-12">
											<select id="tip_nepr" name="select_tip_nepremicnina" onchange="menjavaIskanja()" class="app-select form-control" required>
												<option data-display="Tip nepremičnine">Tip nepremičnine</option>
												<option value="1">Stanovanje</option>
												<option value="2">Hiša</option>
												<option value="3">Posest</option>
											</select>
											<br />
											<br />
											<br />
									    </div>
										 <div id="iskanjeStanovanje" style="display:none;" class="col-lg-12">
											 <form class="search-form" method="get" action="/iskanjeStanovanje">
												 <div class="row">
													 <div class="col-lg-4 col-md-6 col-xs-6" style="padding-top: 10px;">
														 <select name="select_pokrajina" class="app-select form-control" required>

															 <option value="1">Notranjska</option>
															 <option value="2">Primorska</option>
															 <option value="3">Štajerska</option>
															 <option value="4">Gorenjska</option>
															 <option value="5">Dolenjska</option>
															 <option value="6">Koroška</option>
															 <option value="7">Prekmurska</option>
														 </select>
													 </div>
													 <div class="col-lg-4 col-md-6 col-xs-6">
														 <div class="mt-10">
															 <input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" class="single-input" />
														 </div>
													 </div>
													 <div class="col-lg-4 col-md-6 col-xs-6">
														 <div class="mt-10">
															 <input type="text" name="letnik_prenove" placeholder="Letnik prenove" class="single-input" />
														 </div>
													 </div>
														 <div class="col-lg-4 col-md-6 col-xs-6">
															 <div class="mt-10">
																 <input type="text" name="stevilo_sob" placeholder="Število sob" class="single-input" />
															 </div>
														 </div>
													 <div class="col-lg-4 col-md-6 col-xs-6">
														 <div class="switch-wrap d-flex mt-1" style="padding-top: 15px;">
															 <div class="primary-checkbox mr-10 mt-1">
																 <input type="checkbox" name="garaza" id="garaza_hisa2" value="1"/>
																 <label for="garaza_hisa2"></label>
															 </div>
															 <p>Garaža</p>
														 </div>
													 </div>
														 <div class="col-lg-4 col-md-6 col-xs-6">
															 <div class="switch-wrap d-flex mt-1" style="padding-top: 15px;">
																 <div class="primary-checkbox mr-10 mt-1">
																	 <input type="checkbox" name="balkon" id="balkon_stanovanje" value="1"/>
																	 <label for="balkon_stanovanje"></label>
																 </div>
																 <p>Balkon</p>
															 </div>
														 </div>
													 <div class="col-lg-4 range-wrap">
														 <p>Cena:</p>
														 <input type="text" id="range" value="" name="range1" />
													 </div>
													 <div class="col-lg-4 range-wrap">
														 <p>Velikost stanovanja(m²):</p>
														 <input type="text" id="range2" value="" name="range2" />
													 </div>
													 <div class="col-lg-12 d-flex justify-content-end">
														 <button class="primary-btn mt-50" style="height: 45px;">Išči nepremičnine<span class="lnr lnr-arrow-right"></span></button>
													 </div>
												 </div>
											 </form>
										 </div>
										 <div id="iskanjeHisa" style="display:none;" class="col-lg-12">
											 <form class="search-form" method="get" action="/iskanjeHisa">
												 <div class="row">
													<div class="col-lg-4 col-md-6 col-xs-6" style="padding-top: 10px;">
														<select name="select_pokrajina" class="app-select form-control" required>
															<option value="1">Notranjska</option>
															<option value="2">Primorska</option>
															<option value="3">Štajerska</option>
															<option value="4">Gorenjska</option>
															<option value="5">Dolenjska</option>
															<option value="6">Koroška</option>
															<option value="7">Prekmurska</option>
														</select>
													</div>
													<div class="col-lg-4 col-md-6 col-xs-6" style="padding-top: 10px;">
														<select name="select_tip_hisa" class="app-select form-control" required>
															<option value="Samostojna">Samostojna</option>
															<option value="Dvojček">Dvojček</option>
															<option value="Vrstna">Vrstna</option>
														</select>
													</div>
													 <div class="col-lg-4 col-md-6 col-xs-6">
														 <div class="mt-10">
															 <input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" class="single-input" />
														 </div>
													 </div>
													 <div class="col-lg-4 col-md-6 col-xs-6">
														 <div class="mt-10">
															 <input type="text" name="letnik_prenove" placeholder="Letnik prenove" class="single-input" />
														 </div>
													 </div>
													 <div class="col-lg-8 col-md-6 col-xs-6">
														 <div class="switch-wrap d-flex mt-1" style="padding-top: 15px;">
															 <div class="primary-checkbox mr-10 mt-1">
																 <input type="checkbox" name="garaza" id="garaza_hisa" value="1"/>
																 <label for="garaza_hisa"></label>
															 </div>
															 <p>Garaža</p>
														 </div>
													 </div>

													<div class="col-lg-4 range-wrap">
														<p>Cena:</p>
														<input type="text" id="range3" value="" name="range3" />
													</div>
													<div class="col-lg-4 range-wrap">
														<p>Skupna velikost(m²):</p>
														<input type="text" id="range4" value="" name="range4" />
													</div>
													 <div class="col-lg-4 range-wrap">
														 <p>Velikost bivalnega prostora(m²):</p>
														 <input type="text" id="range5" value="" name="range5" />
													 </div>
													 <div class="col-lg-12 d-flex justify-content-end">
														<button class="primary-btn mt-50" style="height: 45px;">Išči nepremičnine<span class="lnr lnr-arrow-right"></span></button>
													</div>
												 </div>
											 </form>
										 </div>

										 <div id="iskanjePosest" style="display:none;" class="col-lg-12">
											 <form class="search-form" method="get" action="/iskanjePosest">
												 <div class="row">
													 <div class="col-lg-4 col-md-6 col-xs-6" style="padding-top: 10px;">
														 <select name="select_pokrajina" class="app-select form-control" required>
															 <option value="1">Notranjska</option>
															 <option value="2">Primorska</option>
															 <option value="3">Štajerska</option>
															 <option value="4">Gorenjska</option>
															 <option value="5">Dolenjska</option>
															 <option value="6">Koroška</option>
															 <option value="7">Prekmurska</option>
														 </select>
													 </div>
														 <div class="col-lg-4 col-md-6 col-xs-6" style="padding-top: 10px;">
															 <select name="select_tip_posesti" class="app-select form-control" required>
																 <option value="Zazidljiva">Zazidljiva</option>
																 <option value="Nezazidljiva">Nezazidljiva</option>
																 <option value="Kmetijsko zemljišče">Kmetijsko zemljišče</option>
															 </select>
														 </div>
													 <div class="col-lg-4">
													 </div>
													 <div class="col-lg-4 range-wrap">
														 <p>Cena:</p>
														 <input type="text" id="range6" value="" name="range6" />
													 </div>
													 <div class="col-lg-4 range-wrap">
														 <p>Velikost(m²):</p>
														 <input type="text" id="range7" value="" name="range7" />
													 </div>
													 <div class="col-lg-12 d-flex justify-content-end">
														 <button class="primary-btn mt-50" style="height: 45px;">Išči nepremičnine<span class="lnr lnr-arrow-right"></span></button>
													 </div>
												 </div>
											 </form>
										 </div>
									  </div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- End banner Area -->

			<div class="col-lg-12 text-center">
				<button class="primary-btn mt-50 text-center " style="padding-right: 30px" data-toggle="modal" data-target="#zemljevid" style="height: 45px;">ZEMLJEVID NEPREMIČNIN</button>
			</div>
			<div class="modal fade" id="zemljevid" tabindex="-1" role="dialog" aria-labelledby="zemljevid" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document"  style="max-width: 100%; margin: 100px;">
					<div class="modal-content" style="widht:100%">
						<div class="modal-header">
							<h5 class="modal-title" id="zemljevid-naslov">LOKACIJE NEPREMIČNIN</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="height: 400px;">
							<div id="zemljevidNepremicnin" style="height: 100%;"></div>
						</div>
					</div></div></div>

			<!-- Start service Area -->
			<section class="service-area section-gap" id="service" style="padding-top: 60px; padding-bottom: 60px;">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="col-md-8 pb-40 header-text">
							<h1>Zakaj izbrati nas?</h1>
							<p>
								Ob nakupu nepremičnine igra veliko vlogo dobra izbira nepremičninske agencije. Pri nas se lahko pohvalimo z mnogimi vrlinami.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-6 pb-30">
							<div class="single-service">
								<h4><span class="lnr lnr-user"></span>Izkušenost agentov</h4>
								<p>
									Vsi naši nepremičninski agenti se na svoje delo spoznajo, so zanj izučeni in vam vedno pripravljeni pomagati.
								</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 pb-30">
							<div class="single-service">
								<h4><span class="lnr lnr-license"></span>Profesionalne storitve</h4>
								<p>
									Zagotavljamo profesionalen odnos vseh naših zaposlenih ob koriščenju naših storitev.
								</p>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6 pb-30">
							<div class="single-service">
								<h4><span class="lnr lnr-phone"></span>Podpora in pomoč</h4>
								<p>
									Za kakršnakoli vprašanja smo v delovnem času dostopni preko elektronske pošte in preko telefona.
								</p>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-service">
								<h4><span class="lnr lnr-rocket"></span>Tehnična znanja</h4>
								<p>
									Vsi zaposleni se spoznajo na svojo stroko in vam lahko zagotovijo točne in uporabne informacije.
								</p>				
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-service">
								<h4><span class="lnr lnr-diamond"></span>Dolgoletna tradicija</h4>
								<p>
									Podjetje se lahko pohvali z uspešnim delovanjem že od same ustanovitve leta 1998.
								</p>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-service">
								<h4><span class="lnr lnr-bubble"></span>Zadovoljne stranke</h4>
								<p>
									Za vsako stranko posebej poskrbimo kot se le najboljše da. To pričajo tudi njihova mnoga pozitivna mnenja.
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
							<h1>Zadnje nepremičnine</h1>
							<p>
								Oglejte si nabor nedavno dodanih nepremičnin.
							</p>
						</div>
					</div>
					<div class="row">
						<c:forEach  items="${seznamNepremicnin}" var ="nepremicnina">
						<!--stanovanje-->
							<c:if test="${nepremicnina.tk_id_vrstaNepremicnine==1}">
								<div class="col-xs-12 col-md-6 col-lg-4">
									<div class="single-property mb-3 stanovanje" style="height:500px;">
										<div class="images">
											<a href="prikazNepremicnine/${nepremicnina.idNepremicnina}" target="_blank">
												<c:set var="niNajdenaSlika" scope="request" value="true"/>
												<c:forEach  items="${seznamSlik}" var ="slika">
													<c:if test="${nepremicnina.idNepremicnina==slika.getNepremicnina_idNepremicnina()}">
														<img class="img-fluid mx-auto d-block" src="data:image/jpeg;base64,${slika.URLSlike}" alt="" style="height:180px;">
														<c:set var="niNajdenaSlika" scope="request" value="false"/>
													</c:if>
												</c:forEach>
												<c:if test="${niNajdenaSlika}">
													<img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="" style="height:180px;">
												</c:if>
												<!--img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt=""-->
												<span class="cena">${nepremicnina.cena}€</span>
											</a>
										</div>
										<div class="desc">
											<div class="top d-flex justify-content-between">
												<h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Stanovanje</a></h4>
												<h4>${nepremicnina.skupnaKvadratura}m²</h4>
											</div>
											<div class="naslov">
												<div class="d-flex justify-content-start">
													<p>Kraj: <span>${nepremicnina.imeKraja}</span></p>
												</div>
												<div class="d-flex justify-content-start">
													<p>Naslov: <span>${nepremicnina.ulica} ${nepremicnina.hisnaSt}</span></p>
												</div>
											</div>
											<div class="middle">
												<div class="d-flex justify-content-start">
													<p>Nadstropje: <span>${nepremicnina.nadstropje}.</span></p>
													<p>Št. sob: <span>${nepremicnina.steviloSob}</span></p>
												</div>
												<div class="d-flex justify-content-start">
													<p>Garaža:
														<c:choose>
															<c:when test="${nepremicnina.garaza}">
																<span class="gr">Da</span>
															</c:when>
															<c:otherwise>
																<span class="rd">Ne</span>
															</c:otherwise>
														</c:choose>
													</p>
													<p>Balkon:
														<c:choose>
															<c:when test="${nepremicnina.balkon}">
																<span class="gr">Da</span>
															</c:when>
															<c:otherwise>
																<span class="rd">Ne</span>
															</c:otherwise>
														</c:choose>
													</p>
												</div>
												<div class="d-flex justify-content-start" style="margin-bottom: 6px">
													<p>Zgrajeno: <span>${nepremicnina.letoIzgradnje}</span></p>
													<p>Prenova:
														<c:choose>
															<c:when test="${nepremicnina.letoPrenove>0}">
																<span class="gr">${nepremicnina.letoPrenove}</span>
															</c:when>
															<c:otherwise>
																<span class="rd">/</span>
															</c:otherwise>
														</c:choose>
													</p>
												</div>
												<div class="dodano">Dodano: <span>${nepremicnina.datumObjave}</span></div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!--hisa-->
							<c:if test="${nepremicnina.tk_id_vrstaNepremicnine==2}">
								<div class="col-xs-12 col-md-6 col-lg-4">
									<div class="single-property mb-3 hisa" style="height:500px;">
										<div class="images">
											<a href="prikazNepremicnine/${nepremicnina.idNepremicnina}" target="_blank">
												<c:set var="niNajdenaSlika" scope="request" value="true"/>
												<c:forEach  items="${seznamSlik}" var ="slika">
													<c:if test="${nepremicnina.idNepremicnina==slika.getNepremicnina_idNepremicnina()}">
														<img class="img-fluid mx-auto d-block" src="data:image/jpeg;base64,${slika.URLSlike}" alt="" style="height:180px;">
														<c:set var="niNajdenaSlika" scope="request" value="false"/>
													</c:if>
												</c:forEach>
												<c:if test="${niNajdenaSlika}">
													<img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="" style="height:180px;">
												</c:if>
												<!--img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt=""-->
												<span class="cena">${nepremicnina.cena}€</span>
											</a>
										</div>
										<div class="desc">
											<div class="top d-flex justify-content-between">
												<h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Hiša - ${nepremicnina.vrstaHise}</a></h4>
												<h4>${nepremicnina.kvadraturaBivalnegaProstora}m²</h4>
											</div>
											<div class="naslov">
												<div class="d-flex justify-content-start podatek">
													<p>Kraj: <span>${nepremicnina.imeKraja}</span></p>
												</div>
												<div class="d-flex justify-content-start podatek">
													<p>Naslov: <span>${nepremicnina.ulica} ${nepremicnina.hisnaSt}</span></p>
												</div>
											</div>
											<div class="middle">
												<div class="d-flex justify-content-start podatek">
													<p>Zemljišče: <span>${nepremicnina.skupnaKvadratura}m²</span></p>
													<p>Zgrajeno: <span>${nepremicnina.letoIzgradnje}</span></p>
												</div>
												<div class="d-flex justify-content-start podatek">
													<p>Garaža:
														<c:choose>
															<c:when test="${nepremicnina.garaza}">
																<span class="gr">Da</span>
															</c:when>
															<c:otherwise>
																<span class="rd">Ne</span>
															</c:otherwise>
														</c:choose>
													</p>
													<p>Prenova:  <c:choose>
														<c:when test="${nepremicnina.letoPrenove>0}">
															<span class="gr">${nepremicnina.letoPrenove}</span>
														</c:when>
														<c:otherwise>
															<span class="rd">/</span>
														</c:otherwise>
													</c:choose></p>
												</div>
											</div>
											<div class="justify-content mb-2">
												<p class="opis">
													<c:if test="${!nepremicnina.opis.equals('')}">${nepremicnina.opis}</c:if>
													<c:if test="${nepremicnina.opis.equals('')}"> / </c:if>
												</p>
											</div>
											<div class="dodano">Dodano: <span>${nepremicnina.datumObjave}</span></div>
										</div>
									</div>
								</div>
							</c:if>
							<!--posest-->
							<c:if test="${nepremicnina.tk_id_vrstaNepremicnine==3}">
								<div class="col-xs-12 col-md-6 col-lg-4">
									<div class="single-property mb-3 posest" style="height:500px;">
										<div class="images">
											<a href="prikazNepremicnine/${nepremicnina.idNepremicnina}" target="_blank">
												<c:set var="niNajdenaSlika" scope="request" value="true"/>
												<c:forEach  items="${seznamSlik}" var ="slika">
													<c:if test="${nepremicnina.idNepremicnina==slika.getNepremicnina_idNepremicnina()}">
														<img class="img-fluid mx-auto d-block" src="data:image/jpeg;base64,${slika.URLSlike}" alt="" style="height:180px;">
														<c:set var="niNajdenaSlika" scope="request" value="false"/>
													</c:if>
												</c:forEach>
												<c:if test="${niNajdenaSlika}">
													<img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="" style="height:180px;">
												</c:if>
												<!--img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt=""-->
												<span class="cena">${nepremicnina.cena}€</span>
											</a>
										</div>
										<div class="desc">
											<div class="top d-flex justify-content-between">
												<h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Posest - ${nepremicnina.tipPosesti}</a></h4>
												<h4>${nepremicnina.skupnaKvadratura}m²</h4>
											</div>
											<div class="naslov">
												<div class="d-flex justify-content-start">
													<p>Kraj: <span>${nepremicnina.imeKraja}</span></p>
												</div>
												<div class="d-flex justify-content-start">
													<p>Naslov: <span>${nepremicnina.ulica} ${nepremicnina.hisnaSt}</span></p>
												</div>
											</div>
											<div class="middle">
												<div class="justify-content mb-2">
													Opis:<br />
													<p class="opis"
															<c:if test="${nepremicnina.tipPosesti.equals('Kmetijsko zemljišče')}">
																style=" height: 54px; -webkit-line-clamp: 2;"
															</c:if>
													   data-toggle="tooltip" data-placement="top" title="${nepremicnina.opis}"
													>
														<c:if test="${!nepremicnina.opis.equals('')}">${nepremicnina.opis}</c:if>
														<c:if test="${nepremicnina.opis.equals('')}"> / </c:if>
													</p>
												</div>
											</div>
											<div class="dodano">Dodano: <span>${nepremicnina.datumObjave}</span></div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>	
			</section>
			<!-- End property Area -->
			<!-- Start city Area -->
			<section class="city-area section-gap" style="padding-top: 60px; padding-bottom: 0px;">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-12 col-md-8 pb-40 header-text text-center">
							<h1>Iskanje nepremičnin po regijah</h1>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-4 mb-10">
						  <div class="content">
						    <a href="iskanjeNepremicninPoRegiji?regija=1" target="_blank">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/Regija1.jpg" alt="">
						      <div class="content-details fadeIn-bottom">
						        <h3 class="content-title">Ljubljana z okolico</h3>
						      </div>
						    </a>
						  </div>
						</div>
						<div class="col-lg-8 col-md-8 mb-10">
							<div class="content">
							    <a href="iskanjeNepremicninPoRegiji?regija=2" target="_blank">
							      <div class="content-overlay"></div>
							  		 <img class="content-image img-fluid d-block mx-auto" src="img/Regija2.jpg" alt="">
							      <div class="content-details fadeIn-bottom">
							        <h3 class="content-title">Slovenska obala</h3>
							      </div>
							    </a>
						  	</div>
							<div class="row city-bottom">
								<div class="col-lg-6 col-md-6 mt-30">
									<div class="content">
									    <a href="iskanjeNepremicninPoRegiji?regija=3" target="_blank">
									      <div class="content-overlay"></div>
									  		 <img class="content-image img-fluid d-block mx-auto" src="img/Regija3.jpg" alt="">
									      <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Štajerska regija</h3>
									      </div>
									    </a>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 mt-30">
									<div class="content">
									    <a href="iskanjeNepremicninPoRegiji?regija=4" target="_blank">
									      <div class="content-overlay"></div>
									  		 <img class="content-image img-fluid d-block mx-auto" src="img/Regija4.jpg" alt="">
									      <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Gorenjska regija</h3>
									      </div>
									    </a>
									</div>
								</div>								
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-4 mt-30">
							<div class="content">
								<a href="iskanjeNepremicninPoRegiji?regija=5" target="_blank">
									<div class="content-overlay"></div>
									<img class="content-image img-fluid d-block mx-auto" src="img/Regija5.jpg" alt="">
									<div class="content-details fadeIn-bottom">
										<h3 class="content-title">Dolenjska regija</h3>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 mt-30">
							<div class="content">
								<a href="iskanjeNepremicninPoRegiji?regija=6" target="_blank">
									<div class="content-overlay"></div>
									<img class="content-image img-fluid d-block mx-auto" src="img/Regija6.jpg" alt="">
									<div class="content-details fadeIn-bottom">
										<h3 class="content-title">Koroška regija</h3>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 mt-30">
							<div class="content">
								<a href="iskanjeNepremicninPoRegiji?regija=7" target="_blank">
									<div class="content-overlay"></div>
									<img class="content-image img-fluid d-block mx-auto" src="img/Regija7.jpg" alt="">
									<div class="content-details fadeIn-bottom">
										<h3 class="content-title">Prekmurska regija</h3>
									</div>
								</a>
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
			<section class="contact-info-area section-gap relative"  id="contact" style="padding-bottom: 40px;">
				<div class="overlay ozadje-contact" style="margin-bottom:0px;"></div>
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
								 Email: praktikum1@gmail.com<br>
								 FAX: 02-6532-568-746
							 </p>                                   
						</div>
						<div class="single-info col-lg-3 col-md-6">
							<h4>Tehnična pomoč</h4>
							<p>
								pomoc@colorlib.com <br>
								tehnicne.tezave@help.com <br>
								navoljo24@gmail.com
							</p>
						</div>
					</div>
				</div>	
			</section>
			<!-- End contact-info Area -->

			<!-- Start Contact Area -->
			<section class="contact-area">
				<div class="container-fluid">
					<div class="row align-items-center d-flex justify-content-start">
						<div class="col-lg-12 col-md-12 no-padding">

							<!-- AIzaSyAJrW-1laCws0wiUaBUkFlj3mcfRbIOaB8 -->
								<iframe width="100%" height="400" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJf4rU2K93b0cRLmIL3dGAiTk&key=AIzaSyAJrW-1laCws0wiUaBUkFlj3mcfRbIOaB8" allowfullscreen></iframe>
						</div>
						<div class="col-lg-3"></div>
						<div class="col-lg-6 col-md-12 pt-50 pb-50">
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
		<script>
            var map, map1;
            var bounds;
            var marker;
            function initMap() {
                var latlng = new google.maps.LatLng(46.1219704, 14.3290785);
                map = new google.maps.Map(document.getElementById('zemljevidNepremicnin'), {
                    center: latlng,
                    zoom: 9
                });
                bounds = new google.maps.LatLngBounds();
            }

            var testArray=[];
            var vrsta=[];
            var contentString =[];
			var niz;
			var niz2;
			var v;
            <c:forEach  items="${podatki}" var ="p">
				niz="${p.ulica} ${p.hisnaSt}, ${p.imeKraja}";
				testArray.push(niz);
				vrsta.push(${p.tk_id_vrstaNepremicnine});
				<c:if test="${p.tk_id_vrstaNepremicnine==1}"> v='stanovanje' </c:if>
                <c:if test="${p.tk_id_vrstaNepremicnine==2}"> v='hiša' </c:if>
                <c:if test="${p.tk_id_vrstaNepremicnine==3}"> v='posest' </c:if>
				niz2='<div id="content">'+
                    '<h5 id="firstHeading">'+ v +'</h5>'+
                    '<div id="bodyContent"> ${p.imeKraja},  ${p.cena}€ </div><hr/>'+
                    '<div><a href="prikazNepremicnine/${p.idNepremicnina}" target="_blank">poglej</a></div></div>';
				contentString.push(niz2);
            </c:forEach>

            function addMarkers(addressArray, geocoder, counter, ikone){
                if(counter === addressArray.length){
                    return;
				}
                geocoder.geocode({
                    'address': addressArray[counter]
                }, function (results, status) {
                    if(status === google.maps.GeocoderStatus.OK) {
                        marker = new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location,
                            icon: ikone[vrsta[counter]]
                        });
                        marker.addListener('click', function () {
                            infowindow.open(map, this);
                        });
                        var infowindow = new google.maps.InfoWindow({
                            content: contentString[counter],
                            maxWidth: 200
                        });
                        bounds.extend(marker.position);
                    }
                    else{
                        if(status === google.maps.GeocoderStatus.OVER_QUERY_LIMIT){
                            console.log("Geocoder query overlimit... Retrying...");
                        }
                        counter--;
                    }
                    setTimeout(function(){
                        addMarkers(addressArray, geocoder, counter+1, ikone);
                    }, 200);
                });
            }

            function codeAddress(addressArray) {
                geocoder = new google.maps.Geocoder();

                var ikone = {
                 1: {
                     url: "img/ikona-blok.png",
                    scaledSize: new google.maps.Size(25, 25),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(0, 0)
                },
                    2: {
                        url: "img/ikona-hisa.png",
                        scaledSize: new google.maps.Size(20, 20),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(0, 0)
                    },
                    3: {
                        url: "img/posest.png",
                        scaledSize: new google.maps.Size(25, 25),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(0, 0)
                    }
            	};

				addMarkers(addressArray, geocoder, 0, ikone);
            }

            $(document).ready(function(){
                initMap();
                codeAddress(testArray);
				$('#zemljevid').on('shown.bs.modal', function(){
                    map.fitBounds(bounds);
				});
            });

           /* var contentString = '<div id="content">'+
                '<div id="siteNotice">'+
                '</div>'+
                '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
                '<div id="bodyContent">'+
                '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
                'sandstone rock formation in the southern part of the '+
                'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
                'Aboriginal people of the area. It has many springs, waterholes, '+
                'rock caves and ancient paintings. Uluru is listed as a World '+
                'Heritage Site.</p>'+
                '</div>'+
                '</div>';*/



        </script>
		</body>
	</html>