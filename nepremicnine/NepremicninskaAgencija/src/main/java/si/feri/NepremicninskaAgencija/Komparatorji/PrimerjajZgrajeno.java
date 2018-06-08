package si.feri.NepremicninskaAgencija.Komparatorji;

import si.feri.NepremicninskaAgencija.models.Nepremicnina;

import java.util.Comparator;

public class PrimerjajZgrajeno implements Comparator<Nepremicnina> {
    @Override
    public int compare(Nepremicnina o1, Nepremicnina o2) {
        if(o1.getLetoIzgradnje()>o2.getLetoIzgradnje())
            return 1;
        else if(o1.getLetoIzgradnje()<o2.getLetoIzgradnje()){
            return -1;
        }
        return 0;
    }
}
