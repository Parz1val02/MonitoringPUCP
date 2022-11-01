insert into tipoincidencia(tipo) 
		values ("Accidente"),
			("Reporte de robos"),
            ("Infraestuctura en mal estado"),
            ("Objetos perdidos"),
            ("Ambulancia PUCP"),
            ("Otros");
update tipoincidencia set tipo="Infraestructura en mal estado" where idTipoIncidencia=3;

insert into nivelurgencia (nivel) values ("Leve"), ("Moderado"), ("Critico");
insert into estadoincidencia (estado) values ("En proceso"),
																	("Registrado"),
																	("Atendido"),
                                                                    ("Resuelto");
insert into roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into categoriapucp(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de practica"),("Profesor"),("Egresado");

insert into usuarios (codigo, nombre, apellido, DNI, validaUsuario, password, nickname, idRoles, idCategoriaPUCP)
					values (20201696, "Leonardo", "Abanto", 12345678, true, "clashroyale123","Ubuntu",1,1),
                    (19905060,"Jorge","Gonzales",87654321, true,"tele1000", "master",1,4);
                    
insert into incidencia (fecha,nombreIncidencia,zonaPUCP, latitud, longitud, validaIncidencia, descripcion,
						 contadorReabierto, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario)
                         values (now(),"Explosion en KILO", "Pabellon A",-12.073157,-77.081164,true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",
                         0,1,3,1,20201696),
                         (now(),"Accidente de semana de Ingenieria","Cancha de minas",-12.072249,-77.081994,true,"Lesion de alumno en evento",0,1,2,1,19905060);
			 
insert into incidenciasdestacadas (idIncidenciaDestacadas,contadorDestacado,idIncidencia) values (1,0,1),(2,0,2);