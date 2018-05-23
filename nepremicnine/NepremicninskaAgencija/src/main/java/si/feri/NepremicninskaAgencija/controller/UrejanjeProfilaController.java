package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.NepremicninskaAgencija.models.Agent;
import si.feri.NepremicninskaAgencija.repositories.AgentDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UrejanjeProfilaController {

    @Autowired
    AgentDao agentDao;

    @RequestMapping(value = {"/urejanjeProfila" }, method = RequestMethod.GET)
    public String urejanjeProfila(Model model) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary

        Object i= (session.getAttribute("trenutniUporabnik"));
        int id=Integer.parseInt(i.toString());

        model.addAttribute("idUporabnika",id);
         model.addAttribute("imeUporabnika",agentDao.getIme(id));
         model.addAttribute("priimekUporabnika",agentDao.getPriimek(id));
         model.addAttribute("mailUporabnika",agentDao.getEmail(id));
         model.addAttribute("telUporabnika",agentDao.getTelefon(id));
        return "urejanjeProfila";
    }

    @RequestMapping(value = {"/posodobiProfil" }, method = RequestMethod.POST)
    public String posodobiProfil(Model model, @RequestParam(value="novoIme",required=true)String ime, @RequestParam(value="novPriimek",required=true)String priimek,
     @RequestParam(value="novMail",required=true)String mail, @RequestParam(value="telefonskaStevilka",required=true)String tel) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary
        Object i= (session.getAttribute("trenutniUporabnik"));
        int id=Integer.parseInt(i.toString());

        if(agentDao.obstaja(mail)&& !agentDao.getEmail(id).equals(mail)){
            model.addAttribute("uspesnoProfil", false);
           return "redirect:/urejanjeProfila";    //ne spremeni maila, saj ta mail ze obstaja
       }
        agentDao.posodobiProfil(ime,priimek,mail,tel);
        model.addAttribute("uspesnoProfil", true);
        return "redirect:/urejanjeProfila";
    }

    @RequestMapping(value = {"/posodobiGeslo" }, method = RequestMethod.POST)
    public String posodobiGeslo(Model model, @RequestParam(value="staroGesloSpremeni",required=true)String staroG, @RequestParam(value="novoGesloSpremeni",required=true)String novoG) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary
        Object i= (session.getAttribute("trenutniUporabnik"));
        int id=Integer.parseInt(i.toString());

        if(!staroG.equals(agentDao.getGeslo(id))){
            model.addAttribute("uspesnoGeslo", false);
            return "redirect:/urejanjeProfila";
        }

        agentDao.posodobiGeslo(novoG,id);
        model.addAttribute("uspesnoGeslo", true);
        return "redirect:/urejanjeProfila";
    }
    @RequestMapping(value = {"/zbrisiRacun" }, method = RequestMethod.POST)
    public String zbrisiRacun(Model model) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary
        Object i= (session.getAttribute("trenutniUporabnik"));
        int id=Integer.parseInt(i.toString());

        agentDao.zbrisiRacun(id);
        session.removeAttribute("trenutniUporabnik");
        return "redirect:/registracija";
    }
}
