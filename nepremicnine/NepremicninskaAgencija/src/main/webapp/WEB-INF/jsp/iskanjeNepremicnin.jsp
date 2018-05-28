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
    <style>
        .kartica-iskanje{
            background-color: #f4f4fa;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            padding: 20px 10px 20px 10px;
        }
        .kartica-iskanje div{
            margin-bottom: 10px;
        }
        .kartica-iskanje .izbira select{
            width: 100%;
            max-width: 300px;
        }
        .kartica-iskanje .slider{
            width: 100%;
        }
    </style>
</head>
<body>

<section class="generic-banner relative">
    <!-- Start Header Area -->
    <jsp:include page="includes/navigacijskiMeni.jsp" />
    <!-- End Header Area -->
</section>
<div class="scroll-gumbi">
    <div>
        <a href="#top">
            <button onclick="topFunction()" class="scroll-to-top genric-btn primary-border circle" id="top-gumb" title="Pojdi na vrh">Pojdi na vrh</button>
        </a>
    </div>
</div>
<section class="generic-banner relative" id="top">
    <div class="container pt-30 pb-20">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-10">
                <div class="generic-banner-content text-center">
                    <h2 class="text-white">Iskanje nepremičnin</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="mt-30">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-lg-3 mb-3 ">
                <form class="search-form" action="#">
                    <div class="row">
                        <div class="col-12">
                            <div class="kartica-iskanje">
                                <div class="izbira">
                                    <label class="mt-1">Vrsta nepremičnine</label>
                                    <div class="default-select" id="vrsta_posesti">
                                        <select name="vrsta_posesti">
                                            <option value="Zazidljiva">Stanovanje</option>
                                            <option value="Nezazidljiva">Hiša</option>
                                            <option value="Kmetijsko zemljišče">Posest</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="izbira">
                                    <label class="mt-1">Kraj</label>
                                    <div class="default-select" id="vrsta_posesti2">
                                        <select name="vrsta_posesti2">
                                            <option value="1">Ljubljana</option>
                                            <option value="2">Maribor</option>
                                            <option value="3">Celje</option>
                                            <option value="4">Kranj</option>
                                            <option value="5">Nova Gorica</option>
                                            <option value="6">Koper</option>
                                            <option value="7">Novo mesto</option>
                                            <option value="8">Murska sobota</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="izbira">
                                    <label class="mt-1">Vrsta hiše</label>
                                    <div class="default-select" id="vrsta_posesti3">
                                        <select name="vrsta_posesti4">
                                            <option value="1">Samostojna</option>
                                            <option value="2">Vrstna</option>
                                            <option value="3">Dvojček</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="izbira">
                                    <label class="mt-1">Vrsta posesti</label>
                                    <div class="default-select" id="vrsta_posesti4">
                                        <select name="vrsta_posesti4">
                                            <option value="1">Zazidljiva</option>
                                            <option value="2">Nezazidljiva</option>
                                            <option value="3">Kmetijsko zemljišče</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="slider">
                                    <p>Cena:</p>
                                    <input type="text" id="range" value="" name="range" />
                                </div>
                                <div class="slider">
                                    <p>Velikost(m2):</p>
                                    <input type="text" id="range2" value="" name="range" />
                                </div>
                                <div class="">
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10 mt-1">
                                            <input type="checkbox" name="check" id="check" value="1"/>
                                            <label for="check"></label>
                                        </div>
                                        <p>Garaža</p>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10 mt-1">
                                            <input type="checkbox" name="check2" id="check2" value="1"/>
                                            <label for="check2"></label>
                                        </div>
                                        <p>Balkon</p>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10 mt-1">
                                            <input type="checkbox" name="check3" id="check3" value="1"/>
                                            <label for="check3"></label>
                                        </div>
                                        <p>Prenovaljeno</p>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button class="genric-btn primary-border circle mt-20" style="height: 45px;">Išči nepremičnine<span class="lnr lnr-arrow-right"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-xs-12 col-lg-9">
                <div class="row">
                    <div class="col-12">
                        <h4>Iskanje za "stanovanje enosobno"</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="filter-vrstica text-center">
                            Sortiraj po:
                            <button class="genric-btn default">Prodano</button>
                            <button class="genric-btn default">Na prodaj</button>
                            <button class="genric-btn default">Abecedi</button>
                            <button class="genric-btn default">Ceni</button>
                            <button class="genric-btn default">Kvadraturi</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach  var="i" begin="1" end="10">
                        <!--stanovanje-->
                        <c:if test="true">
                            <div class="col-xs-12 col-md-6 col-lg-6">
                                <div class="single-property mb-3 stanovanje">
                                    <div class="images">
                                        <a href="img/s1.jpg">
                                            <img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="">
                                            <span>${nepremicnina.cena}€</span>
                                        </a>
                                    </div>
                                    <div class="desc">
                                        <div class="top d-flex justify-content-between">
                                            <h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Stanovanje</a></h4>
                                            <h4>${nepremicnina.skupnaKvadratura}m²</h4>
                                        </div>
                                        <div class="middle">
                                            <div class="d-flex justify-content-start">
                                                <p>Kraj: <span>Celje</span></p>
                                                <p>Naslov: <span>${nepremicnina.tk_id_naslov}</span></p>
                                            </div>
                                            <div class="d-flex justify-content-start">
                                                <p>Nadstropje: <span>${nepremicnina.nadstropje}.</span></p>
                                                <p>Št. sob: <span>${nepremicnina.steviloSob}</span></p>
                                                <p>Zgrajeno: <span>${nepremicnina.letoIzgradnje}</span></p>
                                            </div>
                                            <div class="d-flex justify-content-start">
                                                <p>Garaža:
                                                    <c:choose>
                                                        <c:when test="${nepremicnina.garaza}==true">
                                                            <span class="gr">Da</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="rd">Ne</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p>Balkon:
                                                    <c:choose>
                                                        <c:when test="${nepremicnina.balkon}==true">
                                                            <span class="gr">Da</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="rd">Ne</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p>Prenova: <span>${nepremicnina.letoPrenove}</span></p>
                                            </div>
                                            <div class="bottom d-flex">
                                                <p class="text-left"><button class="genric-btn primary">Uredi</button></p>
                                                <p class="text-rigth"><button class="genric-btn primary">Izbriši</button></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!--hisa-->
                        <c:if test="${nepremicnina.tk_id_vrstaNepremicnine==2}">
                            <div class="col-xs-12 col-md-6 col-lg-6">
                                <div class="single-property mb-3 hisa">
                                    <div class="images">
                                        <a href="img/s1.jpg">
                                            <img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="">
                                            <span>${nepremicnina.cena}€</span>
                                        </a>
                                    </div>
                                    <div class="desc">
                                        <div class="top d-flex justify-content-between">
                                            <h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Hiša - ${nepremicnina.vrstaHise}</a></h4>
                                            <h4>${nepremicnina.kvadraturaBivalnegaProstora}m²</h4>
                                        </div>
                                        <div class="middle">
                                            <div class="d-flex justify-content-start">
                                                <p>Kraj: <span>Maribor</span></p>
                                                <p>Naslov: <span>${nepremicnina.tk_id_naslov}</span></p>
                                            </div>
                                            <div class="d-flex justify-content-start">
                                                <p>Zemljišče: <span>${nepremicnina.skupnaKvadratura}m²</span></p>
                                                <p>Zgrajeno: <span>${nepremicnina.letoIzgradnje}</span></p>
                                            </div>
                                            <div class="d-flex justify-content-start">
                                                <p>Garaža:
                                                    <c:choose>
                                                        <c:when test="${nepremicnina.garaza}==true">
                                                            <span class="gr">Da</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="rd">Ne</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p>Prenova: <span>${nepremicnina.letoPrenove}</span></p>
                                            </div>
                                            <div class="bottom d-flex">
                                                <p class="text-left"><button class="genric-btn primary">Uredi</button></p>
                                                <p class="text-rigth"><button class="genric-btn primary">Izbriši</button></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!--posest-->
                        <c:if test="${nepremicnina.tk_id_vrstaNepremicnine==3}">
                            <div class="col-xs-12 col-md-6 col-lg-6">
                                <div class="single-property mb-3 posest">
                                    <div class="images">
                                        <a href="img/s1.jpg">
                                            <img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="">
                                            <span>${nepremicnina.cena}€</span>
                                        </a>
                                    </div>
                                    <div class="desc">
                                        <div class="top d-flex justify-content-between">
                                            <h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Posest - ${nepremicnina.tipPosesti}</a></h4>
                                            <h4>${nepremicnina.skupnaKvadratura}m²</h4>
                                        </div>
                                        <div class="middle">
                                            <div class="d-flex justify-content-start">
                                                <p>Kraj: <span></span></p>
                                                <p>Naslov: <span>${nepremicnina.tk_id_naslov}</span></p>
                                            </div>
                                            <div class="d-flex justify-content mb-2">
                                                Opis:<br />
                                                Zelo lepa posest, ki ima tudi kmetijsko poslopje in travnik.
                                            </div>
                                            <div class="bottom d-flex">
                                                <p class="text-left"><button class="genric-btn primary">Uredi</button></p>
                                                <p class="text-rigth"><button class="genric-btn primary">Izbriši</button></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
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
<script>
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
</script>
</body>
</html>
