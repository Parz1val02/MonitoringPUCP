package Beans;

import java.io.File;

public class FotosIncidencias {

    private int idFotos;
    private byte[] fotobyte;
    private String nombreFoto;
    private Incidencia incidencia;

    public String getNombreFoto() {
        return nombreFoto;
    }

    public void setNombreFoto(String nombreFoto) {
        this.nombreFoto = nombreFoto;
    }
    public int getIdFotos() {
        return idFotos;
    }

    public void setIdFotos(int idFotos) {
        this.idFotos = idFotos;
    }
    public byte[] getFotobyte() {
        return fotobyte;
    }

    public void setFotobyte(byte[] fotobyte) {
        this.fotobyte = fotobyte;
    }

    public Incidencia getIncidencia() {
        return incidencia;
    }

    public void setIncidencia(Incidencia incidencia) {
        this.incidencia = incidencia;
    }
}
