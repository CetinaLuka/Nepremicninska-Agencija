package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.NepremicninskaAgencija.Email.EmailService;
import si.feri.NepremicninskaAgencija.Email.Mail;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.models.Slika;
import si.feri.NepremicninskaAgencija.repositories.AgentDao;
import si.feri.NepremicninskaAgencija.repositories.NepremicninaDao;
import si.feri.NepremicninskaAgencija.repositories.SlikaDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
public class MailController {

    @Autowired
    private EmailService emailService;


    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    SlikaDao slikaDao;
    @Autowired
    AgentDao agentDao;


    @RequestMapping(value={"/prikazNepremicnine/emailPoslji"}, method=RequestMethod.POST)
    public String osebeStran(@RequestParam(value = "email")String email,
                             @RequestParam(value = "nepremicnina")String nep){
        int nepe =Integer.parseInt(nep);
        Nepremicnina nepremicnina = nepremicninaDao.vrniNepremicnino(nepe);
        List<Slika> slike = slikaDao.vrniSlike(nepe);
            try {
                Mail mail = new Mail();
                mail.setFrom("agencija.praktikum@gmail.com");
                mail.setTo(email);
                mail.setSubject("Nepremičnine");
                mail.setNepremicnina(nepremicnina);
                mail.setSlike(slike);
                emailService.sendSimpleMessage(mail,nepremicnina,slike);
            }catch (Exception e){
                e.printStackTrace();
            }

        return "redirect:/prikazNepremicnine/"+nepe;
    }


    @RequestMapping(value={"/pozabljenoGeslo"}, method=RequestMethod.POST)
    public String pozabljenoGeslo(@RequestParam(value = "emailer")String email,
                                  Model model){
        if(agentDao.obstaja(email)){
            model.addAttribute("emailObstaja",true);
            int id;
            id=agentDao.getId(email);
            String ime = agentDao.getIme(id);
            Random random = new Random();
            String geslo="";
            char ch;

            for (int i =0;i<8;i++) {
                ch=((char)(random.nextInt(74)+48));
                geslo+=ch;
            }
            try {
                Mail mail = new Mail();
                mail.setFrom("agencija.praktikum@gmail.com");
                mail.setTo(email);
                mail.setSubject("PozabljenoGeslo");
                System.out.println(email);
                Map mod = new HashMap();
                mod.put("ime",ime);
                mod.put("geslo",geslo);
                mail.setModel(mod);
                emailService.sendSimpleMessage(mail);
                agentDao.posodobiGeslo(geslo,id);

            }catch (Exception e){
                e.printStackTrace();
            }
        }else{
            model.addAttribute("emailNeObstaja",true);

        }
        return "prijava";
    }
}
