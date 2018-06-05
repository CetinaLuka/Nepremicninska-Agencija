package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.Email.EmailService;
import si.feri.NepremicninskaAgencija.Email.Mail;

@Controller
public class MailController {

    @Autowired
    private EmailService emailService;

    @RequestMapping(value={"/email"}, method=RequestMethod.GET)
    public String osebeStran(@RequestParam(value = "email",required = false)String email) {

            try {
                Mail mail = new Mail();
                mail.setFrom("agencija.praktikum@gmail.com");
                mail.setTo(email);
                mail.setSubject("Nepremičnine");
                emailService.sendSimpleMessage(mail);

            }catch (Exception e){
                e.printStackTrace();
            }



        return "index";
    }



}
