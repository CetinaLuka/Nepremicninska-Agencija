package si.feri.NepremicninskaAgencija.models;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class KrajDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addKraj(String kraj, int postnaSt){

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
}
