package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajCena;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajDatum;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajKvadratura;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.repositories.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class MainController {

    // inject via application.properties
   // @Value("${welcome.message}")
    //private String message = "Hello World";


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

    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        model.addAttribute("seznamNepremicnin", nepremicninaDao.vrniZadnjeTri());
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }else{
            model.addAttribute("jePrijavljen", true);
        }
        return "index";
    }

    @RequestMapping(value = { "/iskanjeNepremicninPoRegiji" }, method = RequestMethod.GET)
    public String iskanjeNepremicninPoRegiji(Model model,@RequestParam(value="regija")int regija) {
        int zac=0;
        int konc=0;
        switch (regija){
            case 1:zac=1000;konc=1434;break;
            case 2:zac=5000;konc=6333;break;
            case 3:zac=2000;konc=3342;break;
            case 4:zac=4000;konc=4294;break;
            case 5:zac=8000;konc=8362;break;
            case 6:zac=2363;konc=2394;break;
            case 7:zac=9000;konc=9265;break;
        }
        List<Nepremicnina> result=nepremicninaDao.iskanjePoRegiji(zac,konc);
        result=new ArrayList<Nepremicnina>(result);
        //RESULT NEKAKO SPRAVIT DO /iskanjeNepremicnin IN TAM PRIKAZAT
        return "redirect:/iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/prikazNepremicnine/{nepremicninaId}" }, method = RequestMethod.GET)
    public String prikazNepremicnine(Model model,HttpServletRequest request, @PathVariable("nepremicninaId") int nepremicninaId) {
        model.addAttribute("message");
        model.addAttribute("nepremicnina", nepremicninaDao.vrniNepremicnino(nepremicninaId));
        int tkNaslov=nepremicninaDao.vrniTKnaslov(nepremicninaId);
        model.addAttribute("nepremicnina_naslov",naslovDao.vrniNaslov(tkNaslov));
        int tkKraj=naslovDao.vrniTKkraj(tkNaslov);
        model.addAttribute("nepremicnina_kraj", krajDao.vrniKraj(tkKraj));
        int tkAgent=nepremicninaDao.vrniTKagenta(nepremicninaId);
        model.addAttribute("nepremicnina_agent", agentDao.vrniAgenta(tkAgent));
        model.addAttribute("nepremicnina_slika", slikaDao.vrniSlike(nepremicninaId));
        if(slikaDao.obstajaSlikaAgenta(tkAgent)){
            model.addAttribute("profilnaSlika","data:image/jpeg;base64,"+slikaDao.vrniSlikoAgenta(tkAgent).getURLSlike());
        }
        else{
            model.addAttribute("profilnaSlika","../img/privzetaProfilna.png");
        }
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }else{
            model.addAttribute("jePrijavljen", true);
        }

        return "prikazNepremicnine";
    }

    @RequestMapping(value = {"/dodajanjeNepremicnin" }, method = RequestMethod.GET)
    public String dodajanjeNepremicnin(Model model, HttpServletRequest request) {
        model.addAttribute("message");
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }
        else{
            model.addAttribute("jePrijavljen", true);
        }
        return "dodajanjeNepremicnin";
    }
    @RequestMapping(value = {"/iskanjeNepremicnin" }, method = RequestMethod.GET)
    public String iskanjeNeprmicnin(Model model, HttpServletRequest request) {
        model.addAttribute("message");
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }else{
            model.addAttribute("jePrijavljen", true);
        }
        return "iskanjeNepremicnin";
    }

    //testen prikaz vseh vnosov
    @RequestMapping(value = {"/seznamVseh" }, method = RequestMethod.GET)
    public String seznamVseh(Model model, HttpServletRequest request) {
        model.addAttribute("kraji",krajDao.getAllKraji());
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }else{
            model.addAttribute("jePrijavljen", true);
        }
        return "seznamVseh";
    }
    @RequestMapping(value = {"/kontrolnaPlosca" }, method = RequestMethod.GET)
    public String kontrolnaPlosca(Model model) {
        model.addAttribute("message");
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik")==null)
            return "redirect:/prijava";
        else {
            int tk_agent = Integer.parseInt("" + session.getAttribute("trenutniUporabnik"));
            model.addAttribute("agent", agentDao.vrniAgenta(tk_agent));
            model.addAttribute("seznamNepremicnin", nepremicninaDao.vrniVseOdAgenta(tk_agent));
            if (slikaDao.obstajaSlikaAgenta(tk_agent)) {
                model.addAttribute("profilnaSlika", "data:image/jpeg;base64," + slikaDao.vrniSlikoAgenta(tk_agent).getURLSlike());
            } else {
                model.addAttribute("profilnaSlika", "../img/privzetaProfilna.png");
            }
            model.addAttribute("stProdanihNepremicnin", nepremicninaDao.vrniSteviloNepremicnin(tk_agent, true));
            model.addAttribute("stNepremicninNaprodaj", nepremicninaDao.vrniSteviloNepremicnin(tk_agent, false));
            model.addAttribute("cenaProdanihNepremicnin", nepremicninaDao.skupnaCenaNepremicnin(tk_agent));
            model.addAttribute("zasluzek", (nepremicninaDao.skupnaCenaNepremicnin(tk_agent) * 0.1));
            model.addAttribute("jePrijavljen", true);
            return "kontrolnaPlosca";
        }
    }

    @RequestMapping(value = {"/zbrisiNepremicnino" }, method = RequestMethod.DELETE, params = {"idZaIzbris"})
    @ResponseBody
       public Boolean zbrisiNepremicnino(@RequestParam( value = "idZaIzbris") Integer idZaIzbris, HttpServletRequest request) {
               nepremicninaDao.zbrisiNepremicnino(idZaIzbris);
               return true;
          }
    }
