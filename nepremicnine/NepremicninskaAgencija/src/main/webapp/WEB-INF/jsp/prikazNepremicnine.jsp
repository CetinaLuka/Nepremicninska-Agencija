<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <%--<link rel="shortcut icon" href="<c:url value='img/logo/logo.png'/>">--%>
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

    <link rel="stylesheet" href="<c:url value="/css/slider-pro.min.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="<c:url value="../css/linearicons.css"/>">
    <link rel="stylesheet" href="<c:url value="../css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="../css/nice-select.css"/>">
    <link rel="stylesheet" href="<c:url value="../css/ion.rangeSlider.css"/>">
    <link rel="stylesheet" href="<c:url value="../css/ion.rangeSlider.skinFlat.css"/>">
    <link rel="stylesheet" href="<c:url value="../css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="../css/main.css"/>">


</head>
<body style="height: auto;">
<!-- Start Navbar Area -->
<jsp:include page="includes/navigacijskiMeni.jsp" />
<!-- End Navbar Area -->
<section class="generic-banner relative">
    <div class="container pt-30 pb-20">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-10">
            </div>
        </div>
    </div>
</section>
<br />

<main class="container">

    <c:if test="${!(empty nepremicnina_slika)}">
   <div class="slider-pro" id="my-slider" style="margin-top: 30px">
        <div class="sp-slides">
            <c:forEach  items="${nepremicnina_slika}" var ="slika">
                <div class="sp-slide">
                    <img src="data:image/jpeg;base64,${slika.URLSlike}" style=" width: 100%; height: 100%" />
                </div>
            </c:forEach>
        </div>
        <div class="sp-thumbnails">
            <c:forEach  items="${nepremicnina_slika}" var ="slika">
                <img class="sp-thumbnail" src="data:image/jpeg;base64,${slika.URLSlike}" />
            </c:forEach>
        </div>
    </div>
    </c:if>
    <c:if test="${empty nepremicnina_slika}">
        <div class="col-12">
            <div class="search-field">
                <div class="row">
                    <div class="col-3">
                    </div>
                    <div class="col-6 text-center">
                        <p style="margin-bottom:0px; font-weight:bold;">Ni slik za prikaz.</p>
                    </div>
                    <div class="col-3">
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </c:if>




        <section class="col-xs-12 col-lg-12 section-gap" style="padding-top: 40px !important;">
            <div class=" col-xs-12 col-lg-12 bold-black">
                <p style="font-size:x-large">${fn:toUpperCase(nepremicnina_kraj.imeKraja)}, ${nepremicnina_naslov.ulica} ${nepremicnina_naslov.hisnaSt}</p>
                <p style="color: #f41068; font-size:xx-large">${nepremicnina.cena}€</p>
                <p style="font-size:x-large; float: left">Tip nepremičnine: &nbsp </p>
                <p style="color: #f41068; font-size:x-large"> <c:if test = "${nepremicnina.tk_id_vrstaNepremicnine==1}">stanovanje</c:if>
                    <c:if test = "${nepremicnina.tk_id_vrstaNepremicnine==2}">hiša</c:if>
                    <c:if test = "${nepremicnina.tk_id_vrstaNepremicnine==3}">posest</c:if></p>
                </br>
            </div>
            <div class="row">
                <div class="col-xs-12 col-mlg-8 col-lg-8 ">
                    <div class="statistika" style="padding:20px">
                       <c:choose>
                            <c:when test = "${nepremicnina.tk_id_vrstaNepremicnine==1}">
                                <div class="row">
                                <div class="col-xs-12 col-md-12 col-lg-6">
                                    <div class="bold-black"><i class="fa fa-bed" style="font-size: x-large"></i>    Število sob</div>
                                    <div> ${nepremicnina.steviloSob}</div>
                                </div>
                                <div class="col-xs-12 col-md-12 col-lg-6">
                                    <div class="bold-black"><i class="fa fa-building" style="font-size: x-large"></i>   Nadstropje</div>
                                    <div> ${nepremicnina.nadstropje}</div>
                                </div>
                            </div>
                                <div class="row">
                                    <div class="col-xs-12 col-md-12 col-lg-6">
                                        <div class="bold-black"><i class="fa fa-expand" style="font-size: x-large"></i>    Kvadratura (m2)</div>
                                        <div> ${nepremicnina.skupnaKvadratura}m2</div>
                                    </div>
                                    <div class="col-xs-12 col-md-12 col-lg-6">
                                        <div class="bold-black"><i class="fa fa-wrench" style="font-size: x-large"></i>   Leto izgradnje</div>
                                        <div> ${nepremicnina.letoIzgradnje}</div>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test = "${nepremicnina.tk_id_vrstaNepremicnine==2}">
                            <div class="row">
                               <div class="col-xs-12 col-md-12 col-lg-6">
                                <div class="bold-black"><i class="fa fa-home" style="font-size: x-large"></i>    Vrsta hiše</div>
                                <div> ${nepremicnina.vrstaHise}</div>
                            </div>
                                <div class="col-xs-12 col-md-12 col-lg-6">
                                    <div class="bold-black"><i class="fa fa-expand" style="font-size: x-large"></i>   Kvadratura hiše (m2)</div>
                                    <div> ${nepremicnina.kvadraturaBivalnegaProstora}m2</div>
                                </div>
                            </div>
                               <div class="row">
                                   <div class="col-xs-12 col-md-12 col-lg-6">
                                       <div class="bold-black"><i class="fa fa-tree" style="font-size: x-large"></i>    Kvadratura zemljišča(m2)</div>
                                       <div> ${nepremicnina.skupnaKvadratura}m2</div>
                                   </div>
                                   <div class="col-xs-12 col-md-12 col-lg-6">
                                       <div class="bold-black"><i class="fa fa-wrench" style="font-size: x-large"></i>   Leto izgradnje</div>
                                       <div> ${nepremicnina.letoIzgradnje}</div>
                                   </div>
                               </div>
                            </c:when>
                           <c:when test = "${nepremicnina.tk_id_vrstaNepremicnine==3}">
                             <div class="row">
                                   <div class="col-xs-12 col-md-12 col-lg-6">
                                       <div class="bold-black"><i class="fa fa-expand" style="font-size: x-large"></i>    Velikost zemljišča</div>
                                       <div> ${nepremicnina.skupnaKvadratura}m2</div>
                                   </div>
                                   <div class="col-xs-12 col-md-12 col-lg-6">
                                       <div class="bold-black"><i class="fa fa-tree" style="font-size: x-large"></i>   Vrsta posesti</div>
                                       <div> ${nepremicnina.tipPosesti}</div>
                                   </div>
                               </div>
                           </c:when>
                       </c:choose>
                            <hr>
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-lg-12">
                                <p class="bold-black">Opis nepremičnine</p>
                              <p>
                                  <c:if test="${!nepremicnina.opis.equals('')}">${nepremicnina.opis}</c:if>
                                  <c:if test="${nepremicnina.opis.equals('')}"> / </c:if>
                              </p>
                            </div>
                        </div>


                       <c:if test="${nepremicnina.tk_id_vrstaNepremicnine!=3}"><hr>
                       <div class="row">
                                <div class="col-xs-12 col-md-12 col-lg-12">
                                    <h4>Značilnosti/posebnosti nepremičnine:</h4>
                                    </br>
                                    <div class="col-xs-12 col-md-4 col-lg-4">
                                        <c:if test="${nepremicnina.tk_id_vrstaNepremicnine==1}">
                                        <c:if test="${nepremicnina.balkon}" ><i class="fa fa-check" style="color: #28a745"></i></c:if>
                                        <c:if test="${!nepremicnina.balkon}" ><i class="fa fa-times"></i></c:if> BALKON
                                        </c:if>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-lg-4">
                                        <c:if test="${nepremicnina.garaza}" ><i class="fa fa-check" style="color: #28a745"></i></c:if>
                                        <c:if test="${!nepremicnina.garaza}" ><i class="fa fa-times"></i></c:if> GARAŽA
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-lg-4">
                                        <c:if test="${nepremicnina.letoPrenove!=0}" ><i class="fa fa-check" style="color: #28a745"></i>
                                                PRENOVLJENO - ${nepremicnina.letoPrenove}</c:if>
                                        <c:if test="${nepremicnina.letoPrenove==0}" ><i class="fa fa-times"></i> PRENOVLJENO</c:if>
                                    </div>
                                </div>
                        </div>
                        </c:if>
                        <hr>
                        <form name="emailPoslji" action="/prikazNepremicnine/emailPoslji" method="POST">
                                <div class="row ">
                                    <div class="col-xs-12 col-md-12 col-lg-12 bold-black">
                                        <p>Pošlji podatke nepremičnine na:</p>
                                    </div>
                                </div>

                            <div class="row ">

                                        <div class="col-xs-6 col-md-6 col-lg-6">
                                        <input type="email" name="email"
                                               placeholder="npr: borisNovak@email.com" onfocus="this.placeholder = ''"
                                               id="posljiNaEmail"
                                               onblur="this.placeholder = 'npr: borisNovak@email.com'"
                                               required class="single-input">
                                        </div>
                                    <div class="col-xs-6 col-md-6 col-lg-6">
                                            <button type="submit" class="genric-btn primary circle ">Pošlji</button>
                                    </div>
                                        <input type="hidden" name="nepremicnina" value=${id}>


                            </div>
                        </form>



                    </div>
                </div>
                <div  class="col-xs-12 col-lg-4 col-lg-4 ">
                    <div  class="statistika">
                        <div class="text-center bold-black">NEPREMIČNINSKI AGENT</div></br>
                        <div class="text-center" >
                            <img src="${profilnaSlika}" style=" max-height: 255px; max-width: 255px" />
                            <div class="text-center bold-black">${nepremicnina_agent.ime} ${fn:toUpperCase(nepremicnina_agent.priimek)}</div></br>
                            <div ><i class="fa fa-envelope"></i>  Email: ${nepremicnina_agent.email}</div>
                            <div > <c:if test="${!(nepremicnina_agent.telefonskaSt).equals('')}">
                                <i class="fa fa-phone"></i>  Tel: ${nepremicnina_agent.telefonskaSt}</c:if>
                            </div>
                            <!-- Calendly badge widget begin -->
                            <link href="https://assets.calendly.com/assets/external/widget.css" rel="stylesheet">
                            <script src="https://assets.calendly.com/assets/external/widget.js" type="text/javascript"></script>
                            <script type="text/javascript">Calendly.initBadgeWidget({url: 'https://calendly.com/nepremicninska_agencija', text: 'Rezerviraj ogled', color: '#ffffff', branding: false});</script>
                            <!-- Calendly badge widget end -->
                        </div>
                    </div>
                    <div  class="statistika" style="height: 50%; max-height: 400px">
                        <%-- AIzaSyAJrW-1laCws0wiUaBUkFlj3mcfRbIOaB8 --%>
                        <iframe width="100%" height="100%" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAJrW-1laCws0wiUaBUkFlj3mcfRbIOaB8&q=
                         ${nepremicnina_naslov.ulica}+${nepremicnina_naslov.hisnaSt}+ ${nepremicnina_kraj.imeKraja}" allowfullscreen></iframe>
                    </div>
                </div>

            </div>
        </section>
</main>
<!-- start footer Area-->
<jsp:include page="includes/footer.jsp" />
<!-- End footer Area -->
<script src="<c:url value="/js/vendor/jquery-2.2.4.min.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="<c:url value="/js/vendor/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.ajaxchimp.min.js"/>"></script>
<script src="<c:url value="/js/jquery.nice-select.min.js"/>"></script>
<script src="<c:url value="/js/jquery.sticky.js"/>"></script>
<script src="<c:url value="/js/ion.rangeSlider.js"/>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
<script src="<c:url value="/js/jquery.sliderPro.min.js"/>"></script>
<script>
$(document).ready(function (){
    $("#my-slider").sliderPro({
        width: 800,
        height:500,
        orientation: 'vertical',
        thumbnailsPosition: 'right',
        buttons: false,
        thumbnailArrows: true,
        thumbnailPointer: true,
        autoplay: false
    });
});
</script>
</body>
</html>
