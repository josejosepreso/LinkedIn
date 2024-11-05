

INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (1,'Municipio');
INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (2,'Departamento');
INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (3,'Pais');
INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (4,'Region');
INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (5,'Aldea');
INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (6,'Estado');
INSERT INTO C##LINKEDIN.TBL_TIPOS_DE_LUGARES (CODIGO_TIPO_LUGAR,NOMBRE_TIPO_LUGAR) values (7,'Colonia');

INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (1,'Honduras',1,null);
INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (2,'Francisco Morazan',2,1);
INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (3,'Tegucigalpa',6,2);
INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (4,'Comayagua',2,1);
INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (5,'Comayagua',6,4);
INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (6,'Lempira',2,1);
INSERT INTO C##LINKEDIN.TBL_LUGARES (CODIGO_LUGAR,NOMBRE_LUGAR,TIPO_DE_LUGAR,CODIGO_LUGAR_SUPERIOR) values (7,'Gracias',6,6);

INSERT INTO C##LINKEDIN.TBL_USUARIOS (CODIGO_USUARIO,CORREO,CONTRASENA,NOMBRE,APELLIDO,LUGAR_NACIMIENTO,LUGAR_RESIDENCIA,TELEFONO,FECHA_NACIMIENTO,FECHA_REGISTRO,DESCRIPCION,FOTO_PERFIL,NOMBRE_FOTO_PERFIL) VALUES (1,'josehihat@gmail.com','contra','Jose','Bautista',3,3,'66666666',TO_DATE('06-08-03', 'DD-MM-YY'),TO_DATE('12-08-24', 'DD-MM-YY'),'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',NULL,'beedrill.png');
INSERT INTO C##LINKEDIN.TBL_USUARIOS (CODIGO_USUARIO,CORREO,CONTRASENA,NOMBRE,APELLIDO,LUGAR_NACIMIENTO,LUGAR_RESIDENCIA,TELEFONO,FECHA_NACIMIENTO,FECHA_REGISTRO,DESCRIPCION,FOTO_PERFIL,NOMBRE_FOTO_PERFIL) VALUES (2,'rbautista@gmail.com','passwd','Roberto','Bautista',3,3,'11116666',TO_DATE('06-10-00', 'DD-MM-YY'),TO_DATE('12-08-24', 'DD-MM-YY'),'',NULL,'dewgon.png');
INSERT INTO C##LINKEDIN.TBL_USUARIOS (CODIGO_USUARIO,CORREO,CONTRASENA,NOMBRE,APELLIDO,LUGAR_NACIMIENTO,LUGAR_RESIDENCIA,TELEFONO,FECHA_NACIMIENTO,FECHA_REGISTRO,DESCRIPCION,FOTO_PERFIL,NOMBRE_FOTO_PERFIL) VALUES (3,'jcastro@gmail.com','oracle','Juan Jose','Castro',7,7,'11112222',TO_DATE('06-02-01', 'DD-MM-YY'),TO_DATE('12-08-24', 'DD-MM-YY'),'xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehend',NULL,NULL);
INSERT INTO C##LINKEDIN.TBL_USUARIOS (CODIGO_USUARIO,CORREO,CONTRASENA,NOMBRE,APELLIDO,LUGAR_NACIMIENTO,LUGAR_RESIDENCIA,TELEFONO,FECHA_NACIMIENTO,FECHA_REGISTRO,DESCRIPCION,FOTO_PERFIL,NOMBRE_FOTO_PERFIL) VALUES (4,'clainez@gmail.com','oracle','Cesar','Lainez',7,7,'11119999',TO_DATE('01-01-00', 'DD-MM-YY'),TO_DATE('11-08-22', 'DD-MM-YY'),'Para utilizar la secuencia, en primer lugar, crearemos una tabla de prueba (para insertar un registro y comprobar que la secuencia anterior funciona correctamente):',NULL,'haunter.png');

