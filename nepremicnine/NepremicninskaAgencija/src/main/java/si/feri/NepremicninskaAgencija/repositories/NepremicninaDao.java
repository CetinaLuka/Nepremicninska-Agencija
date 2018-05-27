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

    public int addStanovanje(String Cena, String SkupnaKvadratura, String ŠtSob, String LetnikIzgradnje, String Nadstropje, int LetoPrenove, String Garaža, String Balkon, String Opis, int Prodano, int tk_id_naslov, int tk_id_vrstaNepremicnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMICNINA(cena, skupnaKvadratura, steviloSob, letoIzgradnje, nadstropje, letoPrenove, garaza, balkon, opis, prodano, datumObjave, tk_id_naslov, tk_id_vrstaNepremicnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, SkupnaKvadratura, ŠtSob, LetnikIzgradnje, Nadstropje, LetoPrenove, Garaža, Balkon, Opis,Prodano, DatumObjave, tk_id_naslov, tk_id_vrstaNepremicnine, Agent_idAgent});
    }

    public int addHisa(String Cena, String KvadraturaBivalnegaProstora, String LetnikIzgradnje, String LetoPrenove, String Garaža, String Opis, String SkupnaKvadratura, String VrstaHiše, int Prodano, int tk_id_naslov, int tk_id_vrstaNepremicnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMICNINA(cena, kvadraturaBivalnegaProstora, letoIzgradnje, letoPrenove, garaza, opis, skupnaKvadratura, vrstaHise, prodano, datumObjave, tk_id_naslov, tk_id_vrstaNepremicnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, KvadraturaBivalnegaProstora, LetnikIzgradnje, LetoPrenove, Garaža, Opis, SkupnaKvadratura, VrstaHiše, Prodano, DatumObjave, tk_id_naslov, tk_id_vrstaNepremicnine, Agent_idAgent});
    }

    public int addPosest(String Cena, String SkupnaKvadratura, String TipPosesti, String Opis, int Prodano, int tk_id_naslov, int tk_id_vrstaNepremicnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMICNINA(cena, skupnaKvadratura, tipPosesti, opis, prodano, datumObjave, tk_id_naslov, tk_id_vrstaNepremicnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, SkupnaKvadratura, TipPosesti, Opis,Prodano, DatumObjave, tk_id_naslov, tk_id_vrstaNepremicnine, Agent_idAgent});
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
            Boolean garaza=false;
            if(row.get("garaza")!=null)
                garaza=(Boolean)row.get("garaza");
            Boolean balkon=false;
            if(row.get("balkon")!=null)
                balkon=(Boolean)row.get("balkon");
            String opis="";
            if(row.get("opis")!=null)
                opis=(String)row.get("opis");
            String vrstaHise="";
            if(row.get("vrstaHise")!=null)
                vrstaHise=(String)row.get("vrstaHise");
            String tipPosesti="";
            if(row.get("tipPosesti")!=null)
                tipPosesti=(String)row.get("tipPosesti");
            Boolean prodano=(Boolean)row.get("prodano");
            Date datumObjave=(Date)row.get("datumObjave");
            int tk_id_vrstaNepremicnine = (int)row.get("tk_id_vrstaNepremicnine");
            int tk_id_agent = (int)row.get("Agent_idAgent");
            int tk_id_naslov = (int)row.get("tk_id_naslov");
            ret.add(new Nepremicnina(id,cena,kvadraturaBivalnegaProstora,skupnaKvadratura,steviloSob,nadstropje,letoIzgradnje,letoPrenove,garaza,balkon,opis,vrstaHise,tipPosesti,prodano,datumObjave,tk_id_vrstaNepremicnine,tk_id_agent,tk_id_naslov));
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
            Boolean garaza=false;
            if(row.get("garaza")!=null)
                garaza=(Boolean)row.get("garaza");
            Boolean balkon=false;
            if(row.get("balkon")!=null)
                balkon=(Boolean)row.get("balkon");
            String opis="";
            if(row.get("opis")!=null)
                opis=(String)row.get("opis");
            String vrstaHise="";
            if(row.get("vrstaHise")!=null)
                vrstaHise=(String)row.get("vrstaHise");
            String tipPosesti="";
            if(row.get("tipPosesti")!=null)
                tipPosesti=(String)row.get("tipPosesti");
            Boolean prodano=(Boolean)row.get("prodano");
            Date datumObjave=(Date)row.get("datumObjave");
            int tk_id_vrstaNepremicnine = (int)row.get("tk_id_vrstaNepremicnine");
            int tk_id_agent = (int)row.get("Agent_idAgent");
            int tk_id_naslov = (int)row.get("tk_id_naslov");
            ret.add(new Nepremicnina(id,cena,kvadraturaBivalnegaProstora,skupnaKvadratura,steviloSob,nadstropje,letoIzgradnje,letoPrenove,garaza,balkon,opis,vrstaHise,tipPosesti,prodano,datumObjave,tk_id_vrstaNepremicnine,tk_id_agent,tk_id_naslov));
        }
        return ret;
    }

    public List<Integer> vrniIDStanovanja(String cena, String kvadratura, String stevilo_sob, String letnik_izgradnje, String nadstropje, int letnik_prenove, String garaza, String balkon , String dodaten_opis, int prodano, int tk_naslov, int tk_vrstaNepr, int tk_agent){
        String sql = "SELECT nepremicnina.idNepremicnina FROM nepremicnina WHERE cena=? AND skupnaKvadratura=? AND steviloSob=? AND letoIzgradnje=? AND nadstropje=? AND letoPrenove=? AND garaza=? AND balkon=? AND opis=? AND prodano=? AND tk_id_naslov=? AND tk_id_vrstaNepremicnine=? AND Agent_idAgent=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{cena,kvadratura,stevilo_sob,letnik_izgradnje,nadstropje,letnik_prenove,garaza,balkon,dodaten_opis,prodano,tk_naslov,tk_vrstaNepr,tk_agent});
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            ret.add(id);
        }
        return ret;
    }
    public List<Integer> vrniIDHise(String cena, String kvadratura, String letnik_izgradnje, String letnik_prenove, String garaza, String dodaten_opis, String velikost_zemljisca, String vrsta_hise, int prodano, int tk_naslov, int tk_vrstaNepr, int tk_agent){
        String sql = "SELECT nepremicnina.idNepremicnina FROM nepremicnina WHERE cena=? AND kvadraturaBivalnegaProstora=? AND letoIzgradnje=? AND letoPrenove=? AND garaza=? AND opis=? AND skupnaKvadratura=? AND vrstaHise=? AND prodano=? AND tk_id_naslov=? AND tk_id_vrstaNepremicnine=? AND Agent_idAgent=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{cena,kvadratura,letnik_izgradnje,letnik_prenove,garaza,dodaten_opis,velikost_zemljisca,vrsta_hise,prodano,tk_naslov,tk_vrstaNepr,tk_agent});
        for (Map row : rows) {
            int id = (int)row.get("idNepremicnina");
            ret.add(id);
        }
        return ret;
    }
    public List<Integer> vrniIDPosesti(String cena, String velikost_zemljisca, String vrsta_posesti, String dodaten_opis, int prodano,  int tk_naslov, int tk_vrstaNepr, int tk_agent){
        String sql = "SELECT nepremicnina.idNepremicnina FROM nepremicnina WHERE cena=? AND skupnaKvadratura=? AND tipPosesti=? AND opis=? AND prodano=?  AND tk_id_naslov=? AND tk_id_vrstaNepremicnine=? AND Agent_idAgent=?";
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
        return n;
    }
    public int vrniTKagenta(int id){
        String sql="SELECT Agent_idAgent FROM nepremicnina WHERE idNepremicnina="+id;
        return Integer.parseInt((String)jdbcTemplate.queryForObject(sql, String.class));
    }
    public int vrniTKnaslov(int id){
        String sql="SELECT tk_id_naslov FROM nepremicnina WHERE idNepremicnina="+id;
        return Integer.parseInt((String)jdbcTemplate.queryForObject(sql, String.class));
    }

}
