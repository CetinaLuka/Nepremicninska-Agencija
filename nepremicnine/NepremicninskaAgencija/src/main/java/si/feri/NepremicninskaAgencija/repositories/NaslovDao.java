package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.NepremicninskaAgencija.models.Agent;
import si.feri.NepremicninskaAgencija.models.Naslov;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class NaslovDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addNaslov(String ulica, String hišnaŠt, int Kraj_idKraj){

        String sql ="INSERT into NASLOV(ulica,hisnaSt, Kraj_idKraj) values(?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{ulica,hišnaŠt,Kraj_idKraj});
    }

    public List<Integer> vrniID(String ulica, String hišnaŠt, int Kraj_idKraj){
        String sql = "SELECT Naslov.idNaslov FROM Naslov WHERE ulica=? AND hisnaSt=? AND Kraj_idKraj=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{ulica,hišnaŠt,Kraj_idKraj});
        for (Map row : rows) {
            int id = (int)row.get("idNaslov");
            ret.add(id);
        }
        return ret;
    }
    public Naslov vrniNaslov(int id){
        String sql = "SELECT * FROM naslov WHERE idNaslov=?";
        Naslov n = (Naslov)jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper(Naslov.class));
        return n;
    }
    public int vrniTKkraj(int id){
        String sql = "SELECT Kraj_idKraj FROM naslov WHERE idNaslov="+id;
        return Integer.parseInt((String)jdbcTemplate.queryForObject(sql, String.class));
    }
    public List<Nepremicnina> vrniPodatke(){
        String sql1 = "CREATE OR REPLACE VIEW zemljevid AS " +
                "SELECT * FROM (nepremicnina LEFT JOIN naslov ON nepremicnina.tk_id_naslov=naslov.idNaslov " +
                "LEFT JOIN kraj ON naslov.Kraj_idKraj=kraj.idKraj);";
        jdbcTemplate.update(sql1, new Object[]{});
        String sql=   "select idNepremicnina, tk_id_vrstaNepremicnine, ulica, hisnaSt, imeKraja,cena from zemljevid" +
                " group by tk_id_vrstaNepremicnine,ulica, hisnaSt, imeKraja;";
        List<Nepremicnina> ret = new ArrayList<Nepremicnina>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{});
        for (Map row : rows) {
            int tk_id_vrstaNepremicnine = (int) row.get("tk_id_vrstaNepremicnine");
            Integer idNepremicnina=(Integer)row.get("idNepremicnina");
            String ulica = (String) row.get("ulica");
            String hisnaSt = (String) row.get("hisnaSt");
            String imeKraja = (String) row.get("imeKraja");
            Double cena=(Double)row.get("cena");
            ret.add(new Nepremicnina(idNepremicnina,tk_id_vrstaNepremicnine, ulica, hisnaSt, imeKraja, cena));
        }
        return ret;
    }
}
