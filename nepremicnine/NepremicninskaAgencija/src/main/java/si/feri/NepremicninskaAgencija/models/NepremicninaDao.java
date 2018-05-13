package si.feri.NepremicninskaAgencija.models;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class NepremicninaDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addStanovanje(double kvadratura, int stevilo_sob, int letnik_izgradnje, int nadstropje, double cena, boolean prenovljeno, int letnik_prenove, boolean garaza, boolean balkon, boolean dodaten_opis_check, String dodaten_opis){

        String sql ="INSERT into NEPREMICNINA(kvadratura, stevilo_sob, letnik_izgradnje, nadstropje, cena, prenovljeno, letnik_prenove, garaza, balkon ,dodaten_opis_check, dodaten_opis) values(?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{kvadratura, stevilo_sob, letnik_izgradnje, nadstropje, cena, prenovljeno, letnik_prenove, garaza, balkon, dodaten_opis_check, dodaten_opis});
    }
}
