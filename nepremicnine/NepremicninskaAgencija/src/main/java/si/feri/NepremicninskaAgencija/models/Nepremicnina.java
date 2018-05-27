package si.feri.NepremicninskaAgencija.models;

import java.sql.Timestamp;
import java.util.Date;

public class Nepremicnina{

    int id;
    double cena;
    double kvadraturaBivalnegaProstora;
    double skupnaKvadratura;
    int steviloSob;
    int nadstropje;
    int letoIzgradnje;
    int letoPrenove;
    boolean garaza;
    boolean balkon;
    String opis;
    String vrstaHise;
    String vrstaPosesti;
    boolean prodano;
    Date datumObjave;

    int tk_id_agent;
    int tk_id_naslov;
    int tk_id_vrstaNepremicnine;

    public Nepremicnina() {
    }

    public Nepremicnina(int id, double cena, double kvadraturaBivalnegaProstora, double skupnaKvadratura, int steviloSob, int nadstropje, int letoIzgradnje, int letoPrenove, boolean garaza, boolean balkon, String opis, String vrstaHise, String vrstaPosesti, boolean prodano, Date datumObjave, int tk_id_vrstaNepremicnine, int tk_id_agent, int tk_id_naslov) {
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getCena() {
        return cena;
    }

    public void setCena(double cena) {
        this.cena = cena;
    }

    public double getKvadraturaBivalnegaProstora() {
        return kvadraturaBivalnegaProstora;
    }

    public void setKvadraturaBivalnegaProstora(double kvadraturaBivalnegaProstora) {
        this.kvadraturaBivalnegaProstora = kvadraturaBivalnegaProstora;
    }

    public double getSkupnaKvadratura() {
        return skupnaKvadratura;
    }

    public void setSkupnaKvadratura(double skupnaKvadratura) {
        this.skupnaKvadratura = skupnaKvadratura;
    }

    public int getSteviloSob() {
        return steviloSob;
    }

    public void setSteviloSob(int steviloSob) {
        this.steviloSob = steviloSob;
    }

    public int getNadstropje() {
        return nadstropje;
    }

    public void setNadstropje(int nadstropje) {
        this.nadstropje = nadstropje;
    }

    public int getLetoIzgradnje() {
        return letoIzgradnje;
    }

    public void setLetoIzgradnje(int letoIzgradnje) {
        this.letoIzgradnje = letoIzgradnje;
    }

    public int getLetoPrenove() {
        return letoPrenove;
    }

    public void setLetoPrenove(int letoPrenove) {
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

    public int getTk_id_agent() {
        return tk_id_agent;
    }

    public void setTk_id_agent(int tk_id_agent) {
        this.tk_id_agent = tk_id_agent;
    }

    public int getTk_id_naslov() {
        return tk_id_naslov;
    }

    public void setTk_id_naslov(int tk_id_naslov) {
        this.tk_id_naslov = tk_id_naslov;
    }

    public int getTk_id_vrstaNepremicnine() {
        return tk_id_vrstaNepremicnine;
    }

    public void setTk_id_vrstaNepremicnine(int tk_id_vrstaNepremicnine) {
        this.tk_id_vrstaNepremicnine = tk_id_vrstaNepremicnine;
    }
}