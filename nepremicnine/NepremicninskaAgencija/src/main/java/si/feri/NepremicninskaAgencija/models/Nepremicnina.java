package si.feri.NepremicninskaAgencija.models;

import java.util.Date;

public class Nepremicnina{

    Integer idNepremicnina;
    Double cena;
    Double kvadraturaBivalnegaProstora;
    Double skupnaKvadratura;
    Integer steviloSob;
    Integer nadstropje;
    Integer letoIzgradnje;
    Integer letoPrenove;
    Boolean garaza;
    Boolean balkon;
    String opis;
    String vrstaHise;
    String tipPosesti;
    Boolean prodano;
    Date datumObjave;

    Integer Agent_idAgent;
    Integer tk_id_naslov;
    Integer tk_id_vrstaNepremicnine;

    public String getUlica() {
        return ulica;
    }

    public void setUlica(String ulica) {
        this.ulica = ulica;
    }

    public String getHisnaSt() {
        return hisnaSt;
    }

    public void setHisnaSt(String hisnaSt) {
        this.hisnaSt = hisnaSt;
    }

    public String getImeKraja() {
        return imeKraja;
    }

    public void setImeKraja(String imeKraja) {
        this.imeKraja = imeKraja;
    }

    String ulica;
    String hisnaSt;
    String imeKraja;

    public Integer getPostnaSt() {
        return postnaSt;
    }

    public void setPostnaSt(Integer postnaSt) {
        this.postnaSt = postnaSt;
    }

    Integer postnaSt;

    public Nepremicnina() {
    }

    public Nepremicnina(Integer id, Double cena, Double kvadraturaBivalnegaProstora, Double skupnaKvadratura, Integer steviloSob, Integer nadstropje, Integer letoIzgradnje, Integer letoPrenove, Boolean garaza, Boolean balkon, String opis, String vrstaHise, String tipPosesti, Boolean prodano, Date datumObjave, Integer tk_id_vrstaNepremicnine, Integer tk_id_agent, Integer tk_id_naslov, String ulica, String kraj, String hisnaSt, Integer postnaSt) {
        this.idNepremicnina = id;
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
        this.tipPosesti = tipPosesti;
        this.prodano = prodano;
        this.datumObjave = datumObjave;
        this.tk_id_vrstaNepremicnine = tk_id_vrstaNepremicnine;
        this.Agent_idAgent = tk_id_agent;
        this.tk_id_naslov = tk_id_naslov;
        this.ulica=ulica;
        this.hisnaSt=hisnaSt;
        this.imeKraja=kraj;
        this.postnaSt=postnaSt;
    }

    //KONSTRUKTORJI

    public Integer getidNepremicnina() {
        return idNepremicnina;
    }

    public void setidNepremicnina(Integer id) {
        this.idNepremicnina = id;
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

    public Boolean isGaraza() {
        return garaza;
    }
    public Boolean getGaraza() {
        return garaza;
    }

    public void setGaraza(Boolean garaza) {
        this.garaza = garaza;
    }

    public Boolean isBalkon() {
        return balkon;
    }
    public Boolean getBalkon() {
        return garaza;
    }

    public void setBalkon(Boolean balkon) {
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

    public String getTipPosesti() {
        return tipPosesti;
    }

    public void setTipPosesti(String tipPosesti) {
        this.tipPosesti = tipPosesti;
    }

    public Boolean isProdano() {
        return prodano;
    }
    public Boolean getProdano() {
        return garaza;
    }

    public void setProdano(Boolean prodano) {
        this.prodano = prodano;
    }

    public Date getDatumObjave() {
        return datumObjave;
    }

    public void setDatumObjave(Date datumObjave) {
        this.datumObjave = datumObjave;
    }

    public Integer getAgent_idAgent() {
        return Agent_idAgent;
    }

    public void setAgent_idAgent(Integer agent_idAgent) {
        this.Agent_idAgent = agent_idAgent;
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

    public Nepremicnina(Integer id, Integer tk_id_vrstaNepremicnine, String ulica,String hisnaSt,String imeKraja, Double cena){
        this.tk_id_vrstaNepremicnine=tk_id_vrstaNepremicnine;
        this.ulica=ulica;
        this.hisnaSt=hisnaSt;
        this.imeKraja=imeKraja;
        this.idNepremicnina=id;
        this.cena=cena;

    }
}