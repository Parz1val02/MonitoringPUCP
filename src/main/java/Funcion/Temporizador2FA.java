package Funcion;
import java.util.Timer;
import java.util.TimerTask;


public class Temporizador2FA {
    Timer timer;

    public Temporizador2FA(int seconds) {
        timer = new Timer();
        timer.schedule(new StopTask(), seconds * 1000);
    }
    class StopTask extends TimerTask {
        public void run() {
            timer.cancel();
        }
    }
}
