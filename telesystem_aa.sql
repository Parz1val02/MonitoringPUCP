insert into TipoIncidencia(tipo) 
		values ("Accidente"),
			("Reporte de robos"),
            ("Infraestructura en mal estado"),
            ("Objetos perdidos"),
            ("Ambulancia PUCP"),
            ("Otros");

insert into NivelUrgencia (nivel) values ("Leve"), ("Moderado"), ("Critico");
insert into EstadoIncidencia (estado) values ("Registrado"),
																	("En proceso"),
																	("Atendido"),
                                                                    ("Resuelto");
insert into Roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into CategoriaPUCP(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de practica"),("Profesor"),("Egresado");

insert into ZonaPUCP(nombreZona,latitud,longitud) values("Entrada Principal",-12.068956336898212, -77.07804319110836),
														("Pabellon V",-12.07310658364993, -77.08194620101752),
                                                        ("EE.GG.CC",-12.070705979576289, -77.07939072636044),
                                                        ("EE.GG.LL",-12.06747847412385, -77.07994862590206),
                                                        ("Polidepotivo",-12.066496182128535, -77.08051323080757),
                                                        ("CIA",-12.071498096004184, -77.08033084066658),
                                                        ("Comedor Central",-12.070273199678287, -77.08143054631317),
                                                        ("Bliblioteca Central",-12.069197804278202, -77.08003311549426),
                                                        ("Aulario", -12.069197804278202, -77.08003311549426),
                                                        ("Edificio McGregor",-12.068447704957036, -77.07872784337455),
                                                        ("Cancha de Minas",-12.072218866144826, -77.08199637475859);
                                                        
insert into Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, nickname, celular, idRoles, idCategoriaPUCP, idFotoPerfil)
					values (20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe", 12345678, true, sha2("clashroyale123",256),"123456","987654321",1,1,null),
                    (19905060,"Jorge","Gonzales", "jorege.g@pucp.edu.pe",87654321, true,sha2("tele1000",256), "654321",null,1,4,null),
                    (20113456,"Goku","kakaroto", "goku.kakaroto@pucp.edu.pe", 56546767, true,sha2("milk4355",256), "123321","976976976", 2,null,null);
                    
insert into Incidencias (fecha,nombreIncidencia, validaIncidencia, descripcion,
						 contadorReabierto, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario, idZonaPUCP)
                         values (now(),"Explosion en KILO",true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",
                         0,1,3,1,20201696,9),
                         (now(),"Accidente de semana de Ingenieria",true,"Lesion de alumno en evento",0,1,2,1,19905060,11),
                         (now(),"Laptop perdida en Charlotte",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,4,3,1,20113456,10),
                         (now(),"Accidente en CIA",true,"Lesion de alumno en evento",0,1,2,1,19905060,6),
                         (now(),"Laptop perdida en el V",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,4,3,1,20113456,2);
insert into IncidenciasDestacadas (contadorDestacado,idIncidencia) values (0,1),(0,2),(1,3),(0,4),(1,5);
