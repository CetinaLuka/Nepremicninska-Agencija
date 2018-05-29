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
    <div class="container pt-90">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-10">
                <div class="generic-banner-content text-center">
                    <h2 class="text-white">UREJANJE PROFILA</h2>
                </div>
            </div>
        </div>
    </div>
</section>

<main class="container">

    <br><br>
    <c:choose>
        <c:when test = "${uspesnoProfil==true}">
            <div class="alert alert-success alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                USPEŠNO POSODOBLJEN PROFIL.</div>
        </c:when>
        <c:when test = "${uspesnoProfil==false}">
            <div class="alert alert-danger alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                NEUSPEŠNO POSODABLANJE PROFILA.</div>
        </c:when>
        <c:when test = "${uspesnoGeslo==true}">
            <div class="alert alert-success alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               USPEŠNO POSODOBLJENO GESLO.</div>
        </c:when>
        <c:when test = "${uspesnoGeslo==false}">
            <div class="alert alert-danger alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                NEUSPEŠNO POSODABLANJE GESLA.</div>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <div class="text-center" style="margin-top:50px">
        <div class="text-center">
            <img src="${profilnaSlika}" style=" max-height: 255px; max-width: 255px" />
          </div>
    </div>
    <%--...................................--%>
    <form name="posodobiProfilnoSliko" method="POST" action="/posodobiProfilnoSliko" modelAttribute="uploadForm" enctype="multipart/form-data">

    <div class="row">
        <div class="col-12 text-center">
            <label class="genric-btn default mb-10 " for="image_uploads">naloži profilno sliko</label>
            <input style="display: none" type="file" id="image_uploads"  name="files[0]" accept=".jpg, .jpeg, .png" multiple>
        </div>
    </div>
    <div class="row text-dark text-center">
        <div class="col-12 text-center">
        <div id="posodobiProfilnoSliko" class="col-12 text-center"></div>
        </div>
    </div>

    <script>
        var fileTypes = [
            'image/jpeg',
            'image/pjpeg',
            'image/png'
        ]
        var input = document.querySelector('#image_uploads');
        var preview = document.querySelector('#posodobiProfilnoSliko');
        input.style.visibility = 'hidden';
        input.addEventListener('change', posodobiPregledSlik);
        function  posodobiPregledSlik() {
            var curFiles = input.files;
            if(curFiles.length !== 0) {
                var list = document.createElement('ol');
                preview.appendChild(list);
                for(var i = 0; i < curFiles.length; i++) {
                    if(validFileType(curFiles[i])) {
                        var listItem = document.createElement('li');
                        listItem.setAttribute("class","list-group-item");
                        var image = document.createElement('img');
                        list.setAttribute("class","slikaZaFotografije");
                        image.src = window.URL.createObjectURL(curFiles[i]);
                        listItem.appendChild(image);
                        list.appendChild(document.createElement('BR'));
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
                <input type="submit" value="SHRANI" class="genric-btn primary-border circle mb-50">
            </div>
        </div>
    </div>
</form>
    <%-- .......................................................................--%>

    <div class="text-center" style="margin-top: 50px">
        <h1>Posodobi osebne podatke</h1>

    <form id="posodobi" action="/posodobiProfil" method="POST" class="">
        <div class="container ">

            <div class="row  align-items-center justify-content-center ">
                <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="novoIme">
                    <strong>Ime:</strong>
                </label>
            </div>
            <div class="row  align-items-center justify-content-center" >
                <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                    <div class="input-group">
                        <input type="text" name="novoIme" value="${imeUporabnika}"
                               id="novoIme"

                               required class="single-input">
                    </div>
                </div>
            </div>

            <div class="row  align-items-center justify-content-center ">
                <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="novPriimek">
                    <strong>Priimek:</strong>
                </label>
            </div>
            <div class="row  align-items-center justify-content-center" >
                <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                    <div class="input-group">
                        <input type="text" name="novPriimek" value="${priimekUporabnika}"
                               id="novPriimek"
                               required class="single-input">
                    </div>
                </div>
            </div>

            <div class="row  align-items-center justify-content-center ">
                <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="novMail">
                    <strong>Mail:</strong>
                </label>
            </div>
            <div class="row  align-items-center justify-content-center" >
                <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                    <div class="input-group">
                        <input type="email" name="novMail" value="${mailUporabnika}"
                               id="novMail"
                               required class="single-input">
                    </div>
                </div>
            </div>


            <div class="row  align-items-center justify-content-center ">
                <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="telefonskaStevilka">
                    <strong>Telefonska stevilka:</strong>
                </label>
            </div>
            <div class="row  align-items-center justify-content-center" >
                <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                    <div class="input-group">
                        <input type="text" name="telefonskaStevilka" value="${telUporabnika}"
                               id="telefonskaStevilka"
                               class="single-input">
                    </div>
                </div>
            </div>

        </div>
        <br>

        <div class="row  align-items-center justify-content-center" >
            <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                <button type="submit" class="genric-btn primary circle pull-right">
                    Posodobi profil
                </button>
            </div>
        </div>
    </form>

         </div>
    <div class="text-center" style="margin-top:50px">
        <h1>Posodobi geslo</h1>
    <form action="/posodobiGeslo" method="post">

        <div class="row  align-items-center justify-content-center ">
            <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="staroGesloSpremeni">
                <strong>Staro geslo:</strong>
            </label>
        </div>
        <div class="row  align-items-center justify-content-center" >
            <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                <div class="input-group">
                    <input type="password" name="staroGesloSpremeni"
                           id="staroGesloSpremeni"
                           placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'staro ime'"
                           required class="single-input">
                </div>
            </div>
        </div>

        <div class="row  align-items-center justify-content-center ">
            <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="novoGesloSpremeni">
                <strong>Novo geslo:</strong>
            </label>
        </div>
        <div class="row  align-items-center justify-content-center" >
            <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                <div class="input-group">
                    <input type="password" name="novoGesloSpremeni" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                           title="Geslo mora vsebovati vsaj eno veliko črko, vsaj eno malo črko in vsaj eno število ter mora biti dolgo vsaj 8 znakov."
                           id="inputGesloPriRegistraciji"
                           placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;';"
                           oninput="
                                   if (this.value!==document.getElementsByName('novoGesloSpremeni2')[0].value && document.getElementsByName('novoGesloSpremeni2')[0].value !== ''){
                                       document.getElementsByName('novoGesloSpremeni2')[0].style.backgroundColor='#f41068';
                                       document.getElementsByName('novoGesloSpremeni2')[0].setCustomValidity('Ponovljeno geslo se mora ujemati s prvim geslom.');
                                              }
                                   else{
                                       document.getElementsByName('novoGesloSpremeni2')[0].style.backgroundColor='#e8e8ee';
                                       document.getElementsByName('novoGesloSpremeni2')[0].setCustomValidity('');
                                   }
                                   "
                           required class="single-input">
                </div>
            </div>
        </div>

        <div class="row  align-items-center justify-content-center ">
            <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="novoGesloSpremeni2">
                <strong>Ponovi novo geslo:</strong>
            </label>
        </div>
        <div class="row  align-items-center justify-content-center" >
            <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                <div class="input-group">
                    <input type="password" name="novoGesloSpremeni2"
                           id="novoGesloSpremeni2"
                           placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;';"
                           oninput="
                                   if (this.value!==document.getElementsByName('novoGesloSpremeni')[0].value){
                                       this.style.backgroundColor='#f41068';
                                       this.setCustomValidity('Ponovljeno geslo se mora ujemati s prvim geslom.');
                                              }
                                    else{
                                       this.style.backgroundColor='#e8e8ee';
                                       this.setCustomValidity('');
                                   }"
                           required class="single-input">
                </div>
            </div>
        </div>
        <br>
        <div class="row  align-items-center justify-content-center" >
            <div class="banner-content col-lg-5 col-md-7 col-sm-10 col-xs-12">
                <button type="submit" class="genric-btn primary circle pull-right">
                    Posodobi geslo
                </button>
            </div>
        </div>

    </form>
    </div>


    <section class="section-gap text-center">
        <h1>IZBRIŠI RAČUN</h1>
        <form action="/zbrisiRacun" method="POST">
    <div class="row  align-items-center justify-content-center ">
        <label class="col-lg-5 col-md-7 col-sm-10 col-xs-12 text-left " for="novoGesloSpremeni2">
            <strong>Ko boste izbrisali račun, se ne boste mogli več prijaviti. Izgubili boste vse dosedanje podatke. </strong>
            Ste prepričani, da želite izbrisati račun?
        </label>
    </div>

        <div class="row align-items-center justify-content-center" >
        <div class="text-center">
            <button type="submit" class="genric-btn primary circle pull-right ">
                Zbriši račun
            </button>
        </div>
    </div>
        </form>
    </section>
</main>
<script>
    document.getElementById("posodobi").addEventListener("submit", function (event) {
        var geslo1Input = document.getElementById("novoGesloSpremeni");
        var geslo2Input = document.getElementById("novoGesloSpremeni2");

        if(geslo1Input.value !== geslo2Input.value){
            return false;
        }
        else{
            return true;
        }
    });

</script>

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
