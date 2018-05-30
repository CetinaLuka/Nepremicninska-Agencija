<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
    <div class="scroll-gumbi">
        <div>
            <a href="#top">
                <button class="scroll-to-top genric-btn primary-border circle" id="top-gumb" title="Pojdi na vrh">Pojdi na vrh</button>
            </a>
        </div>
    </div>
    <section class="generic-banner relative" id="top">
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
            <div class="col-xs-12 col-lg-3">
                <div class="row">
                    <div class="col-12 col-lg-12">
                        <div class="row profil-kartica">
                            <div class="col-12 col-md-3 col-lg-12 text-center">
                                <img src="${profilnaSlika}" style=" max-height: 255px; max-width: 255px"  />
                                <button class="genric-btn default border mb-1">Spremeni sliko</button><br />
                                <a href="urejanjeProfila"  class="genric-btn default border" style="width: 100%">Uredi profil</a>
                            </div>
                            <br />
                            <div class="col-12 col-md-5 col-lg-12">
                                <div class="bold-black">${fn:toUpperCase(agent.ime)} ${fn:toUpperCase(agent.priimek)}</div>
                                <div class="">Email: ${agent.email}</div>
                                <c:if test="${!(agent.telefonskaSt).equals('')}">
                                     <div class="">Tel: ${agent.telefonskaSt}</div>
                                 </c:if>
                            </div>
                            <br /><br /><br /><br />
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
                        <div class="">Število prodanih nepremičnin: ${stProdanihNepremicnin}</div>
                        <div class="">Število nepremičnin na prodaj: ${stNepremicninNaprodaj}</div>
                        <div class="">Zaslužek od prodanih nepremičnin: ${zasluzek}€</div>
                        <div class="">Skupna cena prodanih nepremičnin: ${cenaProdanihNepremicnin}€</div>
                    </div>
                </div>
                    <div class="filter-vrstica">
                        Sortiraj po:
                        <button class="genric-btn default" >Prodano</button>
                        <button class="genric-btn default" >Na prodaj</button>
                        <button class="genric-btn default" onclick="sortiraj(datum-dodaje)">Datumu dodaje</button>
                        <button class="genric-btn default" onclick="sortirajCena()">Ceni</button>
                        <button class="genric-btn default" onclick="sortirajKvadratura()">Kvadraturi</button>
                    </div>
                    <div class="row">
                        <c:forEach  items="${seznamNepremicnin}" var ="nepremicnina">
                            <!--stanovanje-->
                            <c:if test="${nepremicnina.tk_id_vrstaNepremicnine==1}">
                                <div id="${nepremicnina.idNepremicnina}" class="col-xs-12 col-md-6 col-lg-6">
                                    <div class="single-property mb-3 stanovanje">
                                        <div class="images">
                                            <a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">
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
                                                    Prenova:
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
                                                        <p class="text-left"><button onclick="urejanje(${nepremicnina},${nepremicnina.tk_id_vrstaNepremicnine})" class="genric-btn primary" data-toggle="modal" data-target="#urediNepremicninoModal">Uredi</button></p>
                                                        <p class="text-rigth"><button class="genric-btn primary" onclick="zbrisiNepremicnino(${nepremicnina.idNepremicnina})">Izbriši</button></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!--hisa-->
                            <c:if test="${nepremicnina.tk_id_vrstaNepremicnine==2}">
                                <div id="${nepremicnina.idNepremicnina}" class="col-xs-12 col-md-6 col-lg-6">
                                    <div class="single-property mb-3 hisa">
                                        <div class="images">
                                            <a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">
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
                                                <div class="bottom d-flex">
                                                    <p class="text-left"><button onclick="urejanje(${nepremicnina},${nepremicnina.tk_id_vrstaNepremicnine})" class="genric-btn primary" data-toggle="modal" data-target="#urediNepremicninoModal" >Uredi</button></p>
                                                    <p class="text-rigth"><button class="genric-btn primary"  onclick="zbrisiNepremicnino(${nepremicnina.idNepremicnina}")>Izbriši</button></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!--posest-->
                            <c:if test="${nepremicnina.tk_id_vrstaNepremicnine==3}">
                                <div id="${nepremicnina.idNepremicnina}" class="col-xs-12 col-md-6 col-lg-6">
                                    <div class="single-property mb-3 posest">
                                        <div class="images">
                                            <a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">
                                                <img class="img-fluid mx-auto d-block" src="img/s1.jpg" alt="">
                                                <span>${nepremicnina.cena}€</span>
                                            </a>
                                        </div>
                                        <div class="desc">
                                            <div class="top d-flex justify-content-between">
                                                <h4><a href="prikazNepremicnine/${nepremicnina.idNepremicnina}">Posest - ${nepremicnina.tipPosesti}</a></h4>
                                                <h4>${nepremicnina.skupnaKvadratura}m²</h4>
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
                                                        <p class="text-left"><button onclick="urejanje(${nepremicnina},${nepremicnina.tk_id_vrstaNepremicnine})" class="genric-btn primary" data-toggle="modal" data-target="#urediNepremicninoModal">Uredi</button></p>
                                                        <p class="text-rigth"><button class="genric-btn primary" onclick="zbrisiNepremicnino(${nepremicnina.idNepremicnina})">Izbriši</button></p>
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
        </div>
    </section>
    <!-- Modal -->
    <div class="modal fade" id="urediNepremicninoModal" tabindex="-1" role="dialog" aria-labelledby="urediNepremicninoModal" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="naslovStanovanjeModal">Urejanje hiše</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <s:form name="dodaj_hiso_form" method="POST" action="dodajanjeHise" modelAttribute="uploadForm" enctype="multipart/form-data">
                    <div id="hisa-modal">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 col-md-8">
                                    <input type="hidden" name="id_hisa" id="id_hisa">
                                    <!--Polje za vnos naslova(ulice) - name:naslov-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                                        <input type="text" name="naslov" placeholder="Naslov" required class="single-input">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <!--Polje za vnos hišne številke - name:hisna_st-->
                                    <div class="mt-10">
                                        <input type="text" name="hisna_st" placeholder="Hišna številka" required class="single-input">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-8">
                                    <!--Polje za vnos kraja - name:kraj-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
                                        <input type="text" name="kraj" placeholder="Kraj" required class="single-input">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <!--Polje za vnos poštne številke - name:postna_st-->
                                    <div class="mt-10">
                                        <input type="text" name="postna_st" placeholder="Poštna številka" required class="single-input">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-4">
                                    <!--Polje za vnos kvadrature - name:kvadratura-->
                                    <div class="mt-10">
                                        <input type="text" name="kvadratura" placeholder="Kvadratura (m²)" required class="single-input" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-4">
                                    <!--Polje za vnos velikosti zemljišča - name:velikost_zemljisca-->
                                    <div class="mt-10">
                                        <input type="text" name="velikost_zemljisca" placeholder="Velikost zemljišča (m²)" required class="single-input" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-md-4">
                                    <!--Polje za vnos letnika izgradnje - name:letnik_izgradnje-->
                                    <div class="mt-10">
                                        <input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" required class="single-input" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-4">
                                    <!--Polje za vnos cene - name:cena-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                                        <input type="text" name="cena" placeholder="Cena" required class="single-input" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <!--Select za vnos vrste hiše - name:vrsta_hise-->
                                    <label class="mt-1">Vrsta hiše</label>
                                    <div class="default-select" id="vrsta_hise">
                                        <select name="vrsta_hise">
                                            <option value="Samostojna">Samostojna</option>
                                            <option value="Dvojček">Dvojček</option>
                                            <option value="Vrstna">Vrstna</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-4">
                                    <!--Checkbox za prenovljenost - name:prenovljeno-->
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10 mt-1">
                                            <input type="hidden" name="prenovljeno" id="prenovljeno_hisaSkrito" value="0"/>
                                            <input type="checkbox" name="prenovljeno" id="prenovljeno_hisa" value="1" data-toggle="collapse" data-target="#letnik_prenove_hisa_skrij">
                                            <label for="prenovljeno_hisa"></label>
                                        </div>
                                        <p>Prenovljeno</p>
                                    </div>
                                    <!--Polje za vnos letnika prenove - name:letnik_prenove-->
                                    <div class="collapse" id="letnik_prenove_hisa_skrij" >
                                        <input type="text" name="letnik_prenove" placeholder="Letnik prenove" class="single-input" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <!--Checkbox za garažo - name:garaza-->
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10">
                                            <input type="checkbox" name="garaza" id="garaza_hisa" value="1"/>
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
                                        <textarea name="dodaten_opis_hise" class="single-textarea" placeholder="Dodaten opis"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="genric-btn default" data-dismiss="modal">Zapri</button>
                            <button type="submit" class="genric-btn info">Shrani</button>
                        </div>
                    </div>
                    <div id="stanovanje-modal">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 col-md-9">
                                    <!--Polje za vnos naslova(ulice) - name:naslov-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                                        <input type="text" name="naslov" placeholder="Naslov" required class="single-input">
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <!--Polje za vnos hišne številke - name:hisna_st-->
                                    <div class="mt-10">
                                        <input type="text" name="hisna_st" placeholder="Hišna številka" required class="single-input">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-9">
                                    <!--Polje za vnos kraja - name:kraj-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
                                        <input type="text" name="kraj" placeholder="Kraj" required class="single-input">
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <!--Polje za vnos poštne številke - name:postna_st-->
                                    <div class="mt-10">
                                        <input type="text" name="postna_st" placeholder="Poštna številka" required class="single-input">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-3 col-xl-3">
                                    <!--Polje za vnos kvadrature - name:kvadratura-->
                                    <div class="mt-10">
                                        <input type="text" name="kvadratura" placeholder="Kvadratura (m²)" required class="single-input" />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-3 col-xl-3">
                                    <!--Polje za vnos števila sob - name:stevilo_sob-->
                                    <div class="mt-10">
                                        <input type="text" name="stevilo_sob" placeholder="Število sob" required class="single-input" />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-3 col-xl-3">
                                    <!--Polje za vnos letnika izgradnje - name:letnik_izgradnje-->
                                    <div class="mt-10">
                                        <input type="text" name="letnik_izgradnje" placeholder="Letnik izgradnje" required class="single-input" />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-3 col-xl-3">
                                    <!--Polje za vnos nadstropja - name:nadstropje-->
                                    <div class="mt-10">
                                        <input type="text" name="nadstropje" placeholder="Nadstropje" required class="single-input" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <!--Polje za vnos cene - name:cena-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                                        <input type="text" name="cena" placeholder="Cena" required class="single-input" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <!--Checkbox za prenovljenost - name:prenovljeno-->
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10 mt-1">
                                            <!--input type="hidden" name="prenovljeno" id="prenovljenoSkrit" value="0" /-->
                                            <input type="checkbox" id="prenovljeno"  data-toggle="collapse" data-target="#letnik_prenove_skrij">
                                            <label for="prenovljeno"></label>
                                        </div>
                                        <p>Prenovljeno</p>
                                    </div>
                                    <!--Polje za vnos letnika prenove - name:letnik_prenove-->
                                    <div class="collapse" id="letnik_prenove_skrij" >
                                        <input type="text" name="letnik_prenove" placeholder="Letnik prenove" class="single-input" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <!--Checkbox za garažo - name:garaza-->
                                    <div class="switch-wrap d-flex mt-1 ">
                                        <div class="primary-checkbox mr-10">
                                            <!--input type="hidden" name="garaza" id="garazaSkrit" value="0"-->
                                            <input type="checkbox" name="garaza" id="garaza" value="1">
                                            <label for="garaza"></label>
                                        </div>
                                        <p>Garaža</p>
                                    </div>
                                    <!--Checkbox za balkon - name:balkon-->
                                    <div class="switch-wrap d-flex mt-1">
                                        <div class="primary-checkbox mr-10 mt-1">
                                            <!--input type="hidden" name="balkon" id="balkonSkrit" value="0"-->
                                            <input type="checkbox" name="balkon" id="balkon" value="1">
                                            <label for="balkon"></label>

                                        </div>
                                        <p>Balkon</p>
                                    </div>
                                    <!--Switch za dodaten opis - name:dodaten_opis_stanovanja_check-->
                                    <div class="switch-wrap d-flex ">
                                        <div class="primary-switch mr-10">
                                            <input type="checkbox" name="dodaten_opis_stanovanja_check" id="dodaten_opis_stanovanja_check" data-toggle="collapse" data-target="#dodaten_opis_stanovanja_skrij">
                                            <label for="dodaten_opis_stanovanja_check"></label>
                                        </div>
                                        <p>Dodaten opis</p>
                                    </div>
                                    <!--Polje za vnos dodatnega opisa - name:dodaten_opis_stanovanja-->
                                    <div class="mt-10 mb-10 collapse " id="dodaten_opis_stanovanja_skrij">
                                        <textarea name="dodaten_opis_stanovanja" class="single-textarea" placeholder="Dodaten opis"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="genric-btn default" data-dismiss="modal">Zapri</button>
                            <button type="submit" class="genric-btn info">Shrani</button>
                        </div>
                    </div>
                    <div id="posest-modal">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 col-md-8">
                                    <!--Polje za vnos naslova(ulice) - name:naslov-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                                        <input type="text" name="naslov" placeholder="Naslov" required class="single-input">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <!--Polje za vnos hišne številke - name:hisna_st-->
                                    <div class="mt-10">
                                        <input type="text" name="hisna_st" placeholder="Hišna številka" required class="single-input">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-8">
                                    <!--Polje za vnos kraja - name:kraj-->
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
                                        <input type="text" name="kraj" placeholder="Kraj" required class="single-input">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <!--Polje za vnos poštne številke - name:postna_st-->
                                    <div class="mt-10">
                                        <input type="text" name="postna_st" placeholder="Poštna številka" required class="single-input">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-4">
                                    <div class="input-group-icon mt-10">
                                        <div class="icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                                        <input type="text" name="cena" placeholder="Cena" required class="single-input" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-4">
                                    <div class="mt-10">
                                        <input type="text" name="velikost_zemljisca" placeholder="Velikost zemljišča (m²)" orequired class="single-input" />
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
                                        <textarea name="dodaten_opis_posesti" class="single-textarea" placeholder="Dodaten opis"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="genric-btn default" data-dismiss="modal">Zapri</button>
                            <button type="submit" class="genric-btn info">Shrani</button>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </div>


    <jsp:include page="includes/footer.jsp" />
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
        function urejanje(id, vrsta){
            console.log(vrsta);
            $('input[name=naslov]').val(id);
            $('#id_hisa').val(id);
            $('#hisa-modal').hide();
            /*if(vrsta==1){
                $('#hisa-modal').hide();
                $('#stanovanje-modal').show();
            }
            else if(vrsta==2){
                $('#stanovanje-modal').hide();
                $('#hisa-modal').show();
            }*/
        }
        function sortirajCena(){
            $('#seznam-wrapper').load("sortiranjeKontrolna?vrsta=cena #seznam");
        }
        function sortirajKvadratura(){
            $('#seznam-wrapper').load("sortiranjeKontrolna?vrsta=kvadratura #seznam");
        }
        function zbrisiNepremicnino(id){
            $.ajax({
                url: "/zbrisiNepremicnino?idZaIzbris=" + id,
                method: "DELETE",
                dataType: 'json',
                success: function (data){
                    $("#" + id).remove();
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
    </script>
</body>
</html>
