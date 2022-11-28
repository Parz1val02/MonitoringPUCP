package Funcion;
import java.util.Timer;
import java.util.TimerTask;



public class Temporizador2FA {
    /*Timer timer;

    public Temporizador2FA(int seconds) {
        timer = new Timer();
        timer.schedule(new StopTask(), seconds * 1000);
    }
    class StopTask extends TimerTask {
        public void run() {
            timer.cancel();
        }
    }temporizador original william*/
    
    Timer timer;
    UsuarioDao uDao = new UsuarioDao();
    Usuario user = null;
    public Temporizador2FA(int seconds, Usuario usuario) {
        int flag = 1;
        uDao.guardarActiveTime2faFlag(flag,usuario);
        user = usuario;
        timer = new Timer();
        timer.schedule(new StopTask(), seconds * 1000);

    }
    class StopTask extends TimerTask {
        public void run() {
            timer.cancel();
            int flag = 0;
            uDao.guardarActiveTime2faFlag(flag,user);
        }
    }
} 