INSERT INTO C##LINKEDIN.TBL_EMPRESAS (CODIGO_EMPRESA,NOMBRE,UBICACION,DIRECCION,TELEFONO,SITIO_WEB,CANTIDAD_EMPLEADOS) values (1,'Google',1,'Altos de la sosa','55555555','https://www.github.com',0);
INSERT INTO C##LINKEDIN.TBL_EMPRESAS (CODIGO_EMPRESA,NOMBRE,UBICACION,DIRECCION,TELEFONO,SITIO_WEB,CANTIDAD_EMPLEADOS) values (2,'Facebook',6,'Altos de la sosa','11225555','https://www.facebook.com',0);
INSERT INTO C##LINKEDIN.TBL_EMPRESAS (CODIGO_EMPRESA,NOMBRE,UBICACION,DIRECCION,TELEFONO,SITIO_WEB,CANTIDAD_EMPLEADOS) values (3,'Apple',6,'Altos de la sosa','11226666','https://www.google.com',0);

INSERT INTO C##LINKEDIN.TBL_EXPERIENCIAS_LABORALES (CODIGO_EXPERIENCIA,CODIGO_USUARIO,CODIGO_EMPRESA,PUESTO,FECHA_INICIO,FECHA_FIN) values (1,1,1,'Gerente',TO_DATE('06-08-99', 'DD-MM-YY'),TO_DATE('06-08-03', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_EXPERIENCIAS_LABORALES (CODIGO_EXPERIENCIA,CODIGO_USUARIO,CODIGO_EMPRESA,PUESTO,FECHA_INICIO,FECHA_FIN) values (2,1,2,'Programador',TO_DATE('06-08-03', 'DD-MM-YY'),TO_DATE('06-08-10', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_EXPERIENCIAS_LABORALES (CODIGO_EXPERIENCIA,CODIGO_USUARIO,CODIGO_EMPRESA,PUESTO,FECHA_INICIO,FECHA_FIN) values (3,2,2,'Programador',TO_DATE('06-10-03', 'DD-MM-YY'),TO_DATE('06-08-09', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_EXPERIENCIAS_LABORALES (CODIGO_EXPERIENCIA,CODIGO_USUARIO,CODIGO_EMPRESA,PUESTO,FECHA_INICIO,FECHA_FIN) values (4,3,1,'CEO',TO_DATE('06-10-11', 'DD-MM-YY'),TO_DATE('06-08-22', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_EXPERIENCIAS_LABORALES (CODIGO_EXPERIENCIA,CODIGO_USUARIO,CODIGO_EMPRESA,PUESTO,FECHA_INICIO,FECHA_FIN) values (5,2,3,'Gerente',TO_DATE('06-08-99', 'DD-MM-YY'),null);

INSERT INTO C##LINKEDIN.TBL_CONEXIONES (CODIGO_USUARIO1,CODIGO_USUARIO2,FECHA,SOLICITUD_ACEPTADA) values (1,2,TO_DATE('06-08-20', 'DD-MM-YY'),1);
INSERT INTO C##LINKEDIN.TBL_CONEXIONES (CODIGO_USUARIO1,CODIGO_USUARIO2,FECHA,SOLICITUD_ACEPTADA) values (1,3,TO_DATE('06-09-20', 'DD-MM-YY'),1);
INSERT INTO C##LINKEDIN.TBL_CONEXIONES (CODIGO_USUARIO1,CODIGO_USUARIO2,FECHA,SOLICITUD_ACEPTADA) values (2,3,TO_DATE('06-10-20', 'DD-MM-YY'),1);


INSERT INTO C##LINKEDIN.TBL_GRUPOS (CODIGO_GRUPO,NOMBRE_GRUPO,CODIGO_USUARIO_CREADOR,DESCRIPCION) values (1,'Programacion',1,'Grupo para discutir sobre');
INSERT INTO C##LINKEDIN.TBL_GRUPOS (CODIGO_GRUPO,NOMBRE_GRUPO,CODIGO_USUARIO_CREADOR,DESCRIPCION) values (2,'INTROS FODA',1,'El mejor grupo del mundo');
INSERT INTO C##LINKEDIN.TBL_GRUPOS (CODIGO_GRUPO,NOMBRE_GRUPO,CODIGO_USUARIO_CREADOR,DESCRIPCION) values (3,'Anime',2,'Grupo exclusivamente para hablar sobre');

INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (1,'Java');
INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (2,'C++');
INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (3,'Photoshop');
INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (4,'Haskell');
INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (5,'Laravel');
INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (6,'Administracion de proyectos');
INSERT INTO C##LINKEDIN.TBL_HABILIDADES (CODIGO_HABILIDAD,NOMBRE) values (7,'JSP');


INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_USUARIOS (CODIGO_USUARIO,CODIGO_HABILIDAD) values (1,1);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_USUARIOS (CODIGO_USUARIO,CODIGO_HABILIDAD) values (1,2);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_USUARIOS (CODIGO_USUARIO,CODIGO_HABILIDAD) values (2,1);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_USUARIOS (CODIGO_USUARIO,CODIGO_HABILIDAD) values (1,5);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_USUARIOS (CODIGO_USUARIO,CODIGO_HABILIDAD) values (3,5);


INSERT INTO C##LINKEDIN.TBL_APROBACIONES_HABILIDADES (CODIGO_APROBACION,CODIGO_USUARIO_APRUEBA,CODIGO_USUARIO,CODIGO_HABILIDAD,FECHA) values (1,3,1,1,TO_DATE('06-08-19', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_APROBACIONES_HABILIDADES (CODIGO_APROBACION,CODIGO_USUARIO_APRUEBA,CODIGO_USUARIO,CODIGO_HABILIDAD,FECHA) values (2,3,2,1,TO_DATE('06-08-20', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_APROBACIONES_HABILIDADES (CODIGO_APROBACION,CODIGO_USUARIO_APRUEBA,CODIGO_USUARIO,CODIGO_HABILIDAD,FECHA) values (3,3,1,5,TO_DATE('06-08-21', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_APROBACIONES_HABILIDADES (CODIGO_APROBACION,CODIGO_USUARIO_APRUEBA,CODIGO_USUARIO,CODIGO_HABILIDAD,FECHA) values (4,2,3,5,TO_DATE('06-08-22', 'DD-MM-YY'));

INSERT INTO C##LINKEDIN.TBL_INSTITUCIONES (CODIGO_INSTITUCION,NOMBRE,SITIO_WEB) values (1,'Harvard','www.harvard.com');
INSERT INTO C##LINKEDIN.TBL_INSTITUCIONES (CODIGO_INSTITUCION,NOMBRE,SITIO_WEB) values (2,'MIT','www.mit.com');
INSERT INTO C##LINKEDIN.TBL_INSTITUCIONES (CODIGO_INSTITUCION,NOMBRE,SITIO_WEB) values (4,'UNAH','www.unah.edu.hn');
INSERT INTO C##LINKEDIN.TBL_INSTITUCIONES (CODIGO_INSTITUCION,NOMBRE,SITIO_WEB) values (3,'UNAM','www.localhost.com');

INSERT INTO C##LINKEDIN.TBL_TIPOS_LOGROS (CODIGO_TIPO_LOGRO,NOMBRE) values (1,'Reconocimiento');
INSERT INTO C##LINKEDIN.TBL_TIPOS_LOGROS (CODIGO_TIPO_LOGRO,NOMBRE) values (2,'Certificacion');


