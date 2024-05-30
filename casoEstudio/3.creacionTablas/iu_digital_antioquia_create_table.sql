CREATE TABLE funcionarios (
    funcionario_id SERIAL ,
    numero_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    estado_civil VARCHAR(20) NOT NULL,
    sexo CHAR(2) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(50),
    fecha_nacimiento DATE NOT null,
    PRIMARY key (funcionario_id)
);

CREATE TABLE grupoFamiliar (
    grupo_familiar_id SERIAL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(50),
    PRIMARY key (grupo_familiar_id),
    FOREIGN KEY (grupo_familiar_id) REFERENCES funcionarios (funcionario_id)
);

CREATE TABLE rolGrupoFamiliar (
    rol_grupo_familiar_id SERIAL ,
    nombre VARCHAR(100) NOT NULL,
    grupo_familiar_id INT NOT NULL,
    PRIMARY key (rol_grupo_familiar_id),
    FOREIGN KEY (rol_grupo_familiar_id) REFERENCES grupoFamiliar(grupo_familiar_id)
);

CREATE TABLE tiposDocumentos (
    tipos_documento_id SERIAL ,
    descripcion VARCHAR(100) NOT null,
    PRIMARY key (tipos_documento_id),
    FOREIGN KEY (tipos_documento_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE estadosCiviles (
    estado_civil_id SERIAL,
    descripcion VARCHAR(100) NOT NULL,
    codigo VARCHAR(100) NOT null,
    PRIMARY key (estado_civil_id),
    FOREIGN KEY (estado_civil_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE formacionAcademica (
    formacion_academica_id SERIAL not NULL ,
    fecha_inicio date not NULL,
    fecha_fin date not NULL,
    PRIMARY key (formacion_academica_id),
    FOREIGN KEY (formacion_academica_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE universidad (
    universidad_id SERIAL not NULL ,
    nombre VARCHAR(100) NOT null,
    PRIMARY key (universidad_id),
    FOREIGN KEY (universidad_id) REFERENCES formacionAcademica(formacion_academica_id)
);


CREATE TABLE nivelEducativo (
    nivel_educativo_id SERIAL not NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    fecha_actualizacion TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    PRIMARY key ( nivel_educativo_id),
    FOREIGN KEY (nivel_educativo_id) REFERENCES formacionAcademica(formacion_academica_id),
);

CREATE TABLE estadoFormacion (
    estado_formacion_id SERIAL not NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    formacion_academica_id INT NOT NULL,
    PRIMARY KEY(estado_formacion_id),
    FOREIGN KEY (estado_formacion_id) REFERENCES formacionAcademica(formacion_academica_id), 
);
