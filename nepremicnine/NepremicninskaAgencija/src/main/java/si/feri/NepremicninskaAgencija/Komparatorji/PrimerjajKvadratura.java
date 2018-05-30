package si.feri.NepremicninskaAgencija.Komparatorji;

import si.feri.NepremicninskaAgencija.models.Nepremicnina;

import java.util.Comparator;

public class PrimerjajKvadratura implements Comparator<Nepremicnina> {
    @Override
    public int compare(Nepremicnina o1, Nepremicnina o2) {
        if(o1.getSkupnaKvadratura()>o2.getSkupnaKvadratura())
            return 1;
        else if(o1.getSkupnaKvadratura()<o2.getSkupnaKvadratura()){
            return -1;
        }
        return 0;
    }
}