INSERT INTO C##LINKEDIN.TBL_LOGROS (CODIGO_LOGRO,CODIGO_USUARIO,CODIGO_TIPO_LOGRO,TITULO,FECHA_OBTENCION,REMITIDO_POR) values (1,1,1,'Nombre de logro',TO_DATE('06-08-03', 'DD-MM-YY'),1);
INSERT INTO C##LINKEDIN.TBL_LOGROS (CODIGO_LOGRO,CODIGO_USUARIO,CODIGO_TIPO_LOGRO,TITULO,FECHA_OBTENCION,REMITIDO_POR) values (2,2,1,'Modelado 3d',TO_DATE('06-08-04', 'DD-MM-YY'),2);
INSERT INTO C##LINKEDIN.TBL_LOGROS (CODIGO_LOGRO,CODIGO_USUARIO,CODIGO_TIPO_LOGRO,TITULO,FECHA_OBTENCION,REMITIDO_POR) values (3,3,2,'Programacion movil',TO_DATE('06-08-10', 'DD-MM-YY'),3);
INSERT INTO C##LINKEDIN.TBL_LOGROS (CODIGO_LOGRO,CODIGO_USUARIO,CODIGO_TIPO_LOGRO,TITULO,FECHA_OBTENCION,REMITIDO_POR) values (4,1,2,'Programacion movil',TO_DATE('06-08-10', 'DD-MM-YY'),1);


INSERT INTO C##LINKEDIN.TBL_MENSAJES_PRIVADOS (CODIGO_MENSAJE,USUARIO_EMISOR,USUARIO_RECEPTOR,FECHA,CONTENIDO) values (1,1,3,TO_DATE('06-08-03', 'DD-MM-YY'),'Hola');
INSERT INTO C##LINKEDIN.TBL_MENSAJES_PRIVADOS (CODIGO_MENSAJE,USUARIO_EMISOR,USUARIO_RECEPTOR,FECHA,CONTENIDO) values (2,3,1,TO_DATE('06-08-03', 'DD-MM-YY'),'hla');
INSERT INTO C##LINKEDIN.TBL_MENSAJES_PRIVADOS (CODIGO_MENSAJE,USUARIO_EMISOR,USUARIO_RECEPTOR,FECHA,CONTENIDO) values (3,3,2,TO_DATE('06-08-03', 'DD-MM-YY'),'AAAAA');


INSERT INTO C##LINKEDIN.TBL_MODALIDADES (CODIGO_MODALIDAD,NOMBRE_MODALIDAD) values (1,'Presencial');
INSERT INTO C##LINKEDIN.TBL_MODALIDADES (CODIGO_MODALIDAD,NOMBRE_MODALIDAD) values (2,'Remoto');
INSERT INTO C##LINKEDIN.TBL_MODALIDADES (CODIGO_MODALIDAD,NOMBRE_MODALIDAD) values (3,'Hibrido');




INSERT INTO C##LINKEDIN.TBL_OFERTAS_LABORALES (CODIGO_OFERTA_LABORAL,TITULO,CODIGO_EMPRESA,MODALIDAD,UBICACION,FECHA_PUBLICACION,DESCRIPCION) values (1,'Desarrollador de Java',1,1,3,TO_DATE('06-08-03', 'DD-MM-YY'),'Preparate para le mejr');
INSERT INTO C##LINKEDIN.TBL_OFERTAS_LABORALES (CODIGO_OFERTA_LABORAL,TITULO,CODIGO_EMPRESA,MODALIDAD,UBICACION,FECHA_PUBLICACION,DESCRIPCION) values (2,'Disenador grafico',2,2,7,TO_DATE('06-08-23', 'DD-MM-YY'),'El mejor trabajo del mundo');
INSERT INTO C##LINKEDIN.TBL_OFERTAS_LABORALES (CODIGO_OFERTA_LABORAL,TITULO,CODIGO_EMPRESA,MODALIDAD,UBICACION,FECHA_PUBLICACION,DESCRIPCION) values (3,'Desarrollador de Haskell',3,2,3,TO_DATE('06-08-24', 'DD-MM-YY'),'El mejor trabajo del mundo');



