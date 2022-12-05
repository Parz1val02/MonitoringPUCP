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

insert into ZonaPUCP(nombreZona,latitud,longitud) values("Entrada Principal",-12.068943627735932, -77.07804617947271),
														("Pabellon V",-12.073049782830466, -77.08188844434609),
                                                        ("EE.GG.CC",-12.070409837927196, -77.07936448566215),
                                                        ("EE.GG.LL",-12.06751019627539, -77.07989958631606),
                                                        ("Coliseo Polideportivo",-12.066555445351485, -77.08052990542774),
                                                        ("CIA",-12.066555445351485, -77.08052990542774),
                                                        ("Comedor Central",-12.070392788989958, -77.08148611292197),
                                                        ("Bliblioteca Central",-12.06915346152741, -77.08011550413933),
                                                        ("Aulario", -12.07263339979541, -77.07957369794897),
                                                        ("Edificio McGregor",-12.068442648880962, -77.0787516008722),
                                                        ("Cancha de Minas",-12.072169804037786, -77.08198366280472),
                                                        ("Puerta Urubamba", -12.073360594263976, -77.08231893892034),
                                                        ("Digimundo", -12.073121912066394, -77.08103952525681),
                                                        ("Gimnasio", -12.06602101936999, -77.07959113248918),
                                                        ("Facultad de Artes Escenicas", -12.06602101936999, -77.07959113248918),
                                                        ("Puerta Artes", -12.066098396462301, -77.07798314828415),
                                                        ("Pabellon Z", -12.069106904623656, -77.08096576449445),
                                                        ("Comedor Artes", -12.070287216835743, -77.07950798395541),
                                                        ("Facultad de Derecho", -12.069483293637324, -77.08054465775292),
                                                        ("Facultad de Arquitectura y Urbanismo", -12.071407852879418, -77.08087859276775),
                                                        ("Facultad de Ciencias Sociales", -12.070749504356801, -77.08024156813173),
                                                        ("DTI", -12.071291133826051, -77.08025900252385);
                                                        
