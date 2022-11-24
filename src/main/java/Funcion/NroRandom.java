package Funcion;
import java.util.Random;

public class NroRandom {

    public static int generadorNrosRandom() {
        int max=999999;
        int min=100000;
        Random r = new Random();
        return r.nextInt((max - min) - 1)+min;
    }
}
