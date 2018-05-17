package si.feri.NepremicninskaAgencija.models;

public class Kraj{

    int id;
    String imeKraja;
    int postnaSt;

    Kraj(String imeKraja, int postnaSt){
        this.imeKraja=imeKraja;
        this.postnaSt=postnaSt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImeKraja() {
        return imeKraja;
    }

    public void setImeKraja(String imeKraja) {
        this.imeKraja = imeKraja;
    }

    public int getPostnaSt() {
        return postnaSt;
    }

    public void setPostnaSt(int postnaSt) {
        this.postnaSt = postnaSt;
    }
}