insert into Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, celular, idRoles, idCategoriaPUCP, idFotoPerfil, codigo2fa, activeTime2fa, primerIngreso)
					values (20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe", 12345678, true, sha2("clashroyale123",256),"987654321",1,1,null, null, null,1),
                    (19905060,"Jorge","Gonzales", "jorege.g@pucp.edu.pe",87654321, true,sha2("tele1000",256),null,1,4,null, null, null,1),
                    (20195922,"Carlos","Pisco", "cpisco@pucp.edu.pe",65358947, true,sha2("carlospisco.com",256),976239385,1,5,null, null, null,1),
                    (20171198,"Luis","Ramos", "luis.ramost@pucp.edu.pe",78349206, true,sha2("Starlight",256),928374937,1,3,null, null, null,1),
                    (20047106,"Hansel","Martinez","martinez.hj@pucp.edu.pe",49543859,true,sha2("propazzz",256),923847189,1,4,null,null,null,1),
                    (20113456,"Goku","kakaroto", "goku.kakaroto@pucp.edu.pe", 56546767, true,sha2("milk4355",256),"976976976", 2,null,null, null, null,1);
                    
insert into Incidencias (fecha,nombreIncidencia, validaIncidencia, descripcion,
						 contadorReabierto, otroTipo, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario, idZonaPUCP)
                         values (now(),"Explosion en KILO",true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",6,"Explosion",3,1,1,20201696,9),
                         (now(),"Robo en Bilioteca Central",true,"Sujetos armados entraron a las instalaciones muy temprano, antes de que abriera",1,null,2,3,3,20201696,8),
                         (now(),"Accidente de semana de Ingenieria",true,"Lesion de alumno en evento",0,null,1,2,1,19905060,11),
                         (now(),"Laptop perdida en Charlotte",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,null,4,3,1,19905060,10),
                         (now(),"Accidente en CIA",true,"Lesion de alumno en evento",0,null,1,2,1,19905060,6),
                         (now(),"Laptop perdida en el V",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,null,4,3,1,20113456,2),
                         (now(),"Explosion en KILO",true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",0,null,1,3,1,20201696,9),
                         (now(),"Accidente de semana de Ingenieria",true,"Lesion de alumno en evento",0,null,1,2,1,19905060,11),
                         (now(),"Laptop perdida en Charlotte",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,null,4,3,1,20195922,10),
                         (now(),"Accidente en CIA",true,"Lesion de alumno en evento",0,null,1,2,1,19905060,6),
                         (now(),"Laptop perdida en el V",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,null,4,3,1,20047106,2),
						("2022-12-01 00:00:00","Maquina malograda",true,"Maquina dispensadora malograda",0,null,3,3,1,20171198,3),
                        ("2022-11-30 00:00:00","Discusion entre alumnos",true,"Pelea a muerte de cuchillos jugando un partido de futebol",0,"Pelea",6,2,3,20201696,11),
                        ("2022-12-02 00:00:00","Inasistencia del profesor",true,"En el A-702, los alumnos no saben que hacer pipipi",0,"Falta",6,1,3,20171198,9),
                        ("2022-12-01 00:00:00","Ruidos en el cubiculo",true,"Chicos que estan gritando y no dejan estudiar tmr",0,"Ruidos molestos",6,1,3,20195922,6),
                        ("2022-12-01 00:00:00","Problemas en la graduacion",true,"No dejan entrar a mas de 2 personas ",0,"Alerta",6,1,4,20047106,5),
                        ("2022-12-02 00:00:00","Asesinato",true,"Alguien se tiró del piso 5",0,"Suicidio",6,3,3,20047106,10),
                        ("2022-12-01 00:00:00","Puerta cerrada",true,"Ingreso cerrado a las 5pm",0,"Necesidad",6,1,3,20171198,3),
                        (now(),"Ransomware en el V",true,"Se colo el wannacry en el V pipipi",0,"Hackeo",6,3,1,20195922,2),
                        (now(),"Robo de bibicleta",true,"Se robaron mi bici, partieron el candado a la mitad y f",0,null,2,2,1,20047106,5);

insert into IncidenciasDestacadas (contadorDestacado,idIncidencia) values (1,1),(1,2),(1,3),(1,4),(1,5);

insert into RegistroAdmin (nombreAdmin, passwordAdmin, nombreRol, correo, codigo2fa, activeTime2fa) values("EternalBlue", sha2("EternalBlue",256), "Administrador", "EternalBlue@pucp.edu.pe", null, null);
insert into MasterTable(codigo, nombre, apellido, correo, DNI)
values(20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe",12345678),
(19905060,"Jorge","Gonzales", "jorege.g@pucp.edu.pe",87654321),
(20113456,"Goku","kakaroto", "goku.kakaroto@pucp.edu.pe", 56546767),
(20195922,"Carlos","Pisco", "cpisco@pucp.edu.pe",65358947),
(20171198,"Luis","Ramos", "luis.ramost@pucp.edu.pe",78349206),
(20047106,"Hansel","Martinez","martinez.hj@pucp.edu.pe",49543859);

UPDATE telesystem_aa.zonapucp SET latitud = '-12.07316', longitud = '-77.08187' WHERE (idZonaPUCP = '2');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.07211', longitud = '-77.08011' WHERE (idZonaPUCP = '6');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.07214', longitud = '-77.08201' WHERE (idZonaPUCP = '11');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.07046', longitud = '-77.08153' WHERE (idZonaPUCP = '7');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.06853', longitud = '-77.07865' WHERE (idZonaPUCP = '10');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.06912', longitud = '-77.08013' WHERE (idZonaPUCP = '8');
UPDATE telesystem_aa.zonapucp SET nombreZona = 'Polideportivo', latitud = '-12.06659', longitud = '-77.08016' WHERE (idZonaPUCP = '5');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.06753', longitud = '-77.08002' WHERE (idZonaPUCP = '4');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.06890', longitud = '-77.07823' WHERE (idZonaPUCP = '1');
UPDATE telesystem_aa.zonapucp SET latitud = '-12.07104', longitud = '-77.07923' WHERE (idZonaPUCP = '3');
INSERT INTO telesystem_aa.zonapucp (idZonaPUCP, nombreZona, latitud, longitud) VALUES ('12', 'Arquitectura', '-12.07153', '-77.08088');
INSERT INTO telesystem_aa.zonapucp (idZonaPUCP, nombreZona, latitud, longitud) VALUES ('13', 'CeprePUCP', '-12.07282', '-77.07875');