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

    public int getId(String mail){
        String sql="SELECT idAgent FROM agent WHERE EMailNaslov= '"+mail+"'";
        int id=Integer.parseInt((String)jdbcTemplate.queryForObject(sql, String.class));
        return id;
    }

    public String getIme(int id){
        String sql="SELECT Ime FROM agent WHERE idAgent="+id;
        String ime= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return ime;
    }
    public String getPriimek(int id){
        String sql="SELECT Priimek FROM agent WHERE idAgent="+id;
        String priimek= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return priimek;
    }
    public String getEmail(int id){
        String sql="SELECT EMailNaslov FROM agent WHERE idAgent="+id;
        String mail= ((String)jdbcTemplate.queryForObject(sql, String.class));
        return mail;
    }
    public String getTelefon(int id){
        String sql="SELECT telŠt FROM agent WHERE idAgent="+id;
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

        String sql="UPDATE agent SET Ime=?, Priimek=?, EMailNaslov=?, TelŠt=? WHERE idAgent="+id;
        return  jdbcTemplate.update(sql, new Object[]{ime,priimek,mail,tel});
    }

    public int posodobiGeslo(String geslo, int id){
        String sql="UPDATE agent SET Geslo=? WHERE idAgent=?";
        return  jdbcTemplate.update(sql, new Object[]{geslo, id});
    }
    public int zbrisiRacun(int id){
        String sql="DELETE FROM agent WHERE idAgent=?";
        return  jdbcTemplate.update(sql, new Object[]{id});
    }
}
