package si.feri.NepremicninskaAgencija.models;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class NaslovDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addNaslov(String ulica, String hisnaSt){

        String sql ="INSERT into NASLOV(ulica,hisnaSt) values(?,?)";

        return jdbcTemplate.update(sql, new Object[]{ulica,hisnaSt});
    }
}
