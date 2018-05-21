package si.feri.NepremicninskaAgencija.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class NepremicninaDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int addStanovanje(String Cena, String KvadraturaBivalnegaProstora, String SkupnaKvadratura, String ŠtSob, String LetnikIzgradnje, String Nadstropje, String LetoPrenove, String Garaža, String Balkon, String Opis, String VrstaHiše, String TipPosesti, String Prodano, int Naslov_idNaslov, int VrstaNepremičnine_idVrstaNepremičnine, int Agent_idAgent){
        String DatumObjave=(new Date()).toString();
        String sql ="INSERT into NEPREMICNINA(Cena, KvadraturaBivalnegaProstora, SkupnaKvadratura, ŠtSob, LetnikIzgradnje, Nadstropje, LetoPrenove, Garaža, Balkon, Opis, VrstaHiše, TipPosesti, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent) values(?,?,?,?,?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql, new Object[]{Cena, KvadraturaBivalnegaProstora, SkupnaKvadratura, ŠtSob, LetnikIzgradnje, Nadstropje, LetoPrenove, Garaža, Balkon, Opis, VrstaHiše, TipPosesti, Prodano, DatumObjave, Naslov_idNaslov, VrstaNepremičnine_idVrstaNepremičnine, Agent_idAgent});
    }
}
