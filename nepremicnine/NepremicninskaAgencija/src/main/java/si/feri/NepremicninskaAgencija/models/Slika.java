public class Slika{

    int id;
    String URLSlike;
    String opisSlike;
    int tk_id_nepremicnina;

    public int getTk_id_agent() {
        return tk_id_agent;
    }

    public void setTk_id_agent(int tk_id_agent) {
        this.tk_id_agent = tk_id_agent;
    }

    int tk_id_agent;

    Slika(String URLSlike, String opisSlike){
        this.URLSlike=URLSlike;
        this.opisSlike=opisSlike;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getTk_id_nepremicnina() {
        return tk_id_nepremicnina;
    }

    public void setTk_id_nepremicnina(int tk_id_nepremicnina) {
        this.tk_id_nepremicnina = tk_id_nepremicnina;
    }
}