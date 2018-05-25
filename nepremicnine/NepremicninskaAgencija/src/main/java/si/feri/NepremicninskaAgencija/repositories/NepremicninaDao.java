package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class NepremicninaDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addStanovanje(String Cena, String SkupnaKvadratura, String ŠtSob, String LetnikIzgradnje, String Nadstropje, String LetoPrenove, String Garaža, String Balkon, String Opis, int Prodano, int Naslov_idNaslov, int VrstaNepremičnine_idVrstaNepremičnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMICNINA(cena, skupnaKvadratura, steviloSob, letoIzgradnje, nadstropje, letoPrenove, garaza, balkon, opis, prodano, datumObjave, Naslov_idNaslov, VrstaNepremicnine_idVrstaNepremicnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, SkupnaKvadratura, ŠtSob, LetnikIzgradnje, Nadstropje, LetoPrenove, Garaža, Balkon, Opis,Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }

    public int addHisa(String Cena, String KvadraturaBivalnegaProstora, String LetnikIzgradnje, String LetoPrenove, String Garaža, String Opis, String SkupnaKvadratura, String VrstaHiše, int Prodano, int Naslov_idNaslov, int VrstaNepremičnine_idVrstaNepremičnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMICNINA(cena, kvadraturaBivalnegaProstora, letoIzgradnje, letoPrenove, garaza, opis, skupnaKvadratura, vrstaHise, prodano, datumObjave, Naslov_idNaslov, VrstaNepremicnine_idVrstaNepremicnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, KvadraturaBivalnegaProstora, LetnikIzgradnje, LetoPrenove, Garaža, Opis, SkupnaKvadratura, VrstaHiše, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }

    public int addPosest(String Cena, String SkupnaKvadratura, String TipPosesti, String Opis, int Prodano, int Naslov_idNaslov, int VrstaNepremičnine_idVrstaNepremičnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMICNINA(cena, skupnaKvadratura, tipPosesti, opis, prodano, datumObjave, Naslov_idNaslov, VrstaNepremicnine_idVrstaNepremicnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, SkupnaKvadratura, TipPosesti, Opis,Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }

    public List<Nepremicnina> vrniVse(){
        String sql = "SELECT * FROM NEPREMICNINA";
        List<Nepremicnina> ret = new ArrayList<Nepremicnina>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql);
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            double cena=(double)row.get("cena");
            double kvadraturaBivalnegaProstora=0;
            if(row.get("kvadraturaBivalnegaProstora")!=null)
                kvadraturaBivalnegaProstora=(double)row.get("svadraturaBivalnegaProstora");
            double skupnaKvadratura=(double)row.get("SkupnaKvadratura");
            int steviloSob=0;
            if(row.get("steviloSob")!=null)
                steviloSob=(int)row.get("steviloSob");
            int nadstropje=0;
            if(row.get("nadstropje")!=null)
                nadstropje=(int)row.get("nadstropje");
            int letoIzgradnje=0;
            if(row.get("letoIzgradnje")!=null)
                letoIzgradnje=(int)row.get("letoIzgradnje");
            int letoPrenove=0;
            if(row.get("letoPrenove")!=null)
                letoPrenove=(int)row.get("letoPrenove");
            boolean garaza=false;
            if(row.get("garaza")!=null)
                garaza=(boolean)row.get("garaza");
            boolean balkon=false;
            if(row.get("balkon")!=null)
                balkon=(boolean)row.get("balkon");
            String opis="";
            if(row.get("opis")!=null)
                opis=(String)row.get("opis");
            String vrstaHise="";
            if(row.get("vrstaHise")!=null)
                vrstaHise=(String)row.get("vrstaHise");
            String vrstaPosesti="";
            if(row.get("tipPosesti")!=null)
                vrstaPosesti=(String)row.get("tipPosesti");
            boolean prodano=(boolean)row.get("prodano");
            Date datumObjave=(Date)row.get("datumObjave");
            int tk_id_vrstaNepremicnine = (int)row.get("VrstaNepremicnine_idVrstaNepremicnine");
            int tk_id_agent = (int)row.get("Agent_idAgent");
            int tk_id_naslov = (int)row.get("Naslov_idNaslov");
            ret.add(new Nepremicnina(id,cena,kvadraturaBivalnegaProstora,skupnaKvadratura,steviloSob,nadstropje,letoIzgradnje,letoPrenove,garaza,balkon,opis,vrstaHise,vrstaPosesti,prodano,datumObjave,tk_id_vrstaNepremicnine,tk_id_agent,tk_id_naslov));
        }
        return ret;
    }

    public List<Nepremicnina> vrniVseOdAgenta(int Agent_idAgent){
        String sql = "SELECT * FROM NEPREMICNINA WHERE Agent_idAgent=?";
        List<Nepremicnina> ret = new ArrayList<Nepremicnina>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql,Agent_idAgent);
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            double cena=(double)row.get("cena");
            double kvadraturaBivalnegaProstora=0;
            if(row.get("kvadraturaBivalnegaProstora")!=null)
                kvadraturaBivalnegaProstora=(double)row.get("kvadraturaBivalnegaProstora");
            double skupnaKvadratura=(double)row.get("skupnaKvadratura");
            int steviloSob=0;
            if(row.get("steviloSob")!=null)
                steviloSob=(int)row.get("steviloSob");
            int nadstropje=0;
            if(row.get("nadstropje")!=null)
                nadstropje=(int)row.get("nadstropje");
            int letoIzgradnje=0;
            if(row.get("letoIzgradnje")!=null)
                letoIzgradnje=(int)row.get("letoIzgradnje");
            int letoPrenove=0;
            if(row.get("letoPrenove")!=null)
                letoPrenove=(int)row.get("letoPrenove");
            boolean garaza=false;
            if(row.get("garaza")!=null)
                garaza=(boolean)row.get("garaza");
            boolean balkon=false;
            if(row.get("balkon")!=null)
                balkon=(boolean)row.get("balkon");
            String opis="";
            if(row.get("opis")!=null)
                opis=(String)row.get("opis");
            String vrstaHise="";
            if(row.get("vrstaHise")!=null)
                vrstaHise=(String)row.get("vrstaHise");
            String vrstaPosesti="";
            if(row.get("tipPosesti")!=null)
                vrstaPosesti=(String)row.get("tipPosesti");
            boolean prodano=(boolean)row.get("prodano");
            Date datumObjave=(Date)row.get("datumObjave");
            int tk_id_vrstaNepremicnine = (int)row.get("VrstaNepremicnine_idVrstaNepremicnine");
            int tk_id_agent = (int)row.get("Agent_idAgent");
            int tk_id_naslov = (int)row.get("Naslov_idNaslov");
            ret.add(new Nepremicnina(id,cena,kvadraturaBivalnegaProstora,skupnaKvadratura,steviloSob,nadstropje,letoIzgradnje,letoPrenove,garaza,balkon,opis,vrstaHise,vrstaPosesti,prodano,datumObjave,tk_id_vrstaNepremicnine,tk_id_agent,tk_id_naslov));
        }
        return ret;
    }

    public List<Integer> vrniIDStanovanja(String cena, String kvadratura, String stevilo_sob, String letnik_izgradnje, String nadstropje, String letnik_prenove, String garaza, String balkon , String dodaten_opis, int prodano, int tk_naslov, int tk_vrstaNepr, int tk_agent){
        String sql = "SELECT nepremicnina.idNepremicnina FROM nepremicnina WHERE cena=? AND skupnaKvadratura=? AND steviloSob=? AND letoIzgradnje=? AND nadstropje=? AND letoPrenove=? AND garaza=? AND balkon=? AND opis=? AND prodano=? AND Naslov_idNaslov=? AND vrstaNepremicnine_idVrstaNepremicnine=? AND Agent_idAgent=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{cena,kvadratura,stevilo_sob,letnik_izgradnje,nadstropje,letnik_prenove,garaza,balkon,dodaten_opis,prodano,tk_naslov,tk_vrstaNepr,tk_agent});
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            ret.add(id);
        }
        return ret;
    }
    public List<Integer> vrniIDHise(String cena, String kvadratura, String letnik_izgradnje, String letnik_prenove, String garaza, String dodaten_opis, String velikost_zemljisca, String vrsta_hise, int prodano, int tk_naslov, int tk_vrstaNepr, int tk_agent){
        String sql = "SELECT nepremicnina.idNepremicnina FROM nepremicnina WHERE cena=? AND kvadraturaBivalnegaProstora=? AND letoIzgradnje=? AND letoPrenove=? AND garaza=? AND opis=? AND skupnaKvadratura=? AND vrstaHise=? AND prodano=? AND Naslov_idNaslov=? AND vrstaNepremicnine_idVrstaNepremicnine=? AND Agent_idAgent=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{cena,kvadratura,letnik_izgradnje,letnik_prenove,garaza,dodaten_opis,velikost_zemljisca,vrsta_hise,prodano,tk_naslov,tk_vrstaNepr,tk_agent});
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            ret.add(id);
        }
        return ret;
    }
    public List<Integer> vrniIDPosesti(String cena, String velikost_zemljisca, String vrsta_posesti, String dodaten_opis, int prodano,  int tk_naslov, int tk_vrstaNepr, int tk_agent){
        String sql = "SELECT nepremicnina.idNepremicnina FROM nepremicnina WHERE cena=? AND skupnaKvadratura=? AND tipPosesti=? AND opis=? AND prodano=?  AND Naslov_idNaslov=? AND vrstaNepremicnine_idVrstaNepremicnine=? AND Agent_idAgent=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{cena, velikost_zemljisca, vrsta_posesti,dodaten_opis,prodano,tk_naslov,tk_vrstaNepr,tk_agent});
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            ret.add(id);
        }
        return ret;
    }

    public Nepremicnina vrniNepremicnino(int id){
        String sql="SELECT * FROM nepremicnina WHERE idNepremicnina=?";
        Nepremicnina n = (Nepremicnina)jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper(Nepremicnina.class));
        System.out.println(n.getNadstropje());
        System.out.println(n.getLetoIzgradnje());
        System.out.println(n.getSteviloSob());
        return n;
    }

}
