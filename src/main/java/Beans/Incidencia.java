package Beans;

public class Incidencia {

    private Integer idIncidencia;
    private String fecha;
    private String nombreIncidencia;
    private String zonaPUCP;
    private Double latitud;
    private Double longitud;
    private Boolean validaIncidencia;
    private String Descripcion;
    private Integer contador_reabierto;
    private String TipoIncidencia;// mostratr tipo
    private String NivelUrgencia;// mostratr tipo


    private String Usuarios_nombre_completo;

    private String nombreEstado;

    private Integer contadorDestacado;

    public String getNombreEstado() {
        return nombreEstado;
    }

    public void setNombreEstado(String nombreEstado) {
        this.nombreEstado = nombreEstado;
    }

    public Integer getContadorDestacado() {
        return contadorDestacado;
    }

    public void setContadorDestacado(Integer contadorDestacado) {
        this.contadorDestacado = contadorDestacado;
    }

    public String getUsuarios_nombre_completo() {
        return Usuarios_nombre_completo;
    }

    public void setUsuarios_nombre_completo(String usuarios_nombre_completo) {
        Usuarios_nombre_completo = usuarios_nombre_completo;
    }

    public Integer getIdIncidencia() {
        return idIncidencia;
    }

    public void setIdIncidencia(Integer idIncidencia) {
        this.idIncidencia = idIncidencia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombreIncidencia() {
        return nombreIncidencia;
    }

    public void setNombreIncidencia(String nombreIncidencia) {
        this.nombreIncidencia = nombreIncidencia;
    }

    public String getZonaPUCP() {
        return zonaPUCP;
    }

    public void setZonaPUCP(String zonaPUCP) {
        this.zonaPUCP = zonaPUCP;
    }

    public Double getLatitud() {
        return latitud;
    }

    public void setLatitud(Double latitud) {
        this.latitud = latitud;
    }

    public Double getLongitud() {
        return longitud;
    }

    public void setLongitud(Double longitud) {
        this.longitud = longitud;
    }

    public Boolean getValidaIncidencia() {
        return validaIncidencia;
    }

    public void setValidaIncidencia(Boolean validaIncidencia) {
        this.validaIncidencia = validaIncidencia;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public Integer getContador_reabierto() {
        return contador_reabierto;
    }

    public void setContador_reabierto(Integer contador_reabierto) {
        this.contador_reabierto = contador_reabierto;
    }

    public String getTipoIncidencia() {
        return TipoIncidencia;
    }

    public void setTipoIncidencia(String tipoIncidencia) {
        TipoIncidencia = tipoIncidencia;
    }

    public String getNivelUrgencia() {
        return NivelUrgencia;
    }

    public void setNivelUrgencia(String nivelUrgencia) {
        NivelUrgencia = nivelUrgencia;
    }




}
