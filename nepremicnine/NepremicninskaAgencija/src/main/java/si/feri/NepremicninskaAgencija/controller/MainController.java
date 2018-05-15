package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.models.KrajDao;
import si.feri.NepremicninskaAgencija.models.NaslovDao;
import si.feri.NepremicninskaAgencija.models.NepremicninaDao;

@Controller
public class MainController {

    // inject via application.properties
   // @Value("${welcome.message}")
    //private String message = "Hello World";


    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("message");
        return "index";
    }
    @RequestMapping(value = {"/dodajanjeNepremicnin" }, method = RequestMethod.GET)
    public String dodajanjeNepremicnin(Model model) {
        model.addAttribute("message");
        return "dodajanjeNepremicnin";
    }



    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    KrajDao krajDao;
    @Autowired
    NaslovDao naslovDao;

    @RequestMapping(value = {"/dodajanjeNepremicnin" }, method = RequestMethod.POST)
    public String dodajStanovanje(Model model, @RequestParam(value="naslov",required=true)String naslov,@RequestParam(value="kraj",required=true)String kraj,
        @RequestParam(value="kvadratura",required=true)double kvadratura,@RequestParam(value="stevilo_sob",required=true)int stevilo_sob,
        @RequestParam(value="letnik_izgradnje",required=true)int letnik_izgradnje,@RequestParam(value="nadstropje",required=true)int nadstropje,
        @RequestParam(value="cena",required=true)double cena,@RequestParam(value="prenovljeno",required=true)boolean prenovljeno,
        @RequestParam(value="letnik_prenove",required=true)int letnik_prenove,@RequestParam(value="garaza",required=true)boolean garaza,
        @RequestParam(value="balkon",required=true)boolean balkon,@RequestParam(value="dodaten_opis_check",required=true)boolean dodaten_opis_check,
        @RequestParam(value="dodaten_opis",required=true)String dodaten_opis) {


        model.addAttribute("dodanoStanovanje",nepremicninaDao.addStanovanje(kvadratura, stevilo_sob, letnik_izgradnje, nadstropje, cena, prenovljeno, letnik_prenove, garaza, balkon ,dodaten_opis_check, dodaten_opis));
        //locit naslov na hisnoSt in ulico
        //model.addAttribute("dodanoStanovanje",naslovDao.addNaslov());
        //RABIMO SE POSTNO ST PR KRAJU
        //model.addAttribute("dodanoStanovanje",krajDao.addKraj());
        //povezava naslova s krajom ter z nepremicnino
        return "dodajanjeNepremicnin";
    }
}
