package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
                    "INSERT INTO slika (UrlSlike,OpisSlike,Nepremičnina_idNepremičnina,Agent_idAgent) VALUES (?,?,?,?)",
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
}
