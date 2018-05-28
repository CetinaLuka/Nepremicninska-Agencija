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
import si.feri.NepremicninskaAgencija.models.FileUploadForm;
import si.feri.NepremicninskaAgencija.repositories.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DodajNepremicninoController {

    @Autowired
    NepremicninaDao nepremicninaDao;
    @Autowired
    KrajDao krajDao;
    @Autowired
    NaslovDao naslovDao;
    @Autowired
    AgentDao agentDao;
    @Autowired
    SlikaDao slikaDao;
    //za dodajanje nepremičnin
    @RequestMapping(value = {"/dodajanjeStanovanja" }, method = RequestMethod.POST)
    public String dodajStanovanje(@RequestParam(value="naslov")String naslov,
                                  @RequestParam(value="kraj")String kraj,
                                  @RequestParam(value="postna_st")String postna_st,
                                  @RequestParam(value="hisna_st")String hisnaSt,
                                  @RequestParam(value="kvadratura")String kvadratura,
                                  @RequestParam(value="stevilo_sob")String stevilo_sob,
                                  @RequestParam(value="letnik_izgradnje")String letnik_izgradnje,
                                  @RequestParam(value="nadstropje")String nadstropje,
                                  @RequestParam(value="cena")String cena,
                                  @RequestParam(value="balkon",required=false)String balkon, // opcijsko za balkon
                                  @RequestParam(value="garaza",required=false)String garaza, //opcijsko za garažo
                                  @RequestParam(value="letnik_prenove",required=false)String letnik_prenove, // letnik prenove, opcijski parameter
                                  @RequestParam(value="dodaten_opis_stanovanja",required=false)String dodaten_opis,
                                  @ModelAttribute("uploadForm") FileUploadForm uploadForm, Model map)  {

        List<Integer> ceObstajaKraj=krajDao.vrniID(kraj,postna_st);
        if(ceObstajaKraj.size()==0){
            krajDao.addKraj(kraj,postna_st);
        }
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        List<Integer> ceObstajaNaslov=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        if(ceObstajaNaslov.size()==0){
            naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        }
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }
        //pridobiva paramter iz seje
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);
        int tk_agent=Integer.parseInt(""+session.getAttribute("trenutniUporabnik"));

        if(balkon==null){
            balkon="0";
        }
        if(garaza==null){
            garaza="0";
        }
        int letoPrenove;
        try{
            letoPrenove=Integer.parseInt(letnik_prenove);
        }
        catch (NumberFormatException e){
            letoPrenove=0;
        }


        nepremicninaDao.addStanovanje(cena, kvadratura, stevilo_sob, letnik_izgradnje, nadstropje, letoPrenove, garaza, // metoda za dodajanje stanovanja
                balkon , dodaten_opis, 0,  tk_naslov, 1, tk_agent);

        int tk_nepremicnina=nepremicninaDao.vrniIDStanovanja(cena, kvadratura, stevilo_sob, letnik_izgradnje, nadstropje,
                letoPrenove, garaza, balkon , dodaten_opis, 0,  tk_naslov, 1, tk_agent).get(0);

        try{
            List<MultipartFile> files = uploadForm.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if(null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName;
                    fileName   = multipartFile.getOriginalFilename();
                    fileNames.add(fileName);
                    slikaDao.save(multipartFile,tk_nepremicnina,tk_agent,fileName);
                }

            }
            map.addAttribute("files", fileNames);

        }catch (NullPointerException e){
            System.out.println("Nobena slika ni bila dodana");
        }

        return "redirect:/dodajanjeNepremicnin";
    }

    @RequestMapping(value = {"/dodajanjeHise" }, method = RequestMethod.POST)
    public String dodajHiso(@RequestParam(value="naslov")String naslov,
                            @RequestParam(value="kraj")String kraj,
                            @RequestParam(value="postna_st")String postna_st,
                            @RequestParam(value="hisna_st")String hisnaSt,
                            @RequestParam(value="kvadratura")String kvadratura,
                            @RequestParam(value="letnik_izgradnje")String letnik_izgradnje,
                            @RequestParam(value="cena")String cena,
                            @RequestParam(value="velikost_zemljisca")String velikost_zemljisca,
                            @RequestParam(value="vrsta_hise")String vrsta_hise,
                            @RequestParam(value="dodaten_opis_hise",required = false)String dodaten_opis,
                            @RequestParam(value="letnik_prenove",required = false)String letnik_prenove,
                            @RequestParam(value="garaza",required = false)String garaza,
                            @ModelAttribute("uploadForm") FileUploadForm uploadForm, Model map) {

        List<Integer> ceObstaja=krajDao.vrniID(kraj,postna_st);
        if(ceObstaja.size()==0){
            krajDao.addKraj(kraj,postna_st);
        }
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        List<Integer> ceObstaja2=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        if(ceObstaja2.size()==0){
            naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        }
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }

        if(garaza==null){
            garaza="0";
        }
        if(letnik_prenove==null || letnik_prenove==""){
            letnik_prenove="0";
        }
        int letoPrenove;
        try{
            letoPrenove=Integer.parseInt(letnik_prenove);
        }
        catch (NumberFormatException e){
            letoPrenove=0;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);
        int tk_agent=Integer.parseInt(""+session.getAttribute("trenutniUporabnik"));


        nepremicninaDao.addHisa(cena, kvadratura, letnik_izgradnje, letoPrenove, garaza, dodaten_opis,
                velikost_zemljisca, vrsta_hise, 0,  tk_naslov, 2, tk_agent);

        int tk_nepremicnina=nepremicninaDao.vrniIDHise(cena, kvadratura, letnik_izgradnje, letoPrenove,
                garaza, dodaten_opis, velikost_zemljisca, vrsta_hise, 0,  tk_naslov, 2, tk_agent).get(0);

        try{
            List<MultipartFile> files = uploadForm.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if(null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName;
                    fileName   = multipartFile.getOriginalFilename();
                    fileNames.add(fileName);
                    slikaDao.save(multipartFile,tk_nepremicnina,tk_agent,fileName);
                }

            }
            map.addAttribute("files", fileNames);

        }catch (NullPointerException e){
            System.out.println("Nobena slika ni bila dodanaa");
        }

        return "redirect:/dodajanjeNepremicnin";
    }

    @RequestMapping(value = {"/dodajanjePosesti" }, method = RequestMethod.POST)
    public String dodajPosest(@RequestParam(value="naslov")String naslov,
                              @RequestParam(value="kraj")String kraj,
                              @RequestParam(value="postna_st")String postna_st,
                              @RequestParam(value="hisna_st")String hisnaSt,
                              @RequestParam(value="cena")String cena,
                              @RequestParam(value="velikost_zemljisca")String velikost_zemljisca,
                              @RequestParam(value="vrsta_posesti")String vrsta_posesti,
                              @RequestParam(value="dodaten_opis_posesti",required = false)String dodaten_opis,
                              @ModelAttribute("uploadForm") FileUploadForm uploadForm, Model map) {

        List<Integer> ceObstaja=krajDao.vrniID(kraj,postna_st);
        if(ceObstaja.size()==0){
            krajDao.addKraj(kraj,postna_st);
        }
        List<Integer> vsiKraji=krajDao.vrniID(kraj,postna_st);
        int tk_kraj=0;
        if(vsiKraji.size()>0) {
            tk_kraj = vsiKraji.get(0);
        }
        List<Integer> ceObstaja2=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        if(ceObstaja2.size()==0){
            naslovDao.addNaslov(naslov,hisnaSt,tk_kraj);
        }
        List<Integer> vsiNaslovi=naslovDao.vrniID(naslov,hisnaSt,tk_kraj);
        int tk_naslov=0;
        if(vsiNaslovi.size()>0) {
            tk_naslov = vsiNaslovi.get(0);
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);
        int tk_agent=Integer.parseInt(""+session.getAttribute("trenutniUporabnik"));
        nepremicninaDao.addPosest(cena, velikost_zemljisca, vrsta_posesti, dodaten_opis, 0,  tk_naslov, 3, tk_agent);
        int tk_nepremicnina=nepremicninaDao.vrniIDPosesti(cena, velikost_zemljisca, vrsta_posesti, dodaten_opis, 0,  tk_naslov, 3, tk_agent).get(0);

        try{
            List<MultipartFile> files = uploadForm.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if(null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName;
                    fileName   = multipartFile.getOriginalFilename();
                    fileNames.add(fileName);
                    slikaDao.save(multipartFile,tk_nepremicnina,tk_agent,fileName);
                }

            }
            map.addAttribute("files", fileNames);

        }catch (NullPointerException e){
            System.out.println("Nobena slika ni bila dodanaa");
        }
        return "redirect:/dodajanjeNepremicnin";
    }

}
