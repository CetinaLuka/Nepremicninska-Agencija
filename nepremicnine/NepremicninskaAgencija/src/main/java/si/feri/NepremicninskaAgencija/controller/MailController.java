package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.Email.EmailService;
import si.feri.NepremicninskaAgencija.Email.Mail;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MailController {

    @Autowired
    private EmailService emailService;

    @RequestMapping(value={"/email"}, method=RequestMethod.GET)
    public String osebeStran(@RequestParam(value = "email",required = false)String email) {

            try {
                Mail mail = new Mail();
                mail.setFrom("no-reply@memorynotfound.com");
                mail.setTo("zankovi998@gmail.com");
                mail.setSubject("Sending Email with Freemarker HTML Template Example");

                Map<String, Object> model = new HashMap<String, Object>();
                model.put("name", "Memorynotfound.com");
                model.put("location", "Belgium");
                model.put("signature", "http://memorynotfound.com");
                mail.setModel(model);

                emailService.sendSimpleMessage(mail);

            }catch (Exception e){
                e.printStackTrace();
            }



        return "index";
    }



}
