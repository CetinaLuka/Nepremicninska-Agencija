package si.feri.NepremicninskaAgencija.models;

public class Naslov{

    int idNaslov;
    String ulica;
    String hisnaSt;
    int Kraj_idkraj;

   public Naslov(String ulica, String hisnaSt){
        this.ulica=ulica;
        this.hisnaSt=hisnaSt;
    }
   public Naslov(){}

    public int getIdNaslov() {
        return idNaslov;
    }

    public void setIdNaslov(int idNaslov) {
        this.idNaslov = idNaslov;
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

    public int getKraj_idkraj() {
        return Kraj_idkraj;
    }

    public void setKraj_idkraj(int kraj_idkraj) {
        this.Kraj_idkraj = kraj_idkraj;
    }
}