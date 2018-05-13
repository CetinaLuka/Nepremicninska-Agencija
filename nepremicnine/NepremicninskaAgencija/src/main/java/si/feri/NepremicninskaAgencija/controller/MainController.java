package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import si.feri.NepremicninskaAgencija.repositories.Agent_test;

@Controller
public class MainController {

    // inject via application.properties
    @Value("${welcome.message}")
    private String message = "Hello World";


    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("message", this.message);
        Agent_test at = new Agent_test();
        try {
            at.readDataBase();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return "index";
    }
}
