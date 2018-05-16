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
    <style>
        html {
            height: 100%;
            box-sizing: border-box;
        }

        *,
        *:before,
        *:after {
            box-sizing: inherit;
        }

        body {
            position: relative;
            margin: 0;
            padding-bottom: 150px;
            min-height: 100%;
        }
        /**
         * Footer Styles
         */

        .footer {
            position: absolute;
            padding: 20px;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 150px;
            background-color: #efefef;
            text-align: center;
        }
    </style>
</head>
<body class="krnekaj">

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
    <form action="#" method="post" class="">
            <div class="container ">

                    <div class="row  align-items-center justify-content-center ">
                        <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left odebeljenTextCrneBarve "for="inputEmailPriPrijavi">
                           <strong>E-mail:</strong>
                        </label>
                    </div>
                    <div class="row  align-items-center justify-content-center" >
                        <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                            <div class="input-group">
                                <input type="text" name="geslo"
                                       id="inputEmailPriPrijavi"
                                       placeholder="npr: borisNovak@email.com" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = ''"
                                       required class="single-input">
                            </div>
                            <!--action listiner za napako pri objavi -->
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
                                       onblur="this.placeholder = ''"
                                       required class="single-input">
                            </div>
                            <!--action listiner za napako pri objavi -->
                        </div>
                    </div>

                    <div class="row  align-items-center justify-content-center" >
                        <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                            <div class="row">
                               <div class="col-6 text-left">
                                 <a href="#">
                                    <p>Pozabil sem geslo!</p>
                                 </a>
                               </div>
                                    <div class="col-6 text-right">
                                     <a href="#" >
                                         <p>Želim se registrirat!</p>
                                     </a>
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
</script>
</body>
</html>
