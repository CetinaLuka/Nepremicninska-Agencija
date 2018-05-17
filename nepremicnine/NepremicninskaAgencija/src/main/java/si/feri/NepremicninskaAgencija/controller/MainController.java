package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import si.feri.NepremicninskaAgencija.repositories.KrajDao;

@Controller
public class MainController {
    KrajDao at = new KrajDao();
    @Autowired
    KrajDao t;

    // inject via application.properties
    @Value("${welcome.message}")
    private String message = "Hello World";


    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("message", this.message);
        t.addKraj("mb", 2394);
        return "index";
    }
}
