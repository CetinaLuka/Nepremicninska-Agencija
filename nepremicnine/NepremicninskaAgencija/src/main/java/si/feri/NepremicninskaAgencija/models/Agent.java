package si.feri.NepremicninskaAgencija.models;
public class Agent{

    int id;
    String ime;
    String priimek;
    String email;
    String geslo;
    String telefonskaSt;
    int tk_id_slika;

    public Agent(){}

    public Agent(String email, String geslo){
        this.email=email;
        this.geslo=geslo;
    }
    public Agent(String ime, String priimek, String email, String geslo){
        this.ime=ime;
        this.priimek=priimek;
        this.email=email;
        this.geslo=geslo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPriimek() {
        return priimek;
    }

    public void setPriimek(String priimek) {
        this.priimek = priimek;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGeslo() {
        return geslo;
    }

    public void setGeslo(String geslo) {
        this.geslo = geslo;
    }

    public String getTelefonskaSt() {
        return telefonskaSt;
    }

    public void setTelefonskaSt(String telefonskaSt) {
        this.telefonskaSt = telefonskaSt;
    }

    public int getTk_id_slika() {
        return tk_id_slika;
    }

    public void setTk_id_slika(int tk_id_slika) {
        this.tk_id_slika = tk_id_slika;
    }
}