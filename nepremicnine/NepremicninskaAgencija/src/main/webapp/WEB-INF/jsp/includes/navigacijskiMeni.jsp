<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<header class="default-header">
    <nav class="navbar navbar-expand-lg  navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index">
                <img src="/img/logo/logo2.svg" alt="ikonična slika" height="50" width="70">
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
                <ul class="navbar-nav">
                    <li><a href="index#home">Domov</a></li>
                    <li><a href="index#service">Storitve</a></li>
                    <li><a href="index#property">Ponudba</a></li>
                    <li><a href="index#contact">Kontakt</a></li>
                    <li><a href="dodajanjeNepremicnin">Dodaj nepremičnino</a></li>
                    <li><a href="prijava">Prijava</a></li>
                    <li><a href="registracija">Registracija</a></li>
                </ul>
            </div>
        </div>
    </nav>


</header>