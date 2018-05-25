package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.NepremicninskaAgencija.models.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class AgentDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addAgent(String ime, String priimek, String email, String geslo){

        String sql ="INSERT into agent(ime,priimek,email,geslo) values(?,?,?,?)";
        return jdbcTemplate.update(sql, new Object[]{ime,priimek,email,geslo});
    }

    public boolean obstaja(String email){
        String sql ="SELECT * FROM agent WHERE email=?";
        List<Map<String,Object>> rows =  jdbcTemplate.queryForList(sql, new Object[] {email} );
        if(rows.isEmpty()){
            return false;
        }
        return true;
    }
    public boolean pravilnoGeslo(String email, String geslo){
        String sql ="SELECT geslo FROM agent WHERE email = '"+email+"'";
        String name = (String)jdbcTemplate.queryForObject(sql, String.class);
        if(name.equals(geslo)){
            return true;
        }
        return false;
    }

    public int getId(String mail){
        String sql="SELECT idAgent FROM agent WHERE email= '"+mail+"'";
        int id=Integer.parseInt((String)jdbcTemplate.queryForObject(sql, String.class));
        return id;
    }

    public String getIme(int id){
        String sql="SELECT ime FROM agent WHERE idAgent="+id;
        String ime= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return ime;
    }
    public String getPriimek(int id){
        String sql="SELECT priimek FROM agent WHERE idAgent="+id;
        String priimek= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return priimek;
    }
    public String getEmail(int id){
        String sql="SELECT email FROM agent WHERE idAgent="+id;
        String mail= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return mail;
    }
    public String getTelefon(int id){
        String sql="SELECT telefonskaSt FROM agent WHERE idAgent="+id;
        String tel= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return tel;
    }
    public String getGeslo(int id){
        String sql="SELECT geslo FROM agent WHERE idAgent="+id;
        String geslo= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return geslo;
    }
    public int  posodobiProfil(String ime, String priimek, String mail, String tel){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);//true will create if necessary

        Object i=session.getAttribute("trenutniUporabnik");
        int id=Integer.parseInt(i.toString());

        String sql="UPDATE agent SET ime=?, priimek=?, email=?, telefonskaSt=? WHERE idAgent="+id;
        return  jdbcTemplate.update(sql, new Object[]{ime,priimek,mail,tel});
    }

    public int posodobiGeslo(String geslo, int id){
        String sql="UPDATE agent SET geslo=? WHERE idAgent=?";
        return  jdbcTemplate.update(sql, new Object[]{geslo, id});
    }

    public int zbrisiRacun(int id){
        System.out.println(id);
        String sql = "DELETE FROM agent WHERE idAgent=?";
        try {
            return jdbcTemplate.update(sql, new Object[]{id});
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return 1;
    }
}
