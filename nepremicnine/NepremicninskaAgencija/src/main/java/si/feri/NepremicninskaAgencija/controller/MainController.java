package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajCena;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajDatum;
import si.feri.NepremicninskaAgencija.Komparatorji.PrimerjajKvadratura;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.repositories.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

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
        model.addAttribute("podatki", naslovDao.vrniPodatke());
        return "index";
    }

    @RequestMapping(value = { "/iskanjeNepremicninPoRegiji" }, method = RequestMethod.GET)
    public String iskanjeNepremicninPoRegiji(RedirectAttributes red, Model model,@RequestParam(value="regija")int regija) {
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
        red.addFlashAttribute("seznamIskanja",result);
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
    public String iskanjeNepremicnin(RedirectAttributes red, Model model, HttpServletRequest request) {
        model.addAttribute("message");
        HttpSession session = request.getSession(true);
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }else{
            model.addAttribute("jePrijavljen", true);
        }
        return "iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/iskanjeStanovanje" }, method = RequestMethod.GET)
    public String iskanjeStanovanje(RedirectAttributes red, Model model, @RequestParam(value="select_pokrajina")int regija,
                                    @RequestParam(value="letnik_izgradnje")String letnik_izgradnje, @RequestParam(value="letnik_prenove")String letnik_prenove,
                                    @RequestParam(value="stevilo_sob")String stevilo_sob, @RequestParam(value="garaza")String garaza,
                                    @RequestParam(value="balkon")String balkon,
                                    @RequestParam(value="range1")String range1, @RequestParam(value="range2")String range2) {
        model.addAttribute("message");
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
        String [] cena=range1.split(";");
        String [] skupnaKvadratura=range2.split(";");
        List<Nepremicnina> list=nepremicninaDao.iskanjeStanovanje(zac,konc,letnik_izgradnje,letnik_prenove,stevilo_sob,garaza,balkon,cena,skupnaKvadratura);
        red.addFlashAttribute("seznamIskanja",list);
        return "redirect:/iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/iskanjeHisa" }, method = RequestMethod.GET)
    public String iskanjeHisa(RedirectAttributes red, Model model, @RequestParam(value="select_pokrajina")int regija, @RequestParam(value="select_tip_hisa")String tip_hisa
            , @RequestParam(value="letnik_izgradnje")String letnik_izgradnje,@RequestParam(value="letnik_prenove")String letnik_prenove,
            @RequestParam(value="garaza")String garaza,@RequestParam(value="range3")String range3,
            @RequestParam(value="range4")String range4, @RequestParam(value="range5")String range5) {
        model.addAttribute("message");
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
        String [] cena=range3.split(";");
        String [] skupnaKvadratura=range4.split(";");
        String [] kvadraturaBivalnegaProstora=range5.split(";");
        List<Nepremicnina> list=nepremicninaDao.iskanjeHisa(zac,konc,tip_hisa,letnik_izgradnje,letnik_prenove,garaza,cena,skupnaKvadratura,kvadraturaBivalnegaProstora);
        red.addFlashAttribute("seznamIskanja",list);
        return "redirect:/iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/iskanjePosest" }, method = RequestMethod.GET)
    public String iskanjePosest(RedirectAttributes red, Model model, @RequestParam(value="select_pokrajina")int regija, @RequestParam(value="select_tip_posesti")String tip_posesti
            , @RequestParam(value="range6")String range6, @RequestParam(value="range7")String range7) {
        model.addAttribute("message");
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
        String [] cena=range6.split(";");
        String [] skupnaKvadratura=range7.split(";");
        List<Nepremicnina> list=nepremicninaDao.iskanjePosest(zac,konc,tip_posesti,cena,skupnaKvadratura);
        red.addFlashAttribute("seznamIskanja",list);
        return "redirect:/iskanjeNepremicnin";
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


