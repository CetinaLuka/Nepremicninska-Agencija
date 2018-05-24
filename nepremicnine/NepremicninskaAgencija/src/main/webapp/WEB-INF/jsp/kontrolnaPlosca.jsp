<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
    </head>
    <body>

    <section class="generic-banner relative">
        <!-- Start Header Area -->
        <jsp:include page="includes/navigacijskiMeni.jsp" />
        <!-- End Header Area -->
    </section>
    <section class="generic-banner relative">
        <div class="container pt-30 pb-20">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="generic-banner-content text-center">
                        <h2 class="text-white">Kontrolna plošča agenta</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="mt-30">
        <div class="container">
            <!--user info card-->
            <div class="row">
                    <div class="row">
                        <div class="col-12 col-lg-12">
                            <div class="row profil-kartica">
                                <div class="col-12 col-md-3 col-lg-12">
                                    <img src="img/i8.jpg" class="profil-slika img-thumbnail mb-1"/><br />
                                    <button class="genric-btn default border mb-1">Spremeni sliko</button><br />
                                    <button class="genric-btn default border">Uredi profil</button>
                                </div>
                                <br />
                                <div class="col-12 col-md-5 col-lg-12">
                                    <div class="bold-black">Ime Priimek</div>
                                    <div class="">Podatek: xxxxxxxxxxxx</div>
                                    <div class="">Podatek: xxxxxxxxxxxx</div>
                                    <div class="">Podatek: xxxxxxxxxxxx</div>
                                    <div class="">Podatek: xxxxxxxxxxxx</div>
                                    <div class="">Podatek: xxxxxxxxxxxx</div>
                                    <div class="">Podatek: xxxxxxxxxxxx</div>
                                </div>
                                <br />
                                <div class="col-12 col-md-4 col-lg-12">
                                    <iframe src="https://calendar.google.com/calendar/embed?src=en.slovenian%23holiday%40group.v.calendar.google.com&ctz=Europe%2FLondon" style="border: 0; max-width: 285px;" width="100%" height="285px" frameborder="0" scrolling="no"></iframe>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-lg-9">
                    <div class="row statistika">
                        <div class="col-xs-12 col-md-6 col-lg-6">
                            <div class="bold-black">Podatki o nepremičninah:</div>
                            <div class="">Število prodanih nepremičnin: 5</div>
                            <div class="">Število nepremičnin na prodaj: 15</div>
                            <div class="">Zaslužek od prodanih nepremičnin: 500000€</div>
                            <div class="">Skupna cena prodanih nepremičnin: 1.500.000€</div>
                        </div>
                    </div>
                    <div class="filter-vrstica">
                        Sortiraj po:
                        <button class="genric-btn default">Prodano</button>
                        <button class="genric-btn default">Na prodaj</button>
                        <button class="genric-btn default">Abecedi</button>
                        <button class="genric-btn default">Ceni</button>
                        <button class="genric-btn default">Kvadraturi</button>
                    </div>
                    <div class="row">
                        <c:forEach  var="i" begin="1" end="5">

                            <div class="col-xs-12 col-md-6 col-lg-6">
                                <div class="single-property mb-3">
                                    <div class="images">
                                        <a href="img/s1.jpg">
                                            <img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="">
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="desc">
                                        <div class="top d-flex justify-content-between">
                                            <h4><a href="#">04 Bed Duplex</a></h4>
                                            <h4></h4>
                                        </div>
                                        <div class="middle">
                                            <div class="d-flex justify-content-start">
                                                <p>Kvadrati: 40</p>
                                                <p>Št. sob: 03</p>
                                                <p>Zgrajeno: 1990</p>
                                            </div>
                                            <div class="d-flex justify-content-start">
                                                <p>Garaža: <span class="gr">Da</span></p>
                                                <p>Balkon: <span class="rd">Da</span></p>
                                                <p>Letnik prenove: <span class="rd">No</span></p>
                                            </div>
                                            <div class="bottom d-flex">
                                                <p class="text-left"><button class="genric-btn primary">Uredi</button></p>
                                                <p class="text-rigth"><button class="genric-btn primary">Izbriši</button></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>



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

    </body>
</html>
