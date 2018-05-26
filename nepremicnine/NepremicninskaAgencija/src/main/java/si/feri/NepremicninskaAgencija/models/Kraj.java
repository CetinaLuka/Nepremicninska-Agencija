package si.feri.NepremicninskaAgencija.models;

public class Kraj{

    int idKraj;
    String imeKraja;
    int postnaSt;

    public Kraj(String imeKraja, int postnaSt){
        this.imeKraja=imeKraja;
        this.postnaSt=postnaSt;
    }

    public Kraj(){}

    public int getIdKraj() {
        return idKraj;
    }

    public void setIdKraj(int idKraj) {
        this.idKraj = idKraj;
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