insert into TipoIncidencia(tipo) 
		values ("Accidente"),
			("Reporte de robos"),
            ("Infraestuctura en mal estado"),
            ("Objetos perdidos"),
            ("Ambulancia PUCP"),
            ("Otros");
update TipoIncidencia set tipo="Infraestructura en mal estado" where idTipoIncidencia=3;

insert into NivelUrgencia (nivel) values ("Leve"), ("Moderado"), ("Critico");
insert into EstadoIncidencia (estado) values ("Registrado"),
																	("En proceso"),
																	("Atendido"),
                                                                    ("Resuelto");
insert into Roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into CategoriaPUCP(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de practica"),("Profesor"),("Egresado");

insert into Usuarios (codigo, nombre, apellido, DNI, validaUsuario, password, nickname, idRoles, idCategoriaPUCP)
					values (20201696, "Leonardo", "Abanto", 12345678, true, "clashroyale123","Ubuntu",1,1),
                    (19905060,"Jorge","Gonzales",87654321, true,"tele1000", "master",1,4),
                    (20113456,"Goku","kakaroto",56546767, true,"milk4355", "pipipi",2,null);
                    
insert into Incidencia (fecha,nombreIncidencia,zonaPUCP, latitud, longitud, validaIncidencia, descripcion,
						 contadorReabierto, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario)
                         values (now(),"Explosion en KILO", "Pabellon A",-12.073157,-77.081164,true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",
                         0,1,3,1,20201696),
                         (now(),"Accidente de semana de Ingenieria","Cancha de minas",-12.072249,-77.081994,true,"Lesion de alumno en evento",0,1,2,1,19905060),
                         (now(),"Laptop perdida en Charlotte","McGregor",-12.072249,-77.081994,true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,4,3,1,20113456);
insert into incidenciasdestacadas (contadorDestacado,idIncidencia) values (0,1),(0,2),(1,3);
