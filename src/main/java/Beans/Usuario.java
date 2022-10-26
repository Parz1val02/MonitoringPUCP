package Beans;

public class Usuario {

    private String codigo;
    private String nombre;
    private String apellido;
    private String dni;
    private String password;
    private boolean valida;
    private String nickname;
    private Integer celular;
    private Integer idRoles;
    private Integer idCategoriaPUCP;
    private long fotoPerfil;


    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isValida() {
        return valida;
    }

    public void setValida(boolean valida) {
        this.valida = valida;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getCelular() {
        return celular;
    }

    public void setCelular(Integer celular) {
        this.celular = celular;
    }

    public Integer getIdRoles() {
        return idRoles;
    }

    public void setIdRoles(Integer idRoles) {
        this.idRoles = idRoles;
    }

    public Integer getIdCategoriaPUCP() {
        return idCategoriaPUCP;
    }

    public void setIdCategoriaPUCP(Integer idCategoriaPUCP) {
        this.idCategoriaPUCP = idCategoriaPUCP;
    }

    public long getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(long fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }
}
