package Beans;

import java.io.File;

public class FotoPerfil {
    private int idFoto;
    private byte[] fotobyte;
    private String nombreFoto;

    public int getIdFoto() {
        return idFoto;
    }

    public void setIdFoto(int idFoto) {
        this.idFoto = idFoto;
    }

    public byte[] getFotobyte() {
        return fotobyte;
    }

    public void setFotobyte(byte[] fotobyte) {
        this.fotobyte = fotobyte;
    }

    public String getNombreFoto() {
        return nombreFoto;
    }

    public void setNombreFoto(String nombreFoto) {
        this.nombreFoto = nombreFoto;
    }
}
