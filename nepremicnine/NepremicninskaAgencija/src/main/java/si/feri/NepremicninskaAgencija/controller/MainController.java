package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.repositories.KrajDao;
import si.feri.NepremicninskaAgencija.repositories.NaslovDao;
import si.feri.NepremicninskaAgencija.repositories.NepremicninaDao;

import java.util.List;

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

    //testen prikaz vseh vnosov
    @RequestMapping(value = {"/seznamVseh" }, method = RequestMethod.GET)
    public String seznamVseh(Model model) {
        model.addAttribute("kraji",krajDao.getAllKraji());
        return "seznamVseh";
    }
    @RequestMapping(value = {"/kontrolnaPlosca" }, method = RequestMethod.GET)
    public String kontrolnaPlosca(Model model) {
        model.addAttribute("message");
        return "kontrolnaPlosca";
    }

    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    KrajDao krajDao;
    @Autowired
    NaslovDao naslovDao;

    @RequestMapping(value = {"/dodajanjeNepremicnin" }, method = RequestMethod.POST)
    public String dodajStanovanje(Model model, @RequestParam(value="naslov",required=true)String naslov,@RequestParam(value="kraj",required=true)String kraj,
        @RequestParam(value="postna_st",required=true)String postna_st,@RequestParam(value="hisna_st",required=true)String hisnaSt,
        @RequestParam(value="kvadratura",required=true)double kvadratura,@RequestParam(value="stevilo_sob",required=true)String stevilo_sob,
        @RequestParam(value="letnik_izgradnje",required=true)String letnik_izgradnje,@RequestParam(value="nadstropje",required=true)String nadstropje,
        @RequestParam(value="cena",required=true)String cena,@RequestParam(value="prenovljeno",required=false)boolean prenovljeno,
        @RequestParam(value="letnik_prenove",required=false)String letnik_prenove,@RequestParam(value="garaza",required=false)boolean garaza,
        @RequestParam(value="balkon",required=false)boolean balkon,@RequestParam(value="dodaten_opis_stanovanja_check",required=false)boolean dodaten_opis_check,
        @RequestParam(value="dodaten_opis_stanovanja",required=false)String dodaten_opis) {

        krajDao.addKraj(kraj,postna_st);
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }
        //int tk_agent= IZ SEJE VRNI ID VPISANEGA AGENTA
        // ČE NISO PRISOTNI NEKATERI PARAMETRI BO MOGOČE TREBA NAREDITI VEČ METOD ZA DODAJANJE
        //nepremicninaDao.addStanovanje(kvadratura, stevilo_sob, letnik_izgradnje, nadstropje, cena, prenovljeno, letnik_prenove, garaza, balkon ,dodaten_opis_check, dodaten_opis, tk_naslov);

        //povezava naslova s krajom ter z nepremicnino
        return "dodajanjeNepremicnin";
    }
}
