package Beans;

import java.io.File;

public class TipoIncidencia {

    private int idTipo;
    private String tipo;
    private File icono; //para los iconos dependiendo del tipo de incidencia

    private byte[] fotobyte;
    private String descripcionOtros; //descripcion cuando se escoge el tipo de incidencia es "OTROS"

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public File getIcono() {
        return icono;
    }

    public void setIcono(File icono) {
        this.icono = icono;
    }

    public String getDescripcionOtros() {
        return descripcionOtros;
    }

    public void setDescripcionOtros(String descripcionOtros) {
        this.descripcionOtros = descripcionOtros;
    }

    public byte[] getFotobyte() {
        return fotobyte;
    }

    public void setFotobyte(byte[] fotobyte) {
        this.fotobyte = fotobyte;
    }
}
