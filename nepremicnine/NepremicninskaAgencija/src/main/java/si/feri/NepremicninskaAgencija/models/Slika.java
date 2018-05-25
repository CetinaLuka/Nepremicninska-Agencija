package si.feri.NepremicninskaAgencija.models;
public class Slika{

    int idSlika;
    String URLSlike;
    String opisSlike;
    int Nepremicnina_idNepremicnina;
    int Agent_idAgent;

    public int getAgent_idAgent() {
        return Agent_idAgent;
    }

    public void setAgent_idAgent(int agent_idAgent) {
        this.Agent_idAgent = agent_idAgent;
    }


    Slika(String URLSlike, String opisSlike){
        this.URLSlike=URLSlike;
        this.opisSlike=opisSlike;
    }

    public int getIdSlika() {
        return idSlika;
    }

    public void setIdSlika(int idSlika) {
        this.idSlika = idSlika;
    }

    public String getURLSlike() {
        return URLSlike;
    }

    public void setURLSlike(String URLSlike) {
        this.URLSlike = URLSlike;
    }

    public String getOpisSlike() {
        return opisSlike;
    }

    public void setOpisSlike(String opisSlike) {
        this.opisSlike = opisSlike;
    }

    public int getNepremicnina_idNepremicnina() {
        return Nepremicnina_idNepremicnina;
    }

    public void setNepremicnina_idNepremicnina(int nepremicnina_idNepremicnina) {
        this.Nepremicnina_idNepremicnina = nepremicnina_idNepremicnina;
    }
}