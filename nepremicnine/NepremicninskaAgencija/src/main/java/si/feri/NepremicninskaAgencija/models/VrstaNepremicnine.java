package si.feri.NepremicninskaAgencija.models;
public class VrstaNepremicnine{

    int idVrstaNepremicnine;
    String vrsta;

    VrstaNepremicnine(String vrsta){
        this.vrsta=vrsta;
    }

    public int getIdVrstaNepremicnine() {
        return idVrstaNepremicnine;
    }

    public void setIdVrstaNepremicnine(int idVrstaNepremicnine) {
        this.idVrstaNepremicnine = idVrstaNepremicnine;
    }

    public String getVrsta() {
        return vrsta;
    }

    public void setVrsta(String vrsta) {
        this.vrsta = vrsta;
    }
}