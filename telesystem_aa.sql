use telesystem_aa;
insert into TipoIncidencia(tipo,iconoFoto) 
		values ("Accidente", "../iconosReabrirIncidencia/accidente.png"),
			("Reporte de robos","../iconosReabrirIncidencia/linuxuser.png"),
            ("Infraestructura en mal estado","../iconosReabrirIncidencia/mala-infraestructura.png"),
            ("Objetos perdidos","../iconosReabrirIncidencia/objetos-perdidos.png"),
            ("Ambulancia PUCP","../iconosReabrirIncidencia/ambulanciaPUCP.png"),
            ("Otros","../iconosReabrirIncidencia/otros.png");

insert into NivelUrgencia (nivel) values ("Leve"), ("Moderado"), ("Critico");
insert into EstadoIncidencia (estado) values ("Registrado"),
											("En proceso"),
											("Atendido"),
                                            ("Resuelto");
insert into Roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into CategoriaPUCP(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de practica"),("Profesor"),("Egresado");

insert into ZonaPUCP(nombreZona,latitud,longitud) values("Entrada Principal",-12.06888,-77.07805),
														("Pabellon V",-12.07316, -77.08187),
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
                                                        ("Pabellon Z", -12.06910,-77.08088),
                                                        ("Comedor Artes", -12.07039, -77.07958),
                                                        ("Facultad de Derecho", -12.07006, -77.08053),
                                                        ("Facultad de Arquitectura y Urbanismo", -12.07151,-77.08091),
                                                        ("Tinkuy",-12.06822,-77.07929),
                                                        ("Biblioteca de Ciencias Sociales", -12.07087,-77.08038),
                                                        ("DTI", -12.07046,-77.08053),
                                                        ("Tesoreria General", -12.06963,-77.07923),
                                                        ("CEPREPUC", -12.07151,-77.08091);


                                                        
insert into Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, celular, idRoles, idCategoriaPUCP, idFotoPerfil, codigo2fa, activeTime2fa)
					values (20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe", "12345678", true, sha2("clashroyale123",256),"987654321",1,1,null, null, null),
                    (19905060,"Jorge","Gonzales", "jorege.g@pucp.edu.pe","87654321", true,sha2("tele1000",256),null,1,4,null, null, null),
                    (20195922,"Carlos","Pisco", "cpisco@pucp.edu.pe","65358947", true,sha2("carlospisco.com",256),"976239385",1,5,null, null, null),
                    (20171198,"Luis","Ramos", "luis.ramost@pucp.edu.pe","78349206", true,sha2("donlucho",256),"928374937",1,3,null, null, null),
                    (20047106,"Hansel","Martinez","martinez.hj@pucp.edu.pe","49543859",true,sha2("propazzz",256),"923847189",1,4,null,null,null),
                    (20113456,"Goku","kakaroto", "goku.kakaroto@pucp.edu.pe", "56546767", true,sha2("milk4355",256),"976976976", 2,null,null, null, null);
                    
insert into Incidencias (fecha,nombreIncidencia, validaIncidencia, descripcion,
						 contadorReabierto, otroTipo, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario, idZonaPUCP)
                         values (now(),"Explosion en KILO",true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",0,"Explosion",3,1,1,20201696,9),
                         (now(),"Robo en Biblioteca Central",true,"Sujetos armados entraron a las instalaciones muy temprano, antes de que abriera",0,null,2,3,3,20201696,8),
                         (now(),"Accidente en semana de Ingenieria",true,"Lesion de alumno en evento",0,null,1,2,1,19905060,11),
                         (now(),"Laptop perdida en Charlotte",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,null,4,3,1,19905060,10),
                         (now(),"Laptop perdida en el V",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,null,4,3,1,20113456,2),
						("2022-12-01 00:00:00","Maquina malograda",true,"Maquina dispensadora malograda",0,null,3,3,1,20171198,3),
                        ("2022-11-30 00:00:00","Discusion entre alumnos",true,"Pelea a muerte de cuchillos jugando un partido de futebol",0,"Pelea",6,2,3,20201696,11),
                        ("2022-12-02 00:00:00","Inasistencia del profesor",true,"En el A-702, los alumnos no saben que hacer pipipi",0,"Falta",6,1,3,20171198,9),
                        ("2022-12-01 00:00:00","Ruidos en el cubiculo",true,"Chicos que estan gritando y no dejan estudiar tmr",0,"Ruidos molestos",6,1,3,20195922,6),
                        ("2022-12-01 00:00:00","Problemas en la graduacion",true,"No dejan entrar a mas de 2 personas ",0,"Alerta",6,1,4,20047106,5),
                        (now(),"Ransomware en el V",true,"Se colo el wannacry en el V pipipi",0,"Hackeo",6,3,1,20195922,2),
                        (now(),"Robo de bicicleta",true,"Se robaron mi bici, partieron el candado a la mitad y f",0,null,2,2,1,20047106,5);

insert into IncidenciasDestacadas (contadorDestacado,idIncidencia) values (1,12),(1,11),(1,2),(1,7),(1,1);

insert into RegistroAdmin (nombreAdmin, passwordAdmin, nombreRol, correo, codigo2fa, activeTime2fa) values("EternalBlue", sha2("EternalBlue",256), "Administrador", "EternalBlue@pucp.edu.pe", null, null);
insert into MasterTable (codigo, nombre, apellido, correo, DNI,celular,idCategoriaPUCP,primerIngreso)
values(20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe","12345678","987654321",1,0),
		(19905060,"Jorge","Gonzales", "jorege.g@pucp.edu.pe","87654321",null,4,0),
        (20195922,"Carlos","Pisco", "cpisco@pucp.edu.pe","65358947","976239385",5,0),
        (20171198,"Luis","Ramos", "luis.ramost@pucp.edu.pe","78349206","976239385",3,0),
        (20047106,"Hansel","Martinez","martinez.hj@pucp.edu.pe","49543859","923847189",4,0);
        
        
        



