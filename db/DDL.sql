CREATE TABLE tbl_aplicaciones_a_ofertas (
    codigo_oferta_laboral INTEGER NOT NULL,
    codigo_usuario        INTEGER NOT NULL,
    fecha_aplicacion      DATE NOT NULL,
    cv                    BLOB
);

ALTER TABLE tbl_aplicaciones_a_ofertas ADD CONSTRAINT aplicaciones_ofertas_pk PRIMARY KEY ( codigo_oferta_laboral,
                                                                                            codigo_usuario );

CREATE TABLE tbl_aprobaciones_habilidades (
    codigo_aprobacion      INTEGER NOT NULL,
    codigo_usuario_aprueba INTEGER NOT NULL,
    codigo_usuario         INTEGER NOT NULL,
    codigo_habilidad       INTEGER NOT NULL,
    fecha                  DATE NOT NULL
);

ALTER TABLE tbl_aprobaciones_habilidades ADD CONSTRAINT aprobaciones_habilidades_pk PRIMARY KEY ( codigo_aprobacion );

CREATE TABLE tbl_comentarios (
    codigo_comentario          INTEGER NOT NULL,
    codigo_publicacion         INTEGER NOT NULL,
    codigo_usuario             INTEGER NOT NULL,
    contenido                  VARCHAR2(100) NOT NULL,
    codigo_comentario_superior INTEGER,
    fecha                      DATE NOT NULL
);

ALTER TABLE tbl_comentarios ADD CONSTRAINT tbl_comentarios_pk PRIMARY KEY ( codigo_comentario );

CREATE TABLE tbl_conexiones (
    codigo_usuario1    INTEGER NOT NULL,
    codigo_usuario2    INTEGER NOT NULL,
    fecha              DATE NOT NULL,
    solicitud_aceptada CHAR(1) NOT NULL
);

ALTER TABLE tbl_conexiones ADD CONSTRAINT tbl_conexiones_pk PRIMARY KEY ( codigo_usuario1,
                                                                          codigo_usuario2 );

CREATE TABLE tbl_empresas (
    codigo_empresa     INTEGER NOT NULL,
    nombre             VARCHAR2(50) NOT NULL,
    ubicacion          INTEGER NOT NULL,
    direccion          VARCHAR2(100) NOT NULL,
    telefono           VARCHAR2(10) NOT NULL,
    sitio_web          VARCHAR2(50) NOT NULL,
    cantidad_empleados INTEGER NOT NULL,
    foto_perfil        VARCHAR2(100)
);

ALTER TABLE tbl_empresas ADD CONSTRAINT tbl_empresas_pk PRIMARY KEY ( codigo_empresa );

CREATE TABLE tbl_experiencias_laborales (
    codigo_experiencia INTEGER NOT NULL,
    codigo_usuario     INTEGER NOT NULL,
    codigo_empresa     INTEGER NOT NULL,
    puesto             VARCHAR2(100) NOT NULL,
    fecha_inicio       DATE NOT NULL,
    fecha_fin          DATE
);

ALTER TABLE tbl_experiencias_laborales ADD CONSTRAINT tbl_experiencias_laborales_pk PRIMARY KEY ( codigo_experiencia );

CREATE TABLE tbl_grupos (
    codigo_grupo           INTEGER NOT NULL,
    nombre_grupo           VARCHAR2(50) NOT NULL,
    codigo_usuario_creador INTEGER NOT NULL,
    descripcion            VARCHAR2(100)
);

ALTER TABLE tbl_grupos ADD CONSTRAINT tbl_grupos_pk PRIMARY KEY ( codigo_grupo );

