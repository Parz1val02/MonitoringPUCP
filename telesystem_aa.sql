use telesystem_aa;
insert into TipoIncidencia(tipo,iconoFoto) 
		values ("Accidente", "iconosReabrirIncidencia/accidente.png"),
			("Reporte de robos","iconosReabrirIncidencia/linuxuser.png"),
            ("Infraestructura en mal estado","iconosReabrirIncidencia/mala-infraestructura.png"),
            ("Objetos perdidos","iconosReabrirIncidencia/objetos-perdidos.png"),
            ("Ambulancia PUCP","iconosReabrirIncidencia/ambulanciaPUCP.png"),
            ("Otros","iconosReabrirIncidencia/otros.png");

insert into NivelUrgencia (nivel) values ("Leve"), ("Moderado"), ("Crítico");
insert into EstadoIncidencia (estado) values ("Registrado"),
											("En proceso"),
											("Atendido"),
                                            ("Resuelto");
insert into Roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into CategoriaPUCP(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de práctica"),("Profesor"),("Egresado");

insert into ZonaPUCP(nombreZona,latitud,longitud) values("Entrada Principal",-12.06888,-77.07805),
														("Pabellón V",-12.07316, -77.08187),
                                                        ("EE.GG.CC",-12.07102,-77.079245),
                                                        ("EE.GG.LL",-12.06752,-77.08020),
                                                        ("Coliseo Polideportivo",-12.06654,-77.08016),
                                                        ("CIA",-12.07211,-77.08012),
                                                        ("Comedor Central",-12.07044,-77.08151),
                                                        ("Biblioteca Central",-12.06910,-77.08015),
                                                        ("Aulario", -12.07271,-77.07958),
                                                        ("Edificio McGregor",-12.06850,-77.07876),
                                                        ("Cancha de Minas",-12.07214,-77.08201),
                                                        ("Digimundo", -12.07300,-77.08113),
                                                        ("Pabellón Z", -12.06910,-77.08088),
                                                        ("Comedor Artes", -12.07039, -77.07958),
                                                        ("Facultad de Derecho", -12.07006, -77.08053),
                                                        ("Facultad de Arquitectura y Urbanismo", -12.07151,-77.08091),
                                                        ("Tinkuy",-12.06822,-77.07929),
                                                        ("Biblioteca de Ciencias Sociales", -12.07087,-77.08038),
                                                        ("DTI", -12.07046,-77.08053),
                                                        ("Tesorería General", -12.06963,-77.07923),
                                                        ("CEPREPUC", -12.07151,-77.08091);


                                                        
insert into Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, celular, idRoles, idCategoriaPUCP, idFotoPerfil, codigo2fa, activeTime2fa)
					values (20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe", "61485249", true, sha2("Cl@shRoy@le123",256),"987654321",1,1,null, null, null),
                    (20200334,"Gil","Zanabria", "a20200334@pucp.edu.pe","87654321", true,sha2("Cl@shRoy@le123",256),null,1,4,null, null, null),
                    (20195922,"Carlos","Pisco", "cpisco@pucp.edu.pe","65358947", true,sha2("Cl@shRoy@le123",256),"976239385",1,5,null, null, null),
                    (20171198,"Luis","Ramos", "luis.ramost@pucp.edu.pe","78349206", true,sha2("Cl@shRoy@le123",256),"928374937",1,3,null, null, null),
                    (20200638,"Alejandro","Gutierrez","a20200638@pucp.edu.pe","49543859",true,sha2("Cl@shRoy@le123",256),"956031478",1,4,null,null,null),
                    (20202330,"Dana","Nolasco","a20202330@pucp.edu.pe","61472198",true,sha2("Cl@shRoy@le123",256),"923417981",1,2,null,null,null),
                    (20200839,"Diego","Lavado","a20200839@pucp.edu.pe","41597284",true,sha2("Cl@shRoy@le123",256),"94712498",1,1,null,null,null),
                    (20202073,"Rodrigo","Barrios","a20202073@pucp.edu.pe","79134126",true,sha2("^Etern4lBlue^",256),null,1,1,null,null,null),
                    (20113456,"Goku","kakaroto", "goku.kakaroto@pucp.edu.pe", "56546767", true,sha2("Cl@shRoy@le123",256),"976976976", 2,null,null, null, null);
                    
insert into Incidencias (fecha,nombreIncidencia, validaIncidencia, descripcion,
						 contadorReabierto, otroTipo, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario, idZonaPUCP)
                         values ("2022-12-09","Accidente de tránsito",true,"Camioneta se chocó y derribó un muro",0,null,1,3,1,20202330,12),
                         (curdate(),"Accidente en semana de Ingeniería",true,"Lesión de alumna en evento",0,null,1,2,1,20202330,11),
                         ("2022-12-09","Robo de bicicleta",true,"Se robaron mi bicicleta cerca de generales letras",0,null,2,2,1,20202073,4),
                         (curdate(),"Robo en comedor central",true,"Sujetos armados ingresaron y robaron",0,null,2,3,1,20201696,7),
                        ("2022-12-10","Problemas en la graduación",true,"No dejan entrar a las personas",0,"Alerta",6,1,1,20171198,5);
                        

insert into IncidenciasDestacadas (contadorDestacado,idIncidencia) values (1,1),(1,2),(1,3),(1,4),(1,5);

insert into RegistroAdmin (nombreAdmin, passwordAdmin, nombreRol, correo, codigo2fa, activeTime2fa) values("EternalBlue", sha2("EternalBlue",256), "Administrador", "EternalBlue@pucp.edu.pe", null, null);
insert into MasterTable (codigo, nombre, apellido, correo, DNI,celular,idCategoriaPUCP,primerIngreso)
values(20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe", "61485249","987654321",1,0),
		(20200334,"Gil","Zanabria", "a20200334@pucp.edu.pe","87654321",null,4,0),
        (20195922,"Carlos","Pisco", "cpisco@pucp.edu.pe","65358947","976239385",5,0),
        (20171198,"Luis","Ramos", "luis.ramost@pucp.edu.pe","78349206","928374937",3,0),
        (20200638,"Alejandro","Gutierrez","a20200638@pucp.edu.pe","49543859","956031478",4,0),
        (20202330,"Dana","Nolasco","a20202330@pucp.edu.pe","61472198","923417981",2,0),
        (20200839,"Diego","Lavado","a20200839@pucp.edu.pe","41597284","94712498",1,0),
        (20202073,"Rodrigo","Barrios","a20202073@pucp.edu.pe","79134126",null,1,0);
        
        
        



