package si.feri.NepremicninskaAgencija.Komparatorji;

import si.feri.NepremicninskaAgencija.models.Nepremicnina;

import java.util.Comparator;

public class PrimerjajKvadratura implements Comparator<Nepremicnina> {
    @Override
    public int compare(Nepremicnina o1, Nepremicnina o2) {
        double kvadratura1;
        double kvadratura2;
        if(o1.getTk_id_vrstaNepremicnine()==2)
            kvadratura1=o1.getKvadraturaBivalnegaProstora();
        else{
            kvadratura1=o1.getSkupnaKvadratura();
        }
        if(o2.getTk_id_vrstaNepremicnine()==2)
            kvadratura2=o2.getKvadraturaBivalnegaProstora();
        else{
            kvadratura2=o2.getSkupnaKvadratura();
        }
        if(kvadratura1<kvadratura2)
            return -1;
        else if(kvadratura1>kvadratura2){
            return 1;
        }
        return 0;
    }
}
