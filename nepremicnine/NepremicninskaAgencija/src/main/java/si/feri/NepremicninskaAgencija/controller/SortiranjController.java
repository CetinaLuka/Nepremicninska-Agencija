package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajCena;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajDatum;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajKvadratura;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.repositories.AgentDao;
import si.feri.NepremicninskaAgencija.repositories.KrajDao;
import si.feri.NepremicninskaAgencija.repositories.NaslovDao;
import si.feri.NepremicninskaAgencija.repositories.NepremicninaDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
public class SortiranjController {

    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    KrajDao krajDao;
    @Autowired
    NaslovDao naslovDao;
    @Autowired
    AgentDao agentDao;

    static boolean sortCena = false;
    static int cenaGor = 1;
    static boolean sortKvadratura = false;
    static int kvadraturaGor = 1;
    static boolean sortDatum = false;
    static int datumGor = 1;
    static boolean prodano = false;
    static boolean naProdaj = false;
    @RequestMapping(value = {"/sortiranjeKontrolna" }, method = RequestMethod.GET, params = {"vrsta"})
    public String sortiranje(@RequestParam( value = "vrsta") String vrsta, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(true);
        int tk_agent=Integer.parseInt(""+session.getAttribute("trenutniUporabnik"));
        List<Nepremicnina> seznamNepremicnin;
        if((vrsta.equals("prodano") && prodano!=true) || (prodano==true && (vrsta.equals("cena") || vrsta.equals("datum") || vrsta.equals("kvadratura")))){
            seznamNepremicnin = nepremicninaDao.vrniVseProdaneOdAgenta(tk_agent);
            prodano = true;
            naProdaj = false;
            model.addAttribute("prodano", prodano);
            model.addAttribute("naProdaj", naProdaj);
        }
        else if((vrsta.equals("naProdaj") && naProdaj!=true) || (naProdaj==true && (vrsta.equals("cena") || vrsta.equals("datum") || vrsta.equals("kvadratura")))){
            seznamNepremicnin = nepremicninaDao.vrniVseNeprodaneOdAgenta(tk_agent);
            naProdaj = true;
            prodano = false;
            model.addAttribute("prodano", prodano);
            model.addAttribute("naProdaj", naProdaj);
        }
        else{
            seznamNepremicnin = nepremicninaDao.vrniVseOdAgenta(tk_agent);
            prodano = false;
            naProdaj= false;
            model.addAttribute("prodano", prodano);
            model.addAttribute("naProdaj", naProdaj);
        }
        if(vrsta.equals("cena")) {
            if (sortCena == false) {
                Collections.sort(seznamNepremicnin, new PrimerjajCena());
                sortCena = true;
            } else {
                Collections.sort(seznamNepremicnin, new PrimerjajCena().reversed());
                sortCena = false;
            }
            model.addAttribute("cenaGor",cenaGor);
            cenaGor *= -1;
        }
        else if(vrsta.equals("kvadratura")) {
            if (sortKvadratura == false) {
                Collections.sort(seznamNepremicnin, new PrimerjajKvadratura());
                sortKvadratura = true;
            }
            else{
                Collections.sort(seznamNepremicnin, new PrimerjajKvadratura().reversed());
                sortKvadratura = false;
            }
            model.addAttribute("kvadraturaGor",kvadraturaGor);
            kvadraturaGor *= -1;
        }
        else if(vrsta.equals("datum")) {
            if (sortDatum == false) {
                Collections.sort(seznamNepremicnin, new PrimerjajDatum());
                sortDatum = true;
            }
            else{
                Collections.sort(seznamNepremicnin, new PrimerjajDatum().reversed());
                sortDatum = false;
            }
            model.addAttribute("datumGor",datumGor);
            datumGor *= -1;
        }
        model.addAttribute("seznamNepremicnin", seznamNepremicnin);
        return "kontrolnaPlosca";
    }
}
