package Beans;

import java.io.File;

public class Fotos {
    //para guardar las fotos de las incidencias

    private int idFotos;
    private File fotosIncidencia;
    private byte[] fotobyte;


    public int getIdFotos() {
        return idFotos;
    }

    public void setIdFotos(int idFotos) {
        this.idFotos = idFotos;
    }

    public File getFotosIncidencia() {
        return fotosIncidencia;
    }

    public void setFotosIncidencia(File fotosIncidencia) {
        this.fotosIncidencia = fotosIncidencia;
    }

    public byte[] getFotobyte() {
        return fotobyte;
    }

    public void setFotobyte(byte[] fotobyte) {
        this.fotobyte = fotobyte;
    }
}
