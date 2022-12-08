package Funcion;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class EnviarPrimeraContrasenia {
    public static void main(String correoDestino, String primeraContrasenia)throws MessagingException {
        //public static void llamar(String correoDestino) throws AddressException, MessagingException{
        String correo = "pucpmonitoring2022@gmail.com"; //cambiar correo
        String contra = "cxzmeohuebkelqhc";  //cambiar contraseña

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
        mensaje.setFrom(new InternetAddress(correo)); //FROM
        mensaje.addRecipient(Message.RecipientType.TO,new InternetAddress(correoDestino));  //TO
        mensaje.setSubject("Cambio de Primera Contraseña - MONITORING PUCP"); //
        //String link = "http://localhost:8080/Login?accion=restablecer";
        String msg = "Su contraseña predeterminada es: " + primeraContrasenia + "   http://localhost:8080/Login?accion=firstpassword";
        mensaje.setText(msg);

        //mensaje.setText("Este es un mensaje que se envia desde JAVA");

        Transport t = s.getTransport("smtp");
        t.connect(correo,contra);
        t.sendMessage(mensaje,mensaje.getAllRecipients());
        t.close();

        //JOptionPane.showMessageDialog(null,"Mensaje enviado");

    }
}
