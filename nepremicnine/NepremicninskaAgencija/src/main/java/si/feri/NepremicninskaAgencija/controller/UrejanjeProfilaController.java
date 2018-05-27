package si.feri.NepremicninskaAgencija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import si.feri.NepremicninskaAgencija.models.Agent;
import si.feri.NepremicninskaAgencija.models.FileUploadForm;
import si.feri.NepremicninskaAgencija.repositories.AgentDao;
import si.feri.NepremicninskaAgencija.repositories.SlikaDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UrejanjeProfilaController {

    @Autowired
    AgentDao agentDao;
    @Autowired
    SlikaDao slikaDao;

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
        if(slikaDao.obstajaSlikaAgenta(id)){
            model.addAttribute("profilnaSlika","data:image/jpeg;base64,"+slikaDao.vrniSlikoAgenta(id).getURLSlike());
        }
        else{
            model.addAttribute("profilnaSlika","../img/privzetaProfilna.png");
        }
        return "urejanjeProfila";
    }

    @RequestMapping(value = {"/posodobiProfil" }, method = RequestMethod.POST)
    public String posodobiProfil(RedirectAttributes red, Model model, @RequestParam(value="novoIme",required=true)String ime, @RequestParam(value="novPriimek",required=true)String priimek,
     @RequestParam(value="novMail",required=true)String mail, @RequestParam(value="telefonskaStevilka",required=true)String tel) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary
        Object i= (session.getAttribute("trenutniUporabnik"));
        int id=Integer.parseInt(i.toString());

        if(agentDao.obstaja(mail)&& !agentDao.getEmail(id).equals(mail)){
            red.addFlashAttribute("uspesnoProfil", false);
           return "redirect:/urejanjeProfila";    //ne spremeni maila, saj ta mail ze obstaja
       }
        agentDao.posodobiProfil(ime,priimek,mail,tel);
        red.addFlashAttribute("uspesnoProfil", true);
        return "redirect:/urejanjeProfila";
    }

    @RequestMapping(value = {"/posodobiGeslo" }, method = RequestMethod.POST)
    public String posodobiGeslo(RedirectAttributes red, Model model, @RequestParam(value="staroGesloSpremeni",required=true)String staroG, @RequestParam(value="novoGesloSpremeni",required=true)String novoG) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary
        Object i= (session.getAttribute("trenutniUporabnik"));
        int id=Integer.parseInt(i.toString());

        if(!staroG.equals(agentDao.getGeslo(id))){
            red.addFlashAttribute("uspesnoGeslo", false);
            return "redirect:/urejanjeProfila";
        }

        agentDao.posodobiGeslo(novoG,id);
        red.addFlashAttribute("uspesnoGeslo", true);
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
    @RequestMapping(value = {"/posodobiProfilnoSliko" }, method = RequestMethod.POST)
    public String posodobiProfilnoSliko(Model model, @ModelAttribute("uploadForm") FileUploadForm uploadForm, Model map,
                                        RedirectAttributes red) {
        model.addAttribute("message");

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary
        int id=Integer.parseInt(session.getAttribute("trenutniUporabnik").toString());

        List<MultipartFile> files = uploadForm.getFiles();
        List<String> fileNames = new ArrayList<String>();
        if(null != files && files.size() > 0) {
            for (MultipartFile multipartFile : files) {
                String fileName = multipartFile.getOriginalFilename();
                fileNames.add(fileName);
                if(slikaDao.obstajaSlikaAgenta(id)){
                    slikaDao.saveUpdate(multipartFile, id);
                }else {
                    slikaDao.saveA(multipartFile, id);
                }
            }
        }
        map.addAttribute("files", fileNames);
        return "redirect:/urejanjeProfila";
    }

}
