package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import si.feri.NepremicninskaAgencija.models.Slika;

import java.io.*;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

@Component
public class SlikaDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public void save(MultipartFile f,int tk_nepremicnina, int tk_agent){
        try {
            LobHandler lobhandler = new DefaultLobHandler();
            final File blobIn = convert(f);
            final InputStream blobIs = new FileInputStream(blobIn);
            jdbcTemplate.execute(
                    "INSERT INTO slika (urlSlike,opisSlike,Nepremicnina_idNepremicnina,Agent_idAgent) VALUES (?,?,?,?)",
                    new AbstractLobCreatingPreparedStatementCallback(lobhandler) {
                        protected void setValues(PreparedStatement ps, LobCreator lobCreator)
                                throws SQLException {
                            //ps.setLong(1, 1L);
                            lobCreator.setBlobAsBinaryStream(ps, 1, blobIs, (int) blobIn.length());
                            ps.setString(2, "nekaj");
                            ps.setString(3, ""+tk_nepremicnina);
                            ps.setString(4, ""+tk_agent);
                        }
                    }
            );
            blobIs.close();
        }
        catch(IOException e){
            System.out.println(e);
        }
    }
    public File convert(MultipartFile file)
    {
        try {
            File convFile = new File(file.getOriginalFilename());
            convFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(convFile);
            fos.write(file.getBytes());
            fos.close();
            return convFile;
        }
        catch(IOException e){
            System.out.println(e);
        }
        return null;
    }


    public List<Slika> vrniSlike(int id) {
        String sql = "SELECT * FROM slika WHERE Nepremicnina_idNepremicnina=" + id;
        List<Slika> ret = new ArrayList<Slika>();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        for (Map<String, Object> row : rows) {
            byte[] blob = (byte[]) row.get("urlSlike");

            String retrieveBlobAsString = Base64.getEncoder().encodeToString(blob);

            ret.add(new Slika(retrieveBlobAsString));
        }
        return ret;
    }
    public boolean obstajaSlikaAgenta(int id){
        String sql = "SELECT * FROM slika WHERE Nepremicnina_idNepremicnina IS null AND Agent_idAgent=" + id;
        List<Slika> ret = new ArrayList<Slika>();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        if(rows.isEmpty()){
            return false;
        }
        return true;
    }
    public Slika vrniSlikoAgenta(int id){
        String sql = "SELECT URLSlike FROM slika WHERE Nepremicnina_idNepremicnina IS null AND Agent_idAgent="+id;
        Map<String, Object> row=jdbcTemplate.queryForList(sql).get(0);
        byte[] blob = (byte[]) row.get("urlSlike");
        String retrieveBlobAsString = Base64.getEncoder().encodeToString(blob);
        return (new Slika(retrieveBlobAsString));
    }
    public void saveA(MultipartFile f,int tk_agent){
        try {
            LobHandler lobhandler = new DefaultLobHandler();
            final File blobIn = convert(f);
            final InputStream blobIs = new FileInputStream(blobIn);
            jdbcTemplate.execute(
                    "INSERT INTO slika (urlSlike,opisSlike,Agent_idAgent) VALUES (?,?,?)",
                    new AbstractLobCreatingPreparedStatementCallback(lobhandler) {
                        protected void setValues(PreparedStatement ps, LobCreator lobCreator)
                                throws SQLException {
                            //ps.setLong(1, 1L);
                            lobCreator.setBlobAsBinaryStream(ps, 1, blobIs, (int) blobIn.length());
                            ps.setString(2, "nekaj");
                            ps.setString(3, ""+tk_agent);
                        }
                    }
            );
            blobIs.close();
        }
        catch(IOException e){
            System.out.println(e);
        }
    }
    public void saveUpdate(MultipartFile f,int tk_agent){
        try {
            LobHandler lobhandler = new DefaultLobHandler();
            final File blobIn = convert(f);
            final InputStream blobIs = new FileInputStream(blobIn);
            jdbcTemplate.execute(
                    "UPDATE  slika SET urlSlike=? WHERE Agent_idAgent="+tk_agent,
                    new AbstractLobCreatingPreparedStatementCallback(lobhandler) {
                        protected void setValues(PreparedStatement ps, LobCreator lobCreator)
                                throws SQLException {
                            //ps.setLong(1, 1L);
                            lobCreator.setBlobAsBinaryStream(ps, 1, blobIs, (int) blobIn.length());
                        }
                    }
            );
            blobIs.close();
        }
        catch(IOException e){
            System.out.println(e);
        }
    }
}
