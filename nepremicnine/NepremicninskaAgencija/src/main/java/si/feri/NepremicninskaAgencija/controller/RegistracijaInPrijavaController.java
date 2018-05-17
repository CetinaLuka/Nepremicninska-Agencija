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

    @RequestMapping(value = {"/Registracija" }, method = RequestMethod.POST)
    public String registracija (Model model,  @RequestParam(value="email",required=true)String email, @RequestParam(value="ime",required=true)String ime,
    @RequestParam(value="priimek",required=true)String priimek,  @RequestParam(value="geslo",required=true)String geslo) {

        agentDao.addAgent(ime,priimek,email,geslo);
        return "registracija";
    }






}

