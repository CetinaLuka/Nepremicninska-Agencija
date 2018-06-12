package si.feri.NepremicninskaAgencija.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import si.feri.NepremicninskaAgencija.repositories.AgentDao;
import si.feri.NepremicninskaAgencija.repositories.NepremicninaDao;
import si.feri.NepremicninskaAgencija.repositories.SlikaDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class RegistracijaInPrijavaController {

    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    AgentDao agentDao;
    @Autowired
    SlikaDao slikaDao;


    @RequestMapping(value = {"/prijava" }, method = RequestMethod.GET)
    public String prijava(Model model) {
            model.addAttribute("jePrijavljen", false);
        return "prijava";
    }

    @RequestMapping(value = {"/registracija" }, method = RequestMethod.GET)
    public String registracija (Model model) {
        model.addAttribute("jePrijavljen", false);
        return "registracija";
    }

    //REGISTRACIJA
    @RequestMapping(value = {"/kontrolnaPloscaReg" }, method = RequestMethod.POST)
    public String registracija (RedirectAttributes red, Model model,  @RequestParam(value="email",required=true)String email, @RequestParam(value="ime",required=true)String ime,
    @RequestParam(value="priimek",required=true)String priimek,  @RequestParam(value="geslo",required=true)String geslo,
    @RequestParam(value="varnostnaKoda",required=true)String varnostnaKoda){
        if(agentDao.obstaja(email)){
            red.addFlashAttribute("neuspesnaRegistracija",true);
            return "redirect:/registracija";
        }
        if(!varnostnaKoda.equals("123")){
            red.addFlashAttribute("nepravilnaKoda",true);
            return "redirect:/registracija";
        }
        agentDao.addAgent(ime,priimek,email,geslo);

        int id=agentDao.getId(email);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary

        session.setAttribute("trenutniUporabnik", id);
        model.addAttribute("profilnaSlika", "../img/privzetaProfilna.png");
        return "redirect:/kontrolnaPlosca";
    }
    //prijava
    @RequestMapping(value = {"/kontrolnaPloscaPr" }, method = RequestMethod.POST)
    public String prijava (RedirectAttributes red, Model model, @RequestParam(value="email",required=true)String email, @RequestParam(value="geslo",required=true)String geslo) {
        if(!agentDao.obstaja(email) || !agentDao.pravilnoGeslo(email,geslo)){
            red.addFlashAttribute("prijavaNeuspesna",true);
            return "redirect:/prijava";
        }
        int id=agentDao.getId(email);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary

        session.setAttribute("trenutniUporabnik", id);
        if(slikaDao.obstajaSlikaAgenta(id)){
            red.addFlashAttribute("profilnaSlika","data:image/jpeg;base64,"+slikaDao.vrniSlikoAgenta(id).getURLSlike());
        }
        else{
            red.addFlashAttribute("profilnaSlika","../img/privzetaProfilna.png");
        }

        return "redirect:/kontrolnaPlosca";
    }

    @RequestMapping(value = {"/odjava" }, method = RequestMethod.GET)
    public String odjava(Model model, RedirectAttributes red) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary

        red.addFlashAttribute("jePrijavljen", false);
        model.addAttribute("jePrijavljen", false);
        session.removeAttribute("trenutniUporabnik");
        return "redirect:/index";
    }

}

