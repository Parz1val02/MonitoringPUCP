package Beans;

import java.io.File;
import java.util.ArrayList;

public class TipoIncidencia {

    private int idTipo;
    private String tipo;
    private String nombreIcono;
    private byte[] iconobyte; //para los iconos dependiendo del tipo de incidencia

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

    public void setNombreIcono(String nombreIcono) {
        this.nombreIcono = nombreIcono;
    }

    public byte[] getIconobyte() {
        return iconobyte;
    }

    public void setIconobyte(byte[] iconobyte) {
        this.iconobyte = iconobyte;
    }

    public String getNombreIcono() {
        return nombreIcono;
    }
}
