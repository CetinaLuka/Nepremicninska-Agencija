package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class NaslovDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addNaslov(String ulica, String hisnaSt, int tk_kraj){

        String sql ="INSERT into NASLOV(ulica,hisnaSt, tk_kraj) values(?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{ulica,hisnaSt,tk_kraj});
    }
}
