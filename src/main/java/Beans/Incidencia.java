package Beans;

import java.time.LocalDateTime;

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
    private TipoIncidencia tipoIncidencia;// mostratr tipo
    private NivelUrgencia nivelUrgencia;// mostratr nivel

    private LocalDateTime fechaIncidencia;
    private String Usuarios_nombre_completo;

    private EstadoIncidencia estadoIncidencia; //estado incidencia

    private Integer contadorDestacado;

    public EstadoIncidencia getEstadoIncidencia() {
        return estadoIncidencia;
    }

    public void setEstadoIncidencia(EstadoIncidencia estadoIncidencia) {
        this.estadoIncidencia = estadoIncidencia;
    }

    public TipoIncidencia getTipoIncidencia() {
        return tipoIncidencia;
    }

    public void setTipoIncidencia(TipoIncidencia tipoIncidencia) {
        this.tipoIncidencia = tipoIncidencia;
    }

    public NivelUrgencia getNivelUrgencia() {
        return nivelUrgencia;
    }

    public void setNivelUrgencia(NivelUrgencia nivelUrgencia) {
        this.nivelUrgencia = nivelUrgencia;
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






}
