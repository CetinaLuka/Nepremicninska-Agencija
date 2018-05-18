package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class NaslovDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addNaslov(String ulica, String hišnaŠt, int Kraj_idKraj){

        String sql ="INSERT into NASLOV(ulica,hišnaŠt, Kraj_idKraj) values(?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{ulica,hišnaŠt,Kraj_idKraj});
    }

    public List<Integer> vrniID(String ulica, String hišnaŠt, int Kraj_idKraj){
        String sql = "SELECT Naslov.idNaslov FROM Naslov WHERE ulica=? AND hišnaŠt=? AND Kraj_idKraj=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{ulica,hišnaŠt,Kraj_idKraj});
        for (Map row : rows) {
            int id = (int)row.get("idNaslov");
            ret.add(id);
        }
        return ret;
    }
}
