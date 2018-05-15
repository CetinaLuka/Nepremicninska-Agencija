package si.feri.NepremicninskaAgencija.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class RegistracijaInPrijavaController {


    @RequestMapping(value = {"/prijava" }, method = RequestMethod.GET)
    public String dodajanjeNepremicnin(Model model) {
        model.addAttribute("message");
        return "prijava";
    }




}

