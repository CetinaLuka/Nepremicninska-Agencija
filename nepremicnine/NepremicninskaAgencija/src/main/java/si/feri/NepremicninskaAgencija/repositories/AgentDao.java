package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.NepremicninskaAgencija.models.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class AgentDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addAgent(String ime, String priimek, String email, String geslo){

        String sql ="INSERT into agent(Ime,Priimek,EMailNaslov,Geslo) values(?,?,?,?)";
        return jdbcTemplate.update(sql, new Object[]{ime,priimek,email,geslo});
    }

    public boolean obstaja(String email){
        String sql ="SELECT * FROM agent WHERE EMailNaslov=?";
        List<Map<String,Object>> rows =  jdbcTemplate.queryForList(sql, new Object[] {email} );
        if(rows.isEmpty()){
            return false;
        }
        return true;
    }
    public boolean pravilnoGeslo(String email, String geslo){
        String sql ="SELECT Geslo FROM agent WHERE EMailNaslov = '"+email+"'";
        String name = (String)jdbcTemplate.queryForObject(sql, String.class);
        if(name.equals(geslo)){
            return true;
        }
        return false;
    }
}
