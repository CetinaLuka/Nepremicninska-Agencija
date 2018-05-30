<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Start Navbar Area -->
    <jsp:include page="includes/navigacijskiMeni.jsp" />
    <!-- End Navbar Area -->
    <section class="generic-banner relative">
        <div class="container pt-30 pb-20">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="generic-banner-content text-center">
                        <h2 class="text-white">Prijava</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br />

<!-- Prijavni obrazec

   <div class="row">
                            <div class="input-group-col-6">

                                <input type="text" name="naslov"
                                       placeholder="Naslov" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'Naslov'"
                                       required class="single-input">

                            </div>
                        </div>
-->

<main class="container">
    <br/>
    <br/>
    <form action="/kontrolnaPloscaPr" method="POST" class="">
            <div class="container ">

                    <div class="row  align-items-center justify-content-center ">
                        <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left odebeljenTextCrneBarve "for="inputEmailPriPrijavi">
                           <strong>E-mail:</strong>
                        </label>
                    </div>
                    <div class="row  align-items-center justify-content-center" >
                        <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                            <div class="input-group">
                                <input type="email" name="email"
                                       id="inputEmailPriPrijavi"
                                       placeholder="npr: borisNovak@email.com" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'npr: borisNovak@email.com'"
                                       required class="single-input">
                            </div>
                        </div>
                    </div>

                    <div class="row  align-items-center justify-content-center">
                        <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left odebeljenTextCrneBarve "for="inputGesloPriPrijavi">
                           <strong>Geslo:</strong>
                        </label>
                    </div>
                    <div class="row  align-items-center justify-content-center" >
                        <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                            <div class="input-group">
                                <input type="password" name="geslo"
                                       id="inputGesloPriPrijavi"
                                       placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = '&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;'"
                                       required class="single-input">
                            </div>
                        </div>
                    </div>

                    <div class="row  align-items-center justify-content-center" >
                        <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                            <div class="row">
                               <div class="col-6 text-left">
                                 <a href="">
                                    <p>Pozabil sem geslo!</p>
                                 </a>
                               </div>
                                    <div class="col-6 text-right">
                                     <a href="/registracija" >
                                         <p>Želim se registrirati!</p>
                                     </a>
                                    </div>
                            </div>
                        </div>
                    </div>
                <div class="row  align-items-center justify-content-center">
                    <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-9 text-right">
                                <c:if test="${prijavaNeuspesna==true}">
                                    <div style="color: darkred;">
                                        NEPRAVILNO GESLO ALI EMAIL NASLOV!
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="row  align-items-center justify-content-center" >
                        <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                            <button type="submit" class="genric-btn primary circle pull-right">
                                Prijava
                             </button>
                        </div>
                    </div>
            </div>
    </form>

    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
</main>

















<!-- End Generic Start -->




<!-- start footer Area
<jsp:include page="includes/footer.jsp" />
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
<script>

</script>
</body>
</html>
