package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.NepremicninskaAgencija.models.*;

@Component
public class AgentDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addAgent(String ime, String priimek, String email, String geslo){

        String sql ="INSERT into agent(Ime,Priimek,EMailNaslov,Geslo) values(?,?,?,?)";
        return jdbcTemplate.update(sql, new Object[]{ime,priimek,email,geslo});
    }
}
