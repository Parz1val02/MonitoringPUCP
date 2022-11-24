package Funcion;
import java.util.Random;

public class NroRandom {

    public static int generadorNrosRandom(int max, int min) {
        Random r = new Random();
        return r.nextInt((max - min) - 1);
    }
}
