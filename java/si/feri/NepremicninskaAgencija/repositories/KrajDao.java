package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.NepremicninskaAgencija.models.Kraj;

import java.util.*;

@Component
public class KrajDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addKraj(String kraj, String postnaSt){

        String sql ="INSERT into Kraj(ImeKraja,PoštnaŠt) values(?,?)";

        return jdbcTemplate.update(sql, new Object[]{kraj,postnaSt});
    }

    public List<Kraj> getAllKraji(){
        String sql = "SELECT * FROM Kraj";
        List<Kraj> ret = new ArrayList<Kraj>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql);
        for (Map row : rows) {
            String kraj = (String)row.get("ImeKraja");
            int postnaSt = (int)row.get("PoštnaŠt");
            ret.add(new Kraj(kraj,postnaSt));
        }
        return ret;
    }

    public List<Integer> vrniID(String kraj, String postnaSt){
        String sql = "SELECT Kraj.idKraj FROM Kraj WHERE ImeKraja=? AND PoštnaŠt=?";
        List<Integer> ret = new ArrayList<Integer>();
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql, new Object[]{kraj,postnaSt});
        for (Map row : rows) {
            int id = (int)row.get("idKraj");
            ret.add(id);
        }
        return ret;
    }
}