INSERT INTO C##LINKEDIN.TBL_PUBLICACIONES (CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,FECHA_PUBLICACION) values (1,1,'Hola a todos',TO_DATE('06-08-13', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_PUBLICACIONES (CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,FECHA_PUBLICACION) values (2,1,'Publicacion',TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_PUBLICACIONES (CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,FECHA_PUBLICACION) values (3,2,'Mi primer publicacion',TO_DATE('06-08-18', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_PUBLICACIONES (CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,FECHA_PUBLICACION) values (4,3,'x2 Mi primer publicacion',TO_DATE('06-08-18', 'DD-MM-YY'));

INSERT INTO C##LINKEDIN.TBL_REACCIONES (CODIGO_REACCION,NOMBRE_REACCION) values (1,'Recomendar');
INSERT INTO C##LINKEDIN.TBL_REACCIONES (CODIGO_REACCION,NOMBRE_REACCION) values (2,'Celebrar');
INSERT INTO C##LINKEDIN.TBL_REACCIONES (CODIGO_REACCION,NOMBRE_REACCION) values (3,'Apoyar');
INSERT INTO C##LINKEDIN.TBL_REACCIONES (CODIGO_REACCION,NOMBRE_REACCION) values (4,'Encantar');
INSERT INTO C##LINKEDIN.TBL_REACCIONES (CODIGO_REACCION,NOMBRE_REACCION) values (5,'Interesar');
INSERT INTO C##LINKEDIN.TBL_REACCIONES (CODIGO_REACCION,NOMBRE_REACCION) values (6,'Hacer gracia');


INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_PUBLICACION (CODIGO_PUBLICACION,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (1,1,1,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_PUBLICACION (CODIGO_PUBLICACION,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (2,1,2,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_PUBLICACION (CODIGO_PUBLICACION,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (2,3,2,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_PUBLICACION (CODIGO_PUBLICACION,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (4,3,4,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_PUBLICACION (CODIGO_PUBLICACION,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (3,1,1,TO_DATE('06-08-23', 'DD-MM-YY'));



INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (1,1,1,'Primer comentario',null,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (2,2,1,'Buenas',null,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (3,2,2,'Hola',2,TO_DATE('06-08-24', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (4,1,2,'EEEEEEE',null,TO_DATE('06-08-24', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (5,3,3,'ZZZZZZZ',null,TO_DATE('06-07-26', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (6,1,3,'ZZZZZZZ',4,TO_DATE('06-08-25', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (7,1,1,'Jerarquia de comentarios',6,TO_DATE('06-08-25', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA) values (8,1,2,'Buenas noches',null,TO_DATE('06-08-25', 'DD-MM-YY'));



INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_COMENTARIO (CODIGO_COMENTARIO,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (1,1,1,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_COMENTARIO (CODIGO_COMENTARIO,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (1,2,1,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_COMENTARIO (CODIGO_COMENTARIO,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (4,1,3,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_COMENTARIO (CODIGO_COMENTARIO,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (2,1,3,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_REACCIONES_POR_COMENTARIO (CODIGO_COMENTARIO,CODIGO_USUARIO,CODIGO_REACCION,FECHA) values (5,3,1,TO_DATE('06-08-23', 'DD-MM-YY'));


INSERT INTO C##LINKEDIN.TBL_SEGUIDORES (CODIGO_USUARIO_SEGUIDOR,CODIGO_USUARIO_SIGUIENDO,FECHA) values (1,3,TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_SEGUIDORES (CODIGO_USUARIO_SEGUIDOR,CODIGO_USUARIO_SIGUIENDO,FECHA) values (3,2,TO_DATE('06-10-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_SEGUIDORES (CODIGO_USUARIO_SEGUIDOR,CODIGO_USUARIO_SIGUIENDO,FECHA) values (3,1,TO_DATE('06-10-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_SEGUIDORES (CODIGO_USUARIO_SEGUIDOR,CODIGO_USUARIO_SIGUIENDO,FECHA) values (1,2,TO_DATE('06-10-23', 'DD-MM-YY'));


INSERT INTO C##LINKEDIN.TBL_TITULOS_ACADEMICOS (CODIGO_TITULO_ACADEMICO,CODIGO_USUARIO,CODIGO_INSTITUCION,TITULO,AREA_DE_ESTUDIO,FECHA_INICIO,FECHA_FIN) values (1,1,1,'Ingenieria en Sistemas','Economia',TO_DATE('06-08-19', 'DD-MM-YY'),TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_TITULOS_ACADEMICOS (CODIGO_TITULO_ACADEMICO,CODIGO_USUARIO,CODIGO_INSTITUCION,TITULO,AREA_DE_ESTUDIO,FECHA_INICIO,FECHA_FIN) values (2,2,3,'Ingenieria Electrica','Area',TO_DATE('06-08-16', 'DD-MM-YY'),TO_DATE('06-08-23', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_TITULOS_ACADEMICOS (CODIGO_TITULO_ACADEMICO,CODIGO_USUARIO,CODIGO_INSTITUCION,TITULO,AREA_DE_ESTUDIO,FECHA_INICIO,FECHA_FIN) values (3,1,3,'Matematicas','Ciencias',TO_DATE('06-08-21', 'DD-MM-YY'),TO_DATE('06-08-26', 'DD-MM-YY'));
INSERT INTO C##LINKEDIN.TBL_TITULOS_ACADEMICOS (CODIGO_TITULO_ACADEMICO,CODIGO_USUARIO,CODIGO_INSTITUCION,TITULO,AREA_DE_ESTUDIO,FECHA_INICIO,FECHA_FIN) values (4,3,2,'Fisica','Ciencias',TO_DATE('06-08-11', 'DD-MM-YY'),TO_DATE('06-08-26', 'DD-MM-YY'));


INSERT INTO C##LINKEDIN.TBL_USUARIOS_POR_GRUPOS (CODIGO_GRUPO,CODIGO_USUARIO,FECHA,SOLICITUD_ACEPTADA) values (1,1,TO_DATE('06-08-23', 'DD-MM-YY'),0);
INSERT INTO C##LINKEDIN.TBL_USUARIOS_POR_GRUPOS (CODIGO_GRUPO,CODIGO_USUARIO,FECHA,SOLICITUD_ACEPTADA) values (1,2,TO_DATE('06-08-21', 'DD-MM-YY'),1);
INSERT INTO C##LINKEDIN.TBL_USUARIOS_POR_GRUPOS (CODIGO_GRUPO,CODIGO_USUARIO,FECHA,SOLICITUD_ACEPTADA) values (1,3,TO_DATE('06-08-17', 'DD-MM-YY'),1);
INSERT INTO C##LINKEDIN.TBL_USUARIOS_POR_GRUPOS (CODIGO_GRUPO,CODIGO_USUARIO,FECHA,SOLICITUD_ACEPTADA) values (2,1,TO_DATE('06-08-17', 'DD-MM-YY'),1);
INSERT INTO C##LINKEDIN.TBL_USUARIOS_POR_GRUPOS (CODIGO_GRUPO,CODIGO_USUARIO,FECHA,SOLICITUD_ACEPTADA) values (3,1,TO_DATE('06-08-17', 'DD-MM-YY'),1);


INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (1,1);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (1,2);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (1,3);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (2,3);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (2,1);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (3,6);
INSERT INTO C##LINKEDIN.TBL_HABILIDADES_POR_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_HABILIDAD) values (3,1);


INSERT INTO C##LINKEDIN.TBL_APLICACIONES_A_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_USUARIO,FECHA_APLICACION,CV) values (1,1,TO_DATE('06-08-23', 'DD-MM-YY'),null);
INSERT INTO C##LINKEDIN.TBL_APLICACIONES_A_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_USUARIO,FECHA_APLICACION,CV) values (2,1,TO_DATE('06-08-21', 'DD-MM-YY'),null);
INSERT INTO C##LINKEDIN.TBL_APLICACIONES_A_OFERTAS (CODIGO_OFERTA_LABORAL,CODIGO_USUARIO,FECHA_APLICACION,CV) values (3,2,TO_DATE('06-08-11', 'DD-MM-YY'),null);

commit;