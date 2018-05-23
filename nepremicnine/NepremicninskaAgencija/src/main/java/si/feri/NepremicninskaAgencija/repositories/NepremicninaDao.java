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
        String sql ="INSERT into NEPREMIČNINA(Cena, SkupnaKvadratura, ŠtSob, LetnikIzgradnje, Nadstropje, LetoPrenove, Garaža, Balkon, Opis, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, SkupnaKvadratura, ŠtSob, LetnikIzgradnje, Nadstropje, LetoPrenove, Garaža, Balkon, Opis,Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }

    public int addHisa(String Cena, String KvadraturaBivalnegaProstora, String LetnikIzgradnje, String LetoPrenove, String Garaža, String Opis, String SkupnaKvadratura, String VrstaHiše, int Prodano, int Naslov_idNaslov, int VrstaNepremičnine_idVrstaNepremičnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMIČNINA(Cena, KvadraturaBivalnegaProstora, LetnikIzgradnje, LetoPrenove, Garaža, Opis, SkupnaKvadratura, VrstaHiše, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, KvadraturaBivalnegaProstora, LetnikIzgradnje, LetoPrenove, Garaža, Opis, SkupnaKvadratura, VrstaHiše, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }

    public int addPosest(String Cena, String SkupnaKvadratura, String TipPosesti, String Opis, int Prodano, int Naslov_idNaslov, int VrstaNepremičnine_idVrstaNepremičnine, int Agent_idAgent){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String DatumObjave=dt.format(new Date());
        String sql ="INSERT into NEPREMIČNINA(Cena, SkupnaKvadratura, TipPosesti, Opis, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, SkupnaKvadratura, TipPosesti, Opis,Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }

    public List<Nepremicnina> vrniVse(){
        String sql = "SELECT * FROM NEPREMIČNINA";
        List<Nepremicnina> ret = new ArrayList<Nepremicnina>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql);
        for (Map row : rows) {
            int id = (int)row.get("ID");
            double cena=(double)row.get("Cena");
            double kvadraturaBivalnegaProstora=(double)row.get("kvadraturaBivalnegaProstora");
            double skupnaKvadratura=(double)row.get("skupnaKvadratura");
            int steviloSob=(int)row.get("steviloSob");
            int nadstropje=(int)row.get("nadstropje");
            int letoIzgradnje=(int)row.get("letoIzgradnje");
            int letoPrenove=(int)row.get("letoPrenove");
            boolean garaza=(boolean)row.get("garaza");
            boolean balkon=(boolean)row.get("balkon");
            String opis=(String)row.get("opis");
            String vrstaHise=(String)row.get("vrstaHise");
            String vrstaPosesti=(String)row.get("vrstaPosesti");
            boolean prodano=(boolean)row.get("prodano");
            Date datumObjave=(Date)row.get("datumObjave");
            ret.add(new Nepremicnina(id,cena,kvadraturaBivalnegaProstora,skupnaKvadratura,steviloSob,nadstropje,letoIzgradnje,letoPrenove,garaza,balkon,opis,vrstaHise,vrstaPosesti,prodano, datumObjave));
        }
        return ret;
    }
}
