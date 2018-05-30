package si.feri.NepremicninskaAgencija.models;

public class Podatki {
    public int getTk_id_vrstaNepremicnine() {
        return tk_id_vrstaNepremicnine;
    }

    public void setTk_id_vrstaNepremicnine(int tk_id_vrstaNepremicnine) {
        this.tk_id_vrstaNepremicnine = tk_id_vrstaNepremicnine;
    }

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

    int tk_id_vrstaNepremicnine;
    String ulica;
    String hisnaSt;
    String imeKraja;

    public Podatki(int tk_id_vrstaNepremicnine, String ulica, String hisnaSt,String imeKraja){
        this.hisnaSt=hisnaSt;
        this.imeKraja=imeKraja;
        this.tk_id_vrstaNepremicnine=tk_id_vrstaNepremicnine;
        this.ulica=ulica;
    }

}
