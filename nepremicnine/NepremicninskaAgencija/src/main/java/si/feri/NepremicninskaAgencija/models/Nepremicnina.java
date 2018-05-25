package si.feri.NepremicninskaAgencija.models;

import java.util.Date;

public class Nepremicnina{

    Integer id;
    Double cena;
    Double kvadraturaBivalnegaProstora;
    Double skupnaKvadratura;
    Integer steviloSob;
    Integer nadstropje;
    Integer letoIzgradnje;
    Integer letoPrenove;
    boolean garaza;
    boolean balkon;
    String opis;
    String vrstaHise;
    String vrstaPosesti;
    boolean prodano;
    Date datumObjave;

    Integer tk_id_agent;
    Integer tk_id_naslov;
    Integer tk_id_vrstaNepremicnine;

    public Nepremicnina() {
    }

    public Nepremicnina(Integer id, Double cena, Double kvadraturaBivalnegaProstora, Double skupnaKvadratura, Integer steviloSob, Integer nadstropje, Integer letoIzgradnje, Integer letoPrenove, boolean garaza, boolean balkon, String opis, String vrstaHise, String vrstaPosesti, boolean prodano, Date datumObjave, Integer tk_id_vrstaNepremicnine, Integer tk_id_agent, Integer tk_id_naslov) {
        this.id = id;
        this.cena = cena;
        this.kvadraturaBivalnegaProstora = kvadraturaBivalnegaProstora;
        this.skupnaKvadratura = skupnaKvadratura;
        this.steviloSob = steviloSob;
        this.nadstropje = nadstropje;
        this.letoIzgradnje = letoIzgradnje;
        this.letoPrenove = letoPrenove;
        this.garaza = garaza;
        this.balkon = balkon;
        this.opis = opis;
        this.vrstaHise = vrstaHise;
        this.vrstaPosesti = vrstaPosesti;
        this.prodano = prodano;
        this.datumObjave = datumObjave;
        this.tk_id_vrstaNepremicnine = tk_id_vrstaNepremicnine;
        this.tk_id_agent = tk_id_agent;
        this.tk_id_naslov = tk_id_naslov;
    }

    //KONSTRUKTORJI

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getCena() {
        return cena;
    }

    public void setCena(Double cena) {
        this.cena = cena;
    }

    public Double getKvadraturaBivalnegaProstora() {
        return kvadraturaBivalnegaProstora;
    }

    public void setKvadraturaBivalnegaProstora(Double kvadraturaBivalnegaProstora) {
        this.kvadraturaBivalnegaProstora = kvadraturaBivalnegaProstora;
    }

    public Double getSkupnaKvadratura() {
        return skupnaKvadratura;
    }

    public void setSkupnaKvadratura(Double skupnaKvadratura) {
        this.skupnaKvadratura = skupnaKvadratura;
    }

    public Integer getSteviloSob() {
        return steviloSob;
    }

    public void setSteviloSob(Integer steviloSob) {
        this.steviloSob = steviloSob;
    }

    public Integer getNadstropje() {
        return nadstropje;
    }

    public void setNadstropje(Integer nadstropje) {
        this.nadstropje = nadstropje;
    }

    public Integer getLetoIzgradnje() {
        return letoIzgradnje;
    }

    public void setLetoIzgradnje(Integer letoIzgradnje) {
        this.letoIzgradnje = letoIzgradnje;
    }

    public Integer getLetoPrenove() {
        return letoPrenove;
    }

    public void setLetoPrenove(Integer letoPrenove) {
        this.letoPrenove = letoPrenove;
    }

    public boolean isGaraza() {
        return garaza;
    }

    public void setGaraza(boolean garaza) {
        this.garaza = garaza;
    }

    public boolean isBalkon() {
        return balkon;
    }

    public void setBalkon(boolean balkon) {
        this.balkon = balkon;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getVrstaHise() {
        return vrstaHise;
    }

    public void setVrstaHise(String vrstaHise) {
        this.vrstaHise = vrstaHise;
    }

    public String getVrstaPosesti() {
        return vrstaPosesti;
    }

    public void setVrstaPosesti(String vrstaPosesti) {
        this.vrstaPosesti = vrstaPosesti;
    }

    public boolean isProdano() {
        return prodano;
    }

    public void setProdano(boolean prodano) {
        this.prodano = prodano;
    }

    public Date getDatumObjave() {
        return datumObjave;
    }

    public void setDatumObjave(Date datumObjave) {
        this.datumObjave = datumObjave;
    }

    public Integer getTk_id_agent() {
        return tk_id_agent;
    }

    public void setTk_id_agent(Integer tk_id_agent) {
        this.tk_id_agent = tk_id_agent;
    }

    public Integer getTk_id_naslov() {
        return tk_id_naslov;
    }

    public void setTk_id_naslov(Integer tk_id_naslov) {
        this.tk_id_naslov = tk_id_naslov;
    }

    public Integer getTk_id_vrstaNepremicnine() {
        return tk_id_vrstaNepremicnine;
    }

    public void setTk_id_vrstaNepremicnine(Integer tk_id_vrstaNepremicnine) {
        this.tk_id_vrstaNepremicnine = tk_id_vrstaNepremicnine;
    }
}