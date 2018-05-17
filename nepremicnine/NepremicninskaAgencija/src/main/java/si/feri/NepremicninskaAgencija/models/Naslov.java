package si.feri.NepremicninskaAgencija.models;

public class Naslov{

    int id;
    String ulica;
    String hisnaSt;
    int tk_id_kraj;

    Naslov(String ulica, String hisnaSt){
        this.ulica=ulica;
        this.hisnaSt=hisnaSt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getTk_id_kraj() {
        return tk_id_kraj;
    }

    public void setTk_id_kraj(int tk_id_kraj) {
        this.tk_id_kraj = tk_id_kraj;
    }
}