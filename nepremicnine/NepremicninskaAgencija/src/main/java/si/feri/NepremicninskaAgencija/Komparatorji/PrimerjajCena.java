package si.feri.NepremicninskaAgencija.Komparatorji;

import si.feri.NepremicninskaAgencija.models.Nepremicnina;

import java.util.Comparator;

public class PrimerjajCena implements Comparator<Nepremicnina> {
    @Override
    public int compare(Nepremicnina o1, Nepremicnina o2) {
        if (o1.getCena() > o2.getCena())
            return 1;
        else if (o1.getCena() < o2.getCena()) {
            return -1;
        }
        return 0;

    }
}
