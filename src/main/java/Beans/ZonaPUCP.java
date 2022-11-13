package Beans;

//para la ubicacion(que se escoja la zona PUCP con un select y se obtenga su latitud y longitud), todavia falta crear una tabla en la base de datos
public class ZonaPUCP {

    private int idZonaPUCP;
    private String nombreZona;

    private double latitud;
    private double longitud;


    public int getIdZonaPUCP() {
        return idZonaPUCP;
    }

    public void setIdZonaPUCP(int idZonaPUCP) {
        this.idZonaPUCP = idZonaPUCP;
    }

    public String getNombreZona() {
        return nombreZona;
    }

    public void setNombreZona(String nombreZona) {
        this.nombreZona = nombreZona;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
}
