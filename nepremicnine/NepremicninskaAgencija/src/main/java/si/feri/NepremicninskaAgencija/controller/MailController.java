package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.Email.EmailService;
import si.feri.NepremicninskaAgencija.Email.Mail;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.models.Slika;
import si.feri.NepremicninskaAgencija.repositories.NepremicninaDao;
import si.feri.NepremicninskaAgencija.repositories.SlikaDao;

import java.util.List;

@Controller
public class MailController {

    @Autowired
    private EmailService emailService;


    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    SlikaDao slikaDao;


    @RequestMapping(value={"/email"}, method=RequestMethod.GET)
    public String osebeStran(@RequestParam(value = "email",required = false)String email) {
        int id = 1;
        Nepremicnina nepremicnina = nepremicninaDao.vrniNepremicnino(id);
        List<Slika> slike = slikaDao.vrniSlike(1);
            try {
                Mail mail = new Mail();
                mail.setFrom("agencija.praktikum@gmail.com");
                mail.setTo(email);
                mail.setSubject("Nepremičnine");
                mail.setNepremicnina(nepremicnina);
                mail.setSlike(slike);
                emailService.sendSimpleMessage(mail);

            }catch (Exception e){
                e.printStackTrace();
            }

        return "index";
    }



}
