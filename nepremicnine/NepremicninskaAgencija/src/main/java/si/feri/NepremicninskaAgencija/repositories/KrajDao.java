package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class KrajDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addKraj(String kraj, int postnaSt){

        String sql ="INSERT into KRAJ(kraj,postnaSt) values(?,?)";

        return jdbcTemplate.update(sql, new Object[]{kraj,postnaSt});
    }
}
