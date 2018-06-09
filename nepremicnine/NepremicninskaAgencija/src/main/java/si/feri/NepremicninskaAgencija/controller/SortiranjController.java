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
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajZgrajeno;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.repositories.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    @Autowired
    SlikaDao slikaDao;

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
        model.addAttribute("jePrijavljen", true);
        model.addAttribute("seznamSlik",slikaDao.vrniSlikoNepremicnine());
        return "kontrolnaPlosca";
    }
    //posodabljanje statistike po brisanju/urejanju
    @RequestMapping(value = {"/posodabljanjeStatistike" }, method = RequestMethod.GET)
    public String posodabljanjeStatistike(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(true);
        int tk_agent=Integer.parseInt(""+session.getAttribute("trenutniUporabnik"));
        model.addAttribute("stProdanihNepremicnin", nepremicninaDao.vrniSteviloNepremicnin(tk_agent, true));
        model.addAttribute("stNepremicninNaprodaj", nepremicninaDao.vrniSteviloNepremicnin(tk_agent, false));
        model.addAttribute("cenaProdanihNepremicnin", nepremicninaDao.skupnaCenaNepremicnin(tk_agent));
        model.addAttribute("zasluzek", (nepremicninaDao.skupnaCenaNepremicnin(tk_agent) * 0.1));
        return "kontrolnaPlosca";
    }
    @RequestMapping(value = {"/sortiranjeIskanje" }, method = RequestMethod.GET, params = {"vrsta"})
    public String iskanjeNepremicnin(@RequestParam( value = "vrsta") String vrsta, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(true);
        List<Nepremicnina> seznam = (ArrayList<Nepremicnina>)session.getAttribute("rezultati");
        if(vrsta.equals("cena")){
            int sortCena;
            try{
                sortCena = (int)session.getAttribute("sortCena");
            }
            catch (Exception e){
                e.printStackTrace();
                sortCena = 0;
            }
            if(sortCena==0){
                Collections.sort(seznam, new PrimerjajCena());
                session.setAttribute("sortCena",1);
            }
            else if(sortCena==1){
                Collections.sort(seznam, new PrimerjajCena().reversed());
                session.setAttribute("sortCena",-1);
            }
            else{
                Collections.sort(seznam, new PrimerjajCena());
                session.setAttribute("sortCena",1);
            }
        }
        else if(vrsta.equals("kvadratura")){
            int sortKvadratura;
            try{
                sortKvadratura = (int)session.getAttribute("sortKvadratura");
            }
            catch (Exception e){
                e.printStackTrace();
                sortKvadratura = 0;
            }
            if(sortKvadratura==0){
                Collections.sort(seznam, new PrimerjajKvadratura());
                session.setAttribute("sortKvadratura",1);
            }
            else if(sortKvadratura==1){
                Collections.sort(seznam, new PrimerjajKvadratura().reversed());
                session.setAttribute("sortKvadratura",-1);
            }
            else{
                Collections.sort(seznam, new PrimerjajKvadratura());
                session.setAttribute("sortKvadratura",1);
            }
        }
        else if(vrsta.equals("dodano")){
            int sortDodano;
            try{
                sortDodano = (int)session.getAttribute("sortDodano");
            }
            catch (Exception e){
                e.printStackTrace();
                sortDodano = 0;
            }
            if(sortDodano==0){
                Collections.sort(seznam, new PrimerjajDatum());
                session.setAttribute("sortDodano",1);
                model.addAttribute("dodanoGor",1);
            }
            else if(sortDodano==1){
                Collections.sort(seznam, new PrimerjajDatum().reversed());
                session.setAttribute("sortDodano",-1);
                model.addAttribute("dodanoGor",-1);
            }
            else{
                Collections.sort(seznam, new PrimerjajDatum());
                session.setAttribute("sortDodano",1);
                model.addAttribute("dodanoGor",1);
            }
        }
        else if(vrsta.equals("zgrajeno")){
            int sortZgrajeno;
            try{
                sortZgrajeno = (int)session.getAttribute("sortZgrajeno");
            }
            catch (Exception e){
                e.printStackTrace();
                sortZgrajeno = 0;
            }
            if(sortZgrajeno==0){
                Collections.sort(seznam, new PrimerjajZgrajeno());
                session.setAttribute("sortZgrajeno",1);
            }
            else if(sortZgrajeno==1){
                Collections.sort(seznam, new PrimerjajZgrajeno().reversed());
                session.setAttribute("sortZgrajeno",-1);
            }
            else{
                Collections.sort(seznam, new PrimerjajZgrajeno());
                session.setAttribute("sortZgrajeno",1);
            }
        }
        model.addAttribute("seznamIskanja",seznam);
        return "iskanjeNepremicnin";
    }
}
