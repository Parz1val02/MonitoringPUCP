package Beans;

import java.io.File;
import java.util.ArrayList;

public class TipoIncidencia {

    private int idTipo;
    private String tipo;
    private String fotoIcono;

    public String getFotoIcono() {
        return fotoIcono;
    }

    public void setFotoIcono(String fotoIcono) {
        this.fotoIcono = fotoIcono;
    }

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

}
