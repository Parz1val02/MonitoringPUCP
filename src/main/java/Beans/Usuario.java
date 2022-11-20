package Beans;

import java.io.File;

public class Usuario {

    private String codigo;
    private String nombre;
    private String apellido;
    private String correo;
    private String dni;
    private String password;
    private boolean valida;
    private String nickname;
    private String celular;
    private Rol rol;
    private CategoriaPUCP categoriaPUCP;
    private FotoPerfil fotoPerfil;

    public Usuario() {
    }

    public Usuario(String codigo, String nombre, String apellido, String correo, String dni, String celular, FotoPerfil fotoPerfil, Rol rol, CategoriaPUCP categoriaPUCP, String password, String nickname) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.dni = dni;
        this.celular = celular;
        this.setFotoPerfil(fotoPerfil);
        this.rol = rol;
        this.categoriaPUCP = categoriaPUCP;
        this.password=password;
        this.nickname=nickname;
    }


    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public CategoriaPUCP getCategoriaPUCP() {
        return categoriaPUCP;
    }

    public void setCategoriaPUCP(CategoriaPUCP categoriaPUCP) {
        this.categoriaPUCP = categoriaPUCP;
    }

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

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }


    public FotoPerfil getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(FotoPerfil fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }
}
