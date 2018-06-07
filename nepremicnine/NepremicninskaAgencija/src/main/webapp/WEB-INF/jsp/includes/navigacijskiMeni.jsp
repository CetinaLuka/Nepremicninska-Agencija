<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<header class="default-header" >

    <nav class="navbar navbar-expand-lg  navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="/index">
                <img src="/img/logo/logo.png" alt="ikonična slika" height="50" width="70">
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
                <ul class="navbar-nav" >
                    <noscript>
                        <p>Vaš brskalnik ne podpira javascript-a zato povezave na strani ne delujejo!</p>
                    </noscript>
                    <li><a id="povezavaDomov" >Domov</a></li>
                    <li><a id="povezavaStoritve" >Storitve</a></li>
                    <li><a id="povezavaPonudba" >Ponudba</a></li>
                    <li><a id="povezavaKontakt">Kontakt</a></li>
                    <li><a href="/isciGumb">Iskanje</a></li>
                    <c:if test="${!jePrijavljen}">
                        <li><a href="/prijava">Prijava</a></li>
                        <li><a href="/registracija">Registracija</a></li>
                    </c:if>
                    <c:if test="${jePrijavljen}">
                        <li><a href="/dodajanjeNepremicnin">Dodaj nepremičnino</a></li>
                        <li><a  href="/kontrolnaPlosca">Kontrolna plošča</a></li>
                        <li><a href="/odjava">Odjava</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script>
    document.addEventListener('DOMContentLoaded', function(){
        zagotavljanjePovezav();
    });

    function zagotavljanjePovezav() {
        var domov;
        var storitve;
        var ponudba;
        var kontakt;
        domov = document.getElementById('povezavaDomov');
        storitve = document.getElementById('povezavaStoritve');
        ponudba = document.getElementById('povezavaPonudba');
        kontakt = document.getElementById('povezavaKontakt');
        try {
            if (dolocenaPovezava) {
//tu ne črtice!!!!
                domov.href = '#home';
                storitve.href = '#service';
                ponudba.href = '#property';
                kontakt.href = '#contact';

            }
        } catch (e) {
            domov.href = '/index#home';
            storitve.href = '/index#service';
            ponudba.href = '/index#property';
            kontakt.href = '/index#contact';
        }

    }

</script>