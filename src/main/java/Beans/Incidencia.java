package Beans;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Incidencia {

    private Integer idIncidencia;
    private String fecha;
    private String nombreIncidencia;
    private ZonaPUCP zonaPUCP;
    private Boolean validaIncidencia;
    private String Descripcion;
    private Integer contadorReabierto;
    private TipoIncidencia tipoIncidencia;// mostratr tipo
    private NivelUrgencia nivelUrgencia;// mostratr nivel
    private Usuario usuario;
    private String otroTipo;//Otro tipo de incidencia, si es que tipo de incidencia es otro

    private EstadoIncidencia estadoIncidencia; //estado incidencia

    private IncidenciasDestacadas incidenciasDestacadas;
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

    public Integer getContadorReabierto() {
        return contadorReabierto;
    }

    public void setContadorReabierto(Integer contador_reabierto) {
        this.contadorReabierto = contador_reabierto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }


    public ZonaPUCP getZonaPUCP() {
        return zonaPUCP;
    }

    public void setZonaPUCP(ZonaPUCP zonaPUCP) {
        this.zonaPUCP = zonaPUCP;
    }

    public String getOtroTipo() {
        return otroTipo;
    }

    public void setOtroTipo(String otroTipo) {
        this.otroTipo = otroTipo;
    }

    public IncidenciasDestacadas getIncidenciasDestacadas() {
        return incidenciasDestacadas;
    }

    public void setIncidenciasDestacadas(IncidenciasDestacadas incidenciasDestacadas) {
        this.incidenciasDestacadas = incidenciasDestacadas;
    }
}