CREATE TABLE tbl_habilidades (
    codigo_habilidad INTEGER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_habilidades ADD CONSTRAINT tbl_habilidades_pk PRIMARY KEY ( codigo_habilidad );

CREATE TABLE tbl_habilidades_por_ofertas (
    codigo_oferta_laboral INTEGER NOT NULL,
    codigo_habilidad      INTEGER NOT NULL
);

ALTER TABLE tbl_habilidades_por_ofertas ADD CONSTRAINT tbl_habilidades_por_ofertas_pk PRIMARY KEY ( codigo_oferta_laboral,
                                                                                                    codigo_habilidad );

CREATE TABLE tbl_habilidades_por_usuarios (
    codigo_usuario   INTEGER NOT NULL,
    codigo_habilidad INTEGER NOT NULL
);

ALTER TABLE tbl_habilidades_por_usuarios ADD CONSTRAINT habilidades_usuarios_pk PRIMARY KEY ( codigo_usuario,
                                                                                              codigo_habilidad );

CREATE TABLE tbl_instituciones (
    codigo_institucion INTEGER NOT NULL,
    nombre             VARCHAR2(50),
    sitio_web          VARCHAR2(50)
);

ALTER TABLE tbl_instituciones ADD CONSTRAINT tbl_instituciones_pk PRIMARY KEY ( codigo_institucion );

CREATE TABLE tbl_logros (
    codigo_logro      INTEGER NOT NULL,
    codigo_usuario    INTEGER NOT NULL,
    codigo_tipo_logro INTEGER NOT NULL,
    titulo            VARCHAR2(50) NOT NULL,
    fecha_obtencion   DATE NOT NULL,
    remitido_por      VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_logros ADD CONSTRAINT tbl_logros_pk PRIMARY KEY ( codigo_logro );

CREATE TABLE tbl_lugares (
    codigo_lugar          INTEGER NOT NULL,
    nombre_lugar          VARCHAR2(50) NOT NULL,
    codigo_lugar_superior INTEGER,
    tipo_de_lugar         INTEGER NOT NULL
);

ALTER TABLE tbl_lugares ADD CONSTRAINT tbl_lugares_pk PRIMARY KEY ( codigo_lugar );

CREATE TABLE tbl_mensajes_privados (
    codigo_mensaje   INTEGER NOT NULL,
    usuario_emisor   INTEGER NOT NULL,
    usuario_receptor INTEGER NOT NULL,
    contenido        VARCHAR2(100) NOT NULL,
    fecha            DATE NOT NULL
);

ALTER TABLE tbl_mensajes_privados ADD CONSTRAINT tbl_mensajes_privados_pk PRIMARY KEY ( codigo_mensaje );

CREATE TABLE tbl_modalidades (
    codigo_modalidad INTEGER NOT NULL,
    nombre_modalidad VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_modalidades ADD CONSTRAINT tbl_modalidades_pk PRIMARY KEY ( codigo_modalidad );

CREATE TABLE tbl_ofertas_laborales (
    codigo_oferta_laboral INTEGER NOT NULL,
    titulo                VARCHAR2(100) NOT NULL,
    codigo_empresa        INTEGER NOT NULL,
    modalidad             INTEGER NOT NULL,
    ubicacion             INTEGER NOT NULL,
    fecha_publicacion     DATE NOT NULL,
    descripcion           VARCHAR2(100) NOT NULL,
    foto                  VARCHAR2(100)
);

ALTER TABLE tbl_ofertas_laborales ADD CONSTRAINT tbl_ofertas_laborales_pk PRIMARY KEY ( codigo_oferta_laboral );

CREATE TABLE tbl_publicaciones (
    codigo_publicacion INTEGER NOT NULL,
    codigo_usuario     INTEGER NOT NULL,
    contenido          VARCHAR2(100) NOT NULL,
    fecha_publicacion  DATE NOT NULL,
    foto               VARCHAR2(100)
);

ALTER TABLE tbl_publicaciones ADD CONSTRAINT tbl_publicaciones_pk PRIMARY KEY ( codigo_publicacion );

CREATE TABLE tbl_reacciones (
    codigo_reaccion INTEGER NOT NULL,
    nombre_reaccion VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_reacciones ADD CONSTRAINT tbl_reacciones_pk PRIMARY KEY ( codigo_reaccion );

CREATE TABLE tbl_reacciones_por_comentario (
    codigo_comentario INTEGER NOT NULL,
    codigo_usuario    INTEGER NOT NULL,
    codigo_reaccion   INTEGER NOT NULL,
    fecha             DATE NOT NULL
);

CREATE TABLE tbl_reacciones_por_publicacion (
    codigo_publicacion INTEGER NOT NULL,
    codigo_usuario     INTEGER NOT NULL,
    codigo_reaccion    INTEGER NOT NULL,
    fecha              DATE NOT NULL
);

ALTER TABLE tbl_reacciones_por_publicacion ADD CONSTRAINT tbl_reacciones_publicacion_pk PRIMARY KEY ( codigo_publicacion,
                                                                                                      codigo_usuario );

CREATE TABLE tbl_seguidores (
    codigo_usuario_seguidor  INTEGER NOT NULL,
    codigo_usuario_siguiendo INTEGER NOT NULL,
    fecha                    DATE NOT NULL
);

ALTER TABLE tbl_seguidores ADD CONSTRAINT tbl_seguidores_pk PRIMARY KEY ( codigo_usuario_seguidor,
                                                                          codigo_usuario_siguiendo );

CREATE TABLE tbl_tipos_de_lugares (
    codigo_tipo_lugar INTEGER NOT NULL,
    nombre_tipo_lugar VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_tipos_de_lugares ADD CONSTRAINT tbl_tipos_de_lugares_pk PRIMARY KEY ( codigo_tipo_lugar );

CREATE TABLE tbl_tipos_logros (
    codigo_tipo_logro INTEGER NOT NULL,
    nombre            VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_tipos_logros ADD CONSTRAINT tbl_tipos_logros_pk PRIMARY KEY ( codigo_tipo_logro );

CREATE TABLE tbl_titulos_academicos (
    codigo_titulo_academico INTEGER NOT NULL,
    codigo_usuario          INTEGER NOT NULL,
    codigo_institucion      INTEGER NOT NULL,
    titulo                  VARCHAR2(50) NOT NULL,
    area_de_estudio         VARCHAR2(50) NOT NULL,
    fecha_inicio            DATE NOT NULL,
    fecha_fin               DATE
);

ALTER TABLE tbl_titulos_academicos ADD CONSTRAINT tbl_titulos_academicos_pk PRIMARY KEY ( codigo_titulo_academico );

CREATE TABLE tbl_usuarios (
    codigo_usuario     INTEGER NOT NULL,
    correo             VARCHAR2(50) NOT NULL,
    contrasena         VARCHAR2(50) NOT NULL,
    nombre             VARCHAR2(30) NOT NULL,
    apellido           VARCHAR2(30) NOT NULL,
    descripcion        VARCHAR2(255),
    lugar_nacimiento   INTEGER NOT NULL,
    lugar_residencia   INTEGER NOT NULL,
    telefono           VARCHAR2(50),
    fecha_nacimiento   DATE NOT NULL,
    fecha_registro     DATE NOT NULL,
    foto_perfil        BLOB,
    nombre_foto_perfil VARCHAR2(100)
);

ALTER TABLE tbl_usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( codigo_usuario );

CREATE TABLE tbl_usuarios_por_grupos (
    codigo_grupo       INTEGER NOT NULL,
    codigo_usuario     INTEGER NOT NULL,
    fecha              DATE NOT NULL,
    solicitud_aceptada CHAR(1) NOT NULL
);

ALTER TABLE tbl_aplicaciones_a_ofertas
    ADD CONSTRAINT aplicaciones_ofertas_fk FOREIGN KEY ( codigo_oferta_laboral )
        REFERENCES tbl_ofertas_laborales ( codigo_oferta_laboral );

ALTER TABLE tbl_aplicaciones_a_ofertas
    ADD CONSTRAINT aplicaciones_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_aprobaciones_habilidades
    ADD CONSTRAINT aprobacion_habilidades_fk FOREIGN KEY ( codigo_usuario,
                                                           codigo_habilidad )
        REFERENCES tbl_habilidades_por_usuarios ( codigo_usuario,
                                                  codigo_habilidad );

ALTER TABLE tbl_aprobaciones_habilidades
    ADD CONSTRAINT aprobacion_usuario_fk FOREIGN KEY ( codigo_usuario_aprueba )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_comentarios
    ADD CONSTRAINT comentarios_fk FOREIGN KEY ( codigo_comentario_superior )
        REFERENCES tbl_comentarios ( codigo_comentario );

ALTER TABLE tbl_comentarios
    ADD CONSTRAINT comentarios_publicaciones_fk FOREIGN KEY ( codigo_publicacion )
        REFERENCES tbl_publicaciones ( codigo_publicacion );

ALTER TABLE tbl_comentarios
    ADD CONSTRAINT comentarios_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_conexiones
    ADD CONSTRAINT conexiones_usuarios_fk FOREIGN KEY ( codigo_usuario1 )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_conexiones
    ADD CONSTRAINT conexionesl_usuarios_fkv2 FOREIGN KEY ( codigo_usuario2 )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_experiencias_laborales
    ADD CONSTRAINT experiencias_laborales_emp_fk FOREIGN KEY ( codigo_empresa )
        REFERENCES tbl_empresas ( codigo_empresa );

ALTER TABLE tbl_experiencias_laborales
    ADD CONSTRAINT experiencias_laborales_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_habilidades_por_ofertas
    ADD CONSTRAINT habilidades_ofertas_hab_fk FOREIGN KEY ( codigo_habilidad )
        REFERENCES tbl_habilidades ( codigo_habilidad );

ALTER TABLE tbl_habilidades_por_ofertas
    ADD CONSTRAINT habilidades_ofertas_ofe_fk FOREIGN KEY ( codigo_oferta_laboral )
        REFERENCES tbl_ofertas_laborales ( codigo_oferta_laboral );

ALTER TABLE tbl_habilidades_por_usuarios
    ADD CONSTRAINT habilidades_usuarios_hab_fk FOREIGN KEY ( codigo_habilidad )
        REFERENCES tbl_habilidades ( codigo_habilidad );

ALTER TABLE tbl_habilidades_por_usuarios
    ADD CONSTRAINT habilidades_usuarios_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_lugares
    ADD CONSTRAINT lugares_tipos_de_lugares_fk FOREIGN KEY ( tipo_de_lugar )
        REFERENCES tbl_tipos_de_lugares ( codigo_tipo_lugar );

ALTER TABLE tbl_mensajes_privados
    ADD CONSTRAINT mensajes_privados_usua_fk FOREIGN KEY ( usuario_emisor )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_mensajes_privados
    ADD CONSTRAINT mensajes_privados_usua_fkv2 FOREIGN KEY ( usuario_receptor )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_ofertas_laborales
    ADD CONSTRAINT ofertas_laborales_empresas_fk FOREIGN KEY ( codigo_empresa )
        REFERENCES tbl_empresas ( codigo_empresa );

ALTER TABLE tbl_ofertas_laborales
    ADD CONSTRAINT ofertas_laborales_lugares_fk FOREIGN KEY ( ubicacion )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_ofertas_laborales
    ADD CONSTRAINT ofertas_laborales_modalid_fk FOREIGN KEY ( modalidad )
        REFERENCES tbl_modalidades ( codigo_modalidad );

ALTER TABLE tbl_publicaciones
    ADD CONSTRAINT publicaciones_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_reacciones_por_comentario
    ADD CONSTRAINT reacciones_comentario_com_fk FOREIGN KEY ( codigo_comentario )
        REFERENCES tbl_comentarios ( codigo_comentario );

ALTER TABLE tbl_reacciones_por_comentario
    ADD CONSTRAINT reacciones_comentario_reac_fk FOREIGN KEY ( codigo_reaccion )
        REFERENCES tbl_reacciones ( codigo_reaccion );

ALTER TABLE tbl_reacciones_por_comentario
    ADD CONSTRAINT reacciones_comentario_us_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_reacciones_por_publicacion
    ADD CONSTRAINT reacciones_publicacion_pub_fk FOREIGN KEY ( codigo_publicacion )
        REFERENCES tbl_publicaciones ( codigo_publicacion );

ALTER TABLE tbl_reacciones_por_publicacion
    ADD CONSTRAINT reacciones_publicacion_reac_fk FOREIGN KEY ( codigo_reaccion )
        REFERENCES tbl_reacciones ( codigo_reaccion );

ALTER TABLE tbl_reacciones_por_publicacion
    ADD CONSTRAINT reacciones_publicacion_us_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_seguidores
    ADD CONSTRAINT seguidores_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario_seguidor )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_seguidores
    ADD CONSTRAINT seguidores_tbl_usuarios_fkv2 FOREIGN KEY ( codigo_usuario_siguiendo )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_empresas
    ADD CONSTRAINT tbl_empresas_tbl_lugares_fk FOREIGN KEY ( ubicacion )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_grupos
    ADD CONSTRAINT tbl_grupos_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario_creador )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_logros
    ADD CONSTRAINT tbl_logros_tbl_tipos_logros_fk FOREIGN KEY ( codigo_tipo_logro )
        REFERENCES tbl_tipos_logros ( codigo_tipo_logro );

ALTER TABLE tbl_logros
    ADD CONSTRAINT tbl_logros_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_lugares
    ADD CONSTRAINT tbl_lugares_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_superior )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuarios_tbl_lugares_fk FOREIGN KEY ( lugar_nacimiento )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuarios_tbl_lugares_fkv2 FOREIGN KEY ( lugar_residencia )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_titulos_academicos
    ADD CONSTRAINT titulos_academicos_instit_fk FOREIGN KEY ( codigo_institucion )
        REFERENCES tbl_instituciones ( codigo_institucion );

ALTER TABLE tbl_titulos_academicos
    ADD CONSTRAINT titulos_academicos_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_usuarios_por_grupos
    ADD CONSTRAINT usuarios_grupos_grupos_fk FOREIGN KEY ( codigo_grupo )
        REFERENCES tbl_grupos ( codigo_grupo );

ALTER TABLE tbl_usuarios_por_grupos
    ADD CONSTRAINT usuarios_grupos_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );


CREATE SEQUENCE SQ_CODIGO_USUARIO START WITH 5 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_PUBLICACION START WITH 5 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_APROBACION START WITH 5 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_COMENTARIO START WITH 9 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_EMPRESA START WITH 4 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_EXPERIENCIA_LABORAL START WITH 6 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_GRUPO START WITH 4 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_HABILIDAD START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_INSTITUCION START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_LOGRO START WITH 5 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_LUGAR START WITH 8 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_MENSAJE START WITH 4 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_OFERTA_LABORAL START WITH 4 INCREMENT BY 1;

CREATE SEQUENCE SQ_CODIGO_TITULO_ACADEMICO START WITH 5 INCREMENT BY 1;