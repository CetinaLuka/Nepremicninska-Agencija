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
		<style>

			.slikaZaFotografije img {
				width: 60px !important ;
				height: 60px !important ;
				order: 1;
			}

		</style>
		</head>
		<body>
			<button onclick="topFunction()" class="scroll-to-top genric-btn primary-border circle" id="top-gumb" title="Pojdi na vrh">Pojdi na vrh</button>
			<!-- Start Header Area -->
				<jsp:include page="includes/navigacijskiMeni.jsp" />
			<!-- End Header Area -->
			<section class="generic-banner relative">
				<div class="container pt-30 pb-20">
					<div class="row align-items-center justify-content-center">
						<div class="col-lg-10">
							<div class="generic-banner-content text-center">
								<h2 class="text-white">Dodajanje nepremičnin</h2>
								<p class="text-white">Dodajte hišo, stanovanje ali posest v našo bazo nepremičnin.</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--</section>-->
			<br />
			<!--gumbi za dodajanje nepremicnin-->
			<div class="container">
				<div class="row scroll-gumbi">
					<div class="col-4 text-center">
						<a href="#dodaj_stanovanje_section">
							<button class="genric-btn primary circle">
								Stanovanje
							</button>
						</a>
					</div>
					<div class="col-4 text-center">
						<a href="#dodaj_hiso_section">
							<button class="genric-btn primary circle">
								Hiša
							</button>
						</a>
					</div>
					<div class="col-4 text-center">
						<a href="#dodaj_posest_section">
							<button class="genric-btn primary circle">
								Posest
							</button>
						</a>
					</div>
				</div>
			</div>
			<br />
			<section class="section-gap" id="dodaj_stanovanje_section">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h2>Dodaj stanovanje</h2>
						</div>
					</div>
					<form name="dodaj_stanovanje_form" method="POST">
						<div class="row">
							<div class="col-12 col-md-9">

								<!--Polje za vnos naslova(ulice) - name:naslov-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
									<input type="text" name="naslov" placeholder="Naslov" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Naslov'" required class="single-input">
								</div>
							</div>
							<div class="col-12 col-md-3">
								<!--Polje za vnos hišne številke - name:hisna_st-->
								<div class="mt-10">
									<input type="text" name="hisna_st" placeholder="Hišna številka" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Hišna številka'" required class="single-input">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-md-9">
								<!--Polje za vnos kraja - name:kraj-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
									<input type="text" name="kraj" placeholder="Kraj" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kraj'" required class="single-input">
								</div>
							</div>
							<div class="col-12 col-md-3">
								<!--Polje za vnos poštne številke - name:postna_st-->
								<div class="mt-10">
									<input type="text" name="postna_st" placeholder="Poštna številka" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Poštna številka'" required class="single-input">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-6 col-md-3 col-xl-3">
								<!--Polje za vnos kvadrature - name:kvadratura-->
								<div class="mt-10">
									<input type="text" name="kvadratura" placeholder="Kvadratura (m²)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kvadratura (m²)'" required class="single-input" />
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-3 col-xl-3">
								<!--Polje za vnos števila sob - name:stevilo_sob-->
								<div class="mt-10">
									<input type="text" name="stevilo_sob" placeholder="Število sob" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Število sob'" required class="single-input" />
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-3 col-xl-3">
								<!--Polje za vnos letnika izgradnje - name:letnik_izgradnje-->
								<div class="mt-10">
									<input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Letnik izgradnje'" required class="single-input" />
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-3 col-xl-3">
								<!--Polje za vnos nadstropja - name:nadstropje-->
								<div class="mt-10">
									<input type="text" name="nadstropje" placeholder="Nadstropje" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nadstropje'" required class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<!--Polje za vnos cene - name:cena-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-money" aria-hidden="true"></i></div>
									<input type="text" name="cena" placeholder="Cena" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Cena'" required class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-3">
								<!--Checkbox za prenovljenost - name:prenovljeno-->
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="prenovljeno" id="prenovljeno" data-toggle="collapse" data-target="#letnik_prenove_skrij">
										<label for="prenovljeno"></label>
									</div>
									<p>Prenovljeno</p>
								</div>
								<!--Polje za vnos letnika prenove - name:letnik_prenove-->
								<div class="collapse" id="letnik_prenove_skrij" >
									<input type="text" name="letnik_prenove" placeholder="Letnik prenove" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Letnik prenove'" class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<!--Checkbox za garažo - name:garaza-->
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10">
										<input type="checkbox" name="garaza" id="garaza">
										<label for="garaza"></label>
									</div>
									<p>Garaža</p>
								</div>
								<!--Checkbox za balkon - name:balkon-->
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="balkon" id="balkon">
										<label for="balkon"></label>
									</div>
									<p>Balkon</p>
								</div>
								<!--Switch za dodaten opis - name:dodaten_opis_stanovanja_check-->
								<div class="switch-wrap d-flex">
									<div class="primary-switch mr-10">
										<input type="checkbox" name="dodaten_opis_stanovanja_check" id="dodaten_opis_stanovanja_check" data-toggle="collapse" data-target="#dodaten_opis_stanovanja_skrij">
										<label for="dodaten_opis_stanovanja_check"></label>
									</div>
									<p>Dodaten opis</p>
								</div>
								<!--Polje za vnos dodatnega opisa - name:dodaten_opis_stanovanja-->
								<div class="mt-10 mb-10 collapse" id="dodaten_opis_stanovanja_skrij">
									<textarea name="dodaten_opis_stanovanja" class="single-textarea" placeholder="Dodaten opis" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Dodaten opis'"></textarea>
								</div>
							</div>
						</div>
						<!--Dodajanje fotografije !!!-->
						<div class="row slikaZaFotografije ">
							<div class="col-12 slikaZaFotografije">
								<label class="genric-btn default mb-10" for="image_uploads">Izberite fotografijo</label>
								<input class="text-hide" type="file" id="image_uploads"  name="image_uploads" accept=".jpg, .jpeg, .png" multiple>
								<div id="predogled" class="col-12 slikaZaFotografije ">
								</div>
							</div>
						</div>

						<!--Skripta za dodajanje fotografij, kasneje bom prestavil v main.js-->
						<script>
                            var fileTypes = [
                                'image/jpeg',
                                'image/pjpeg',
                                'image/png'
                            ]
                            var input = document.querySelector('#image_uploads');
                            var preview = document.querySelector('#predogled');
                            input.style.visibility = 'hidden';
                            input.addEventListener('change', posodobiPregledSlik);

                            function  posodobiPregledSlik() {
                                var curFiles = input.files;
                                if(curFiles.length !== 0) {
                                    var list = document.createElement('ol');
                                    preview.appendChild(list);
                                    for(var i = 0; i < curFiles.length; i++) {
                                        var listItem = document.createElement('li');
                                        var para = document.createElement('p');
                                        if(validFileType(curFiles[i])) {
                                            para.textContent = 'File name ' + curFiles[i].name;
                                            var image = document.createElement('img');
                                            image.src = window.URL.createObjectURL(curFiles[i]);
                                            listItem.appendChild(image);
                                            listItem.appendChild(para);
                                        }
                                        list.appendChild(listItem);
                                    }
                                }
                            }


                            function validFileType(file) {
                                for(var i = 0; i < fileTypes.length; i++) {
                                    if(file.type === fileTypes[i]) {
                                        return true;
                                    }
                                }
                                return false;
                            }

						</script>







						<div class="row">
							<div class="col-12">
								<div class="text-center mt-10">
									<input type="submit" value="Dodaj stanovanje" class="genric-btn primary-border circle mb-50">
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>

			<section class="section-gap" id="dodaj_hiso_section">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h2>Dodaj hišo</h2>
						</div>
					</div>
					<form name="dodaj_hiso_form">
						<div class="row">
							<div class="col-12 col-md-8">
								<!--Polje za vnos naslova(ulice) - name:naslov-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
									<input type="text" name="naslov" placeholder="Naslov" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Naslov'" required class="single-input">
								</div>
							</div>
							<div class="col-12 col-md-4">
								<!--Polje za vnos hišne številke - name:hisna_st-->
								<div class="mt-10">
									<input type="text" name="hisna_st" placeholder="Hišna številka" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Hišna številka'" required class="single-input">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-md-8">
								<!--Polje za vnos kraja - name:kraj-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
									<input type="text" name="kraj" placeholder="Kraj" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kraj'" required class="single-input">
								</div>
							</div>
							<div class="col-12 col-md-4">
								<!--Polje za vnos poštne številke - name:postna_st-->
								<div class="mt-10">
									<input type="text" name="postna_st" placeholder="Poštna številka" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Poštna številka'" required class="single-input">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-4">
								<!--Polje za vnos kvadrature - name:kvadratura-->
								<div class="mt-10">
									<input type="text" name="kvadratura" placeholder="Kvadratura (m²)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kvadratura (m²)'" required class="single-input" />
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<!--Polje za vnos velikosti zemljišča - name:velikost_zemljisca-->
								<div class="mt-10">
									<input type="text" name="velikost_zemljisca" placeholder="Velikost zemljišča (m²)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Velikost zemljišča (m²)'" required class="single-input" />
								</div>
							</div>

							<div class="col-xs-12 col-md-4">
								<!--Polje za vnos letnika izgradnje - name:letnik_izgradnje-->
								<div class="mt-10">
									<input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Letnik izgradnje'" required class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-4">
								<!--Polje za vnos cene - name:cena-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-money" aria-hidden="true"></i></div>
									<input type="text" name="cena" placeholder="Cena" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Cena'" required class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<!--Select za vnos vrste hiše - name:vrsta_hise-->
								<label class="mt-1">Vrsta hiše</label>
								<div class="default-select" id="vrsta_hise">
									<select name="vrsta_hise">
										<option value="1">Samostojna</option>
										<option value="2">Dvojček</option>
										<option value="3">Vrstna</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-3">
								<!--Checkbox za prenovljenost - name:prenovljeno-->
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="prenovljeno" id="prenovljeno_hisa" data-toggle="collapse" data-target="#letnik_prenove_hisa_skrij">
										<label for="prenovljeno_hisa"></label>
									</div>
									<p>Prenovljeno</p>
								</div>
								<!--Polje za vnos letnika prenove - name:letnik_prenove-->
								<div class="collapse" id="letnik_prenove_hisa_skrij" >
									<input type="text" name="letnik_prenove" placeholder="Letnik prenove" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Letnik prenove'" class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<!--Checkbox za garažo - name:garaza-->
								<div class="switch-wrap d-flex mt-1">
									<div class="primary-checkbox mr-10 mt-1">
										<input type="checkbox" name="garaza" id="garaza_hisa">
										<label for="garaza_hisa"></label>
									</div>
									<p>Garaža</p>
								</div>
								<!--Switch za dodaten opis - name:dodaten_opis_stanovanja_check-->
								<div class="switch-wrap d-flex">
									<div class="primary-switch mr-10">
										<input type="checkbox" name="dodaten_opis_hise_check" id="dodaten_opis_hise_check" data-toggle="collapse" data-target="#dodaten_opis_hise_skrij">
										<label for="dodaten_opis_hise_check"></label>
									</div>
									<p>Dodaten opis</p>
								</div>
								<!--Polje za vnos dodatnega opisa - name:dodaten_opis_hise-->
								<div class="mt-10 mb-10 collapse" id="dodaten_opis_hise_skrij">
									<textarea name="dodaten_opis_hise" class="single-textarea" placeholder="Dodaten opis" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Dodaten opis'"></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<button type=button class="genric-btn default mb-10">
									Dodaj slike
								</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="text-center mt-10">
									<input type="submit" value="Dodaj hišo" class="genric-btn primary-border circle mb-50">
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
			<section class="section-gap" id="dodaj_posest_section">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h2>Dodaj posest</h2>
						</div>
					</div>
					<form>
						<div class="row">
							<div class="col-12 col-md-8">
								<!--Polje za vnos naslova(ulice) - name:naslov-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
									<input type="text" name="naslov" placeholder="Naslov" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Naslov'" required class="single-input">
								</div>
							</div>
							<div class="col-12 col-md-4">
								<!--Polje za vnos hišne številke - name:hisna_st-->
								<div class="mt-10">
									<input type="text" name="hisna_st" placeholder="Hišna številka" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Hišna številka'" required class="single-input">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-md-8">
								<!--Polje za vnos kraja - name:kraj-->
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
									<input type="text" name="kraj" placeholder="Kraj" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Kraj'" required class="single-input">
								</div>
							</div>
							<div class="col-12 col-md-4">
								<!--Polje za vnos poštne številke - name:postna_st-->
								<div class="mt-10">
									<input type="text" name="postna_st" placeholder="Poštna številka" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Poštna številka'" required class="single-input">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-4">
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-money" aria-hidden="true"></i></div>
									<input type="text" name="cena" placeholder="Cena" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Cena'" required class="single-input" />
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<div class="mt-10">
									<input type="text" name="velikost_zemljisca" placeholder="Velikost zemljišča (m²)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Velikost zemljišča (m²)'" required class="single-input" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<label class="mt-1">Vrsta posesti</label>
								<div class="default-select" id="vrsta_posesti">
									<select name="vrsta_posesti">
										<option value="Zazidljiva">Zazidljiva</option>
										<option value="Nezazidljiva">Nezazidljiva</option>
										<option value="Kmetijsko zemljišče">Kmetijsko zemljišče</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="switch-wrap d-flex mt-10">
									<div class="primary-switch mr-10">
										<input type="checkbox" name="dodaten_opis_posesti_check" id="dodaten_opis_posesti_check" data-toggle="collapse" data-target="#dodaten_opis_posesti_skrij">
										<label for="dodaten_opis_posesti_check"></label>
									</div>
									<p>Dodaten opis</p>
								</div>
								<div class="collapse mt-10 mb-10" id="dodaten_opis_posesti_skrij">
									<textarea name="dodaten_opis_posesti" class="single-textarea" placeholder="Dodaten opis" onblur="this.placeholder = 'Dodaten opis'"></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<button type=button class="genric-btn default mb-10">
									Dodaj slike
								</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="text-center mt-10">
									<input type="submit" value="Dodaj posest" class="genric-btn primary-border circle mb-50">
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
				<!-- End Generic Start -->

			<jsp:include page="includes/footer.jsp" />
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
			<script>
				//scrolling za dodajanje nepremicnin
                $(".scroll-gumbi div a[href^='#']").on('click', function(event) {
                    var target = this.hash;

                    event.preventDefault();

                    var navOffset = $('#navbar').height();

                    return $('html, body').animate({
                        scrollTop: $(this.hash).offset().top-70 - navOffset
                    }, 600, function() {
                        return window.history.pushState(null, null, target);
                    });
                });
                //pokazi gumb za scroll to top
                window.onscroll = function() {scrollFunction()};

                function scrollFunction() {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                        document.getElementById("top-gumb").style.display = "block";
                    } else {
                        document.getElementById("top-gumb").style.display = "none";
                    }
                }
                //scroll to top
                function topFunction() {
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                }
			</script>
	</body>
</html>
