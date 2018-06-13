# Navodila za namestitev

Najprej potrebujete uspešno nameščen IntelliJ in MySQL. 
Za optimalno kompatibilnost našega projekta je nujno ustrezno namestiti predvsem program MySQL (ob inštalaciji nastaviti uporabniško ime in geslo za lokalno gosten strežnik).
Začnete z odprtjem projekta v programu IntelliJ, v programu MySQL pa najprej naredite lokalni strežnik, na njem ustvarite novo shemo s skripto "Kreiranje tabel.sql".
Ko je baza kreirana, se lahko posvetimo odvisnostim v projektu. Omogočiti je potrebno avtomatski uvoz Maven odvisnosti. Prav tako je potrebno nastaviti ustrezna vrata (po privzetem so izbrana kar 3306) ter uporabniško ime in geslo enako kot je določeno v MySQL-u.
Oboje se nahaja v datoteki application.properties na lokaciji vidni na sliki.
<p align="center"><img src="slike-navodila/uporImeInGeslo.PNG" alt="NepremicninskaAgencija" title="NepremicninskaAgencija"/></p>
