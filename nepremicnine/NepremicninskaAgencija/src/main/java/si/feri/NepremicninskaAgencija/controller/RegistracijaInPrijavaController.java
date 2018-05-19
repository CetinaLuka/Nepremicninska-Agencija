package si.feri.NepremicninskaAgencija.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.repositories.AgentDao;
import si.feri.NepremicninskaAgencija.repositories.KrajDao;
import si.feri.NepremicninskaAgencija.repositories.NaslovDao;
import si.feri.NepremicninskaAgencija.repositories.NepremicninaDao;
import si.feri.NepremicninskaAgencija.models.Agent;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


@Controller
public class RegistracijaInPrijavaController {

    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    AgentDao agentDao;


    @RequestMapping(value = {"/prijava" }, method = RequestMethod.GET)
    public String prijva(Model model) {
        return "prijava";
    }

    @RequestMapping(value = {"/registracija" }, method = RequestMethod.GET)
    public String registracija (Model model) {
        return "registracija";
    }

    @RequestMapping(value = {"/kontrolnaPloscaReg" }, method = RequestMethod.POST)
    public String registracija (Model model,  @RequestParam(value="email",required=true)String email, @RequestParam(value="ime",required=true)String ime,
    @RequestParam(value="priimek",required=true)String priimek,  @RequestParam(value="geslo",required=true)String geslo,
    @RequestParam(value="varnostnaKoda",required=true)String varnostnaKoda) {
        if(agentDao.obstaja(email)){
            model.addAttribute("agentObstaja",true);
            return "redirect:/registracija";
        }
        if(!varnostnaKoda.equals("123")){
            model.addAttribute("pravilnaKoda",false);
            return "redirect:/registracija";
        }
        agentDao.addAgent(ime,priimek,email,geslo);
        return "redirect:/kontrolnaPlosca";
    }

    @RequestMapping(value = {"/kontrolnaPloscaPr" }, method = RequestMethod.POST)
    public String prijava (Model model,  @RequestParam(value="email",required=true)String email, @RequestParam(value="geslo",required=true)String geslo) {
        if(!agentDao.obstaja(email)){
            model.addAttribute("agentObstaja",false);
            return "redirect:/prijava";
        }
        if(!agentDao.pravilnoGeslo(email,geslo)){
            model.addAttribute("gesloPravilno",false);
            return "redirect:/prijava";
        }
        return "redirect:/kontrolnaPlosca";
    }






}

