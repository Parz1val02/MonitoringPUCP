package Funcion;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
//import jakarta.swing.*;
import java.util.Properties;

//para enviar correo al olvidar contraseña y registrarse(cambiar algunas cosas)
public class EnviarCorreo {

    public static void main(String correoDestino)throws  MessagingException {
        //public static void llamar(String correoDestino) throws AddressException, MessagingException{
        String correo = "teledrugs2021@gmail.com"; //cambiar correo
        String contra = "paeocxrkjrtkcyuy";  //cambiar contraseña
        //String correoDestino = "teledrugs2021@gmail.com";
        // CONTRASEÑA 16 CARACETERES QUE SE TIENE QUE USAR -> paeocxrkjrtkcyuy
        Properties p = new Properties();
        p.put("mail.smtp.host","smtp.gmail.com");
        p.setProperty("mail.smtp.starttls.enable","true");
        p.put("mail.smtp.ssl.trust","smtp.gmail.com");
        p.setProperty("mail.smtp.port","587");
        p.setProperty("mail.smtp.user",correo);
        p.setProperty("mail.smtp.auth","true");

        Session s = Session.getDefaultInstance(p);
        MimeMessage mensaje = new MimeMessage(s);
        mensaje.setFrom(new InternetAddress(correo));
        mensaje.addRecipient(Message.RecipientType.TO,new InternetAddress(correoDestino));
        mensaje.setSubject("Cambio de Contraseña - TeleDrugs"); //
        String link = "http://localhost:8080/TeleDrugs_war_exploded/RecuperarContrasena?vista=cambio";
        mensaje.setText(link);
        //mensaje.setText("Este es un mensaje que se envia desde JAVA");

        Transport t = s.getTransport("smtp");
        t.connect(correo,contra);
        t.sendMessage(mensaje,mensaje.getAllRecipients());
        t.close();

        //JOptionPane.showMessageDialog(null,"Mensaje enviado");

    }

}
