package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.repositories.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
        model.addAttribute("seznamSlik",slikaDao.vrniSlikoNepremicnine());
        model.addAttribute("podatki", naslovDao.vrniPodatke());
        return "index";
    }
    @RequestMapping(value = {"/urejanjeNepremicnineKontrolna" }, method = RequestMethod.GET, params = {"id"})
    public String urejanjeNepremicnineKontrolna(@RequestParam( value = "id") int id,
                                                HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(true);
        Nepremicnina nepremicnina = nepremicninaDao.vrniNepremicnino(id);
        model.addAttribute("nepremicninaModal",nepremicnina);
        return "kontrolnaPlosca";
    }
    @RequestMapping(value = { "/iskanjeNepremicninPoRegiji" }, method = RequestMethod.GET)
    public String iskanjeNepremicninPoRegiji(HttpServletRequest request, RedirectAttributes red, Model model,@RequestParam(value="regija")int regija) {
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
        HttpSession session = request.getSession(true);
        List<Nepremicnina> result=nepremicninaDao.iskanjePoRegiji(zac,konc);
        result=new ArrayList<Nepremicnina>(result);
        session.setAttribute("rezultati",result);
        red.addFlashAttribute("seznamIskanja",result);
        session.setAttribute("sortZgrajeno",0);
        session.setAttribute("sortKvadratura",0);
        session.setAttribute("sortDodano",0);
        session.setAttribute("sortCena",0);
        return "redirect:/iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/prikazNepremicnine/{nepremicninaId}" }, method = RequestMethod.GET)
    public String prikazNepremicnine(Model model,HttpServletRequest request, @PathVariable("nepremicninaId") int nepremicninaId) {
        model.addAttribute("message");
        model.addAttribute("nepremicnina", nepremicninaDao.vrniNepremicnino(nepremicninaId));
        model.addAttribute("id", nepremicninaId);
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
        if(session.getAttribute("trenutniUporabnik")==null)
            return "redirect:/prijava";
        if(session.getAttribute("trenutniUporabnik") == null){
            model.addAttribute("jePrijavljen", false);
        }
        else{
            model.addAttribute("jePrijavljen", true);
        }
        return "dodajanjeNepremicnin";
    }


    @RequestMapping(value = {"/isciGumb" }, method = RequestMethod.GET)
    public String isciGumb(RedirectAttributes red, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        List<Nepremicnina> list=nepremicninaDao.vrniVse();
        red.addFlashAttribute("seznamIskanja",list);
        session.setAttribute("rezultati",list);
        session.setAttribute("sortZgrajeno",0);
        session.setAttribute("sortKvadratura",0);
        session.setAttribute("sortDodano",0);
        session.setAttribute("sortCena",0);
        return "redirect:/iskanjeNepremicnin";
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
        model.addAttribute("seznamSlik",slikaDao.vrniSlikoNepremicnine());
        session.setAttribute("sortZgrajeno",0);
        session.setAttribute("sortKvadratura",0);
        session.setAttribute("sortDodano",0);
        session.setAttribute("sortCena",0);
        return "iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/iskanjeStanovanje" }, method = RequestMethod.GET)
    public String iskanjeStanovanje(HttpServletRequest request, RedirectAttributes red, Model model,
                                    @RequestParam(value="select_pokrajina")int regija,
                                    @RequestParam(value="letnik_izgradnje",required = false)String letnik_izgradnje,
                                    @RequestParam(value="letnik_prenove",required = false)String letnik_prenove,
                                    @RequestParam(value="stevilo_sob",required = false)String stevilo_sob,
                                    @RequestParam(value="garaza",required = false)String garaza,
                                    @RequestParam(value="balkon",required = false)String balkon,
                                    @RequestParam(value="range1")String range1,
                                    @RequestParam(value="range2")String range2) {
        model.addAttribute("message");
        if(letnik_izgradnje==null){
            letnik_izgradnje="-1";
        }
        if(letnik_prenove==null){
            letnik_prenove="-1";
        }
        if(stevilo_sob==null){
            stevilo_sob="steviloSob";
        }
        if(garaza==null){
            garaza="0";
        }
        if(balkon==null){
            balkon="0";
        }
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
        HttpSession session = request.getSession(true);
        session.setAttribute("rezultati",list);
        session.setAttribute("sortZgrajeno",0);
        session.setAttribute("sortKvadratura",0);
        session.setAttribute("sortDodano",0);
        session.setAttribute("sortCena",0);
        return "redirect:/iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/iskanjeHisa" }, method = RequestMethod.GET)
    public String iskanjeHisa(HttpServletRequest request, RedirectAttributes red,
                              Model model,
                              @RequestParam(value="select_pokrajina")int regija,
                              @RequestParam(value="select_tip_hisa")String tip_hisa,
                              @RequestParam(value="letnik_izgradnje",required = false)String letnik_izgradnje,
                              @RequestParam(value="letnik_prenove",required = false)String letnik_prenove,
                              @RequestParam(value="garaza",required = false)String garaza,
                              @RequestParam(value="range3")String range3,
                              @RequestParam(value="range4")String range4,
                              @RequestParam(value="range5")String range5) {
        model.addAttribute("message");
        if(letnik_izgradnje==null){
            letnik_izgradnje="-1";
        }
        if(letnik_prenove==null){
            letnik_prenove="-1";
        }
        if(garaza==null){
            garaza="0";
        }
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
        HttpSession session = request.getSession(true);
        session.setAttribute("sortZgrajeno",0);
        session.setAttribute("sortKvadratura",0);
        session.setAttribute("sortDodano",0);
        session.setAttribute("sortCena",0);
        return "redirect:/iskanjeNepremicnin";
    }

    @RequestMapping(value = {"/iskanjePosest" }, method = RequestMethod.GET)
    public String iskanjePosest(HttpServletRequest request,
                                RedirectAttributes red,
                                Model model,
                                @RequestParam(value="select_pokrajina")int regija,
                                @RequestParam(value="select_tip_posesti")String tip_posesti,
                                @RequestParam(value="range6")String range6,
                                @RequestParam(value="range7")String range7) {
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
        HttpSession session = request.getSession(true);
        session.setAttribute("sortZgrajeno",0);
        session.setAttribute("sortKvadratura",0);
        session.setAttribute("sortDodano",0);
        session.setAttribute("sortCena",0);
        return "redirect:/iskanjeNepremicnin";
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
            model.addAttribute("zasluzek", (nepremicninaDao.skupnaCenaNepremicnin(tk_agent) * 0.2));
            model.addAttribute("jePrijavljen", true);
            model.addAttribute("seznamSlik",slikaDao.vrniSlikoNepremicnine());
            return "kontrolnaPlosca";
        }
    }

    @RequestMapping(value = {"/zbrisiNepremicnino" }, method = RequestMethod.DELETE, params = {"idZaIzbris"})
    @ResponseBody
       public Boolean zbrisiNepremicnino(@RequestParam( value = "idZaIzbris") Integer idZaIzbris, HttpServletRequest request) {
               nepremicninaDao.zbrisiNepremicnino(idZaIzbris);
               return true;
    }

    @RequestMapping(value = {"/urediHiso" }, method = RequestMethod.POST)
    @ResponseBody
    public Nepremicnina urediHiso(RedirectAttributes red, Model model, HttpServletRequest request,
                            @RequestParam(value="idNepremicnina")int idNepremicnina,
                            @RequestParam(value="naslov")String naslov,
                            @RequestParam(value="kraj")String kraj,
                            @RequestParam(value="postna_st")String postna_st,
                            @RequestParam(value="hisna_st")String hisnaSt,
                            @RequestParam(value="kvadratura")String kvadraturaBivalnegaProstora,
                            @RequestParam(value="letnik_izgradnje")String letoIzgradnje,
                            @RequestParam(value="cena")String cena,
                            @RequestParam(value="velikost_zemljisca")String skupnaKvadratura,
                            @RequestParam(value="vrsta_hise")String vrstaHise,
                            @RequestParam(value="dodaten_opis",required = false)String opis,
                            @RequestParam(value="letnik_prenove",required = false)String letoPrenove,
                            @RequestParam(value="garaza",required = false)String garaza,
                            @RequestParam(value="prodano2",required=false)String prodano) {
        if(prodano==null){
            prodano="0";
        }
        else {
            prodano="1";
        }
        if(garaza==null){
            garaza="0";
        }
        else {
            garaza="1";
        }
        Double c=Double.parseDouble(cena);

        List<Integer> ceObstajaKraj=krajDao.vrniID(kraj,postna_st);
        if(ceObstajaKraj.size()==0){
            krajDao.addKraj(kraj,postna_st);
        }
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        List<Integer> ceObstajaNaslov=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        if(ceObstajaNaslov.size()==0){
            naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        }
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }
        nepremicninaDao.urediHiso( idNepremicnina,  tk_naslov,  kvadraturaBivalnegaProstora,  skupnaKvadratura,  letoIzgradnje,  cena,  vrstaHise,  letoPrenove,  garaza,  opis,  prodano);
        boolean prodanoBool = false;
        if(prodano == "1"){
            prodanoBool = true;
        }
        boolean garazaBool = false;
        if(garaza == "1"){
            garazaBool = true;
        }
        return new Nepremicnina(idNepremicnina, Double.parseDouble(cena), Double.parseDouble(kvadraturaBivalnegaProstora),Double.parseDouble(skupnaKvadratura),null,null, Integer.parseInt(letoIzgradnje), Integer.parseInt(letoPrenove), garazaBool, null, opis, vrstaHise, null, prodanoBool, null, null, null, null,naslov,kraj,hisnaSt,Integer.parseInt(postna_st));
    }
    @RequestMapping(value = {"/urediStanovanje" }, method = RequestMethod.POST)
    @ResponseBody
    public Nepremicnina urediStanovanje(RedirectAttributes red, Model model, HttpServletRequest request,
                                  @RequestParam(value="idNepremicnina")int idNepremicnina,
                                  @RequestParam(value="naslov")String naslov,
                                  @RequestParam(value="kraj")String kraj,
                                  @RequestParam(value="postna_st")String postna_st,
                                  @RequestParam(value="hisna_st")String hisnaSt,
                                  @RequestParam(value="kvadratura")String skupnaKvadratura,
                                  @RequestParam(value="stevilo_sob")String steviloSob,
                                  @RequestParam(value="letnik_izgradnje")String letoIzgradnje,
                                  @RequestParam(value="nadstropje")String nadstropje,
                                  @RequestParam(value="cena")String cena,
                                  @RequestParam(value="balkon",required=false)String balkon, // opcijsko za balkon
                                  @RequestParam(value="garaza",required=false)String garaza, //opcijsko za garažo
                                  @RequestParam(value="letnik_prenove",required=false)String letoPrenove, // letnik prenove, opcijski parameter
                                  @RequestParam(value="dodaten_opis",required=false)String opis,
                                  @RequestParam(value="prodano1",required=false)String prodano) {
        if(prodano==null){
            prodano="0";
        }
        else {
            prodano="1";
        }
        if(balkon==null){
            balkon="0";
        }
        else {
            balkon="1";
        }
        if(garaza==null){
            garaza="0";
        }
        else {
            garaza="1";
        }
        List<Integer> ceObstajaKraj=krajDao.vrniID(kraj,postna_st);
        if(ceObstajaKraj.size()==0){
            krajDao.addKraj(kraj,postna_st);
        }
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        List<Integer> ceObstajaNaslov=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        if(ceObstajaNaslov.size()==0){
            naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        }
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }
        Double c=Double.parseDouble(cena);
        nepremicninaDao.urediStanovanje( idNepremicnina, tk_naslov,skupnaKvadratura,letoIzgradnje,steviloSob,  nadstropje,  cena,  letoPrenove,  garaza,  balkon,   opis,  prodano);
          boolean prodanoBool = false;
        if(prodano == "1"){
            prodanoBool = true;
        }
        boolean garazaBool = false;
        if(garaza == "1"){
            garazaBool = true;
        }
        boolean balkonBool=false;
        if(balkon=="1"){
            balkonBool=true;
        }
        return new Nepremicnina(idNepremicnina, Double.parseDouble(cena),null,Double.parseDouble(skupnaKvadratura),Integer.parseInt(steviloSob), Integer.parseInt(nadstropje), Integer.parseInt(letoIzgradnje), Integer.parseInt(letoPrenove), garazaBool, balkonBool, opis, null, null, prodanoBool, null, null, null, null,naslov,kraj,hisnaSt,Integer.parseInt(postna_st));

    }
    @RequestMapping(value = {"/urediPosest" }, method = RequestMethod.POST)
    @ResponseBody
    public Nepremicnina urediPosest(RedirectAttributes red, Model model, HttpServletRequest request,
                              @RequestParam(value="idNepremicnina")int idNepremicnina,
                              @RequestParam(value="naslov")String naslov,
                              @RequestParam(value="kraj")String kraj,
                              @RequestParam(value="postna_st")String postna_st,
                              @RequestParam(value="hisna_st")String hisnaSt,
                              @RequestParam(value="cena")String cena,
                              @RequestParam(value="velikost_zemljisca")String skupnaKvadratura,
                              @RequestParam(value="vrsta_posesti")String tipPosesti,
                              @RequestParam(value="dodaten_opis",required = false)String opis,
                              @RequestParam(value="prodano3",required=false)String prodano) {

        List<Integer> ceObstajaKraj=krajDao.vrniID(kraj,postna_st);
        if(ceObstajaKraj.size()==0){
            krajDao.addKraj(kraj,postna_st);
        }
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        List<Integer> ceObstajaNaslov=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        if(ceObstajaNaslov.size()==0){
            naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        }
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }
       if(prodano==null || prodano=="0"){
           prodano="0";
       }
       else {
           prodano="1";
       }
       Double c=Double.parseDouble(cena);
        nepremicninaDao.urediPosest(idNepremicnina, tk_naslov, skupnaKvadratura, c,tipPosesti, opis, prodano);
        boolean prodanoBool = false;
        if(prodano == "1"){
            prodanoBool = true;
        }
        return new Nepremicnina(idNepremicnina, Double.parseDouble(cena),null,Double.parseDouble(skupnaKvadratura),null, null, null, null, null, null, opis, null, tipPosesti, prodanoBool, null, null, null, null,naslov,kraj,hisnaSt,Integer.parseInt(postna_st));
    }
}


