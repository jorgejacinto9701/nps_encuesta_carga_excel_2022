CREATE DATABASE  IF NOT EXISTS `cibertec_web` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cibertec_web`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cibertec_web
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso` (
  `idrol` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL,
  PRIMARY KEY (`idrol`,`idopcion`),
  KEY `fk_rol_has_opcion_opcion1` (`idopcion`),
  CONSTRAINT `fk_rol_has_opcion_opcion1` FOREIGN KEY (`idopcion`) REFERENCES `opcion` (`idopcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_opcion_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (1,1),(2,1),(1,2),(1,3),(2,3),(1,4),(1,5),(2,5),(1,6),(2,6),(1,7),(2,7),(1,8),(2,8),(1,9),(2,9),(1,10),(2,10),(1,11),(1,12),(2,12),(1,13),(2,13),(1,14),(2,14),(1,15),(2,15),(3,16),(3,17),(4,17),(4,18),(5,18),(4,19),(4,20),(6,21),(4,22),(4,23),(4,24);
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `idalumno` varchar(11) NOT NULL,
  `nps` tinyint(2) DEFAULT '-1',
  `comentario` text,
  `campus` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `carrera` varchar(500) DEFAULT NULL,
  `facultad` varchar(200) DEFAULT NULL,
  `semestre` varchar(6) DEFAULT NULL,
  `ciclo` tinyint(1) DEFAULT NULL,
  `tipoEstudiante` varchar(45) DEFAULT NULL,
  `fechaRegistroNPS` datetime DEFAULT NULL,
  `modalidad` varchar(2) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idcarrera` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT 'FALSO',
  PRIMARY KEY (`idalumno`),
  KEY `fk_alumno_carrera1` (`idcarrera`),
  CONSTRAINT `fk_carreras_alumno` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_extension`
--

DROP TABLE IF EXISTS `alumno_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_extension` (
  `idalumno` varchar(11) NOT NULL,
  `escuela` varchar(300) DEFAULT NULL,
  `familia` varchar(300) DEFAULT NULL,
  `codigoCurso` varchar(11) DEFAULT NULL,
  `nombreCurso` text,
  `seccion` varchar(100) DEFAULT NULL,
  `modalidad` varchar(100) DEFAULT NULL,
  `campana` varchar(100) DEFAULT NULL,
  `campus` varchar(100) NOT NULL,
  `dni` char(8) NOT NULL,
  `nps` tinyint(2) DEFAULT '-1',
  `comentario` text,
  `fechaRegistroNPS` datetime DEFAULT NULL,
  `estado` varchar(10) DEFAULT 'PENDIENTE',
  PRIMARY KEY (`idalumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_extension`
--

LOCK TABLES `alumno_extension` WRITE;
/*!40000 ALTER TABLE `alumno_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion` (
  `idAsignacion` int(11) NOT NULL AUTO_INCREMENT,
  `idSede` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAsignacion`),
  KEY `fk_sede_asignacion_idx` (`idSede`),
  KEY `fk_sede_usuario_idx` (`idUsuario`),
  CONSTRAINT `fk_sede_asignacion` FOREIGN KEY (`idSede`) REFERENCES `sede` (`idsede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sede_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspecto`
--

DROP TABLE IF EXISTS `aspecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspecto` (
  `idAspecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `estado` smallint(1) DEFAULT NULL,
  `idNegocio` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idAspecto`),
  KEY `fk_aspecto_negocio_idx` (`idNegocio`),
  CONSTRAINT `fk_aspecto_negocio` FOREIGN KEY (`idNegocio`) REFERENCES `negocio` (`idNegocio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspecto`
--

LOCK TABLES `aspecto` WRITE;
/*!40000 ALTER TABLE `aspecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) DEFAULT NULL,
  `idescuela` int(11) NOT NULL,
  PRIMARY KEY (`idcarrera`),
  KEY `idescuela_idx` (`idescuela`),
  CONSTRAINT `idescuela` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclo` (
  `idciclo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `idsede` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idciclo`),
  KEY `fk_ciclo_sede1` (`idsede`),
  CONSTRAINT `fk_ciclo_sede1` FOREIGN KEY (`idsede`) REFERENCES `sede` (`idsede`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo`
--

LOCK TABLES `ciclo` WRITE;
/*!40000 ALTER TABLE `ciclo` DISABLE KEYS */;
INSERT INTO `ciclo` VALUES (1,'202001',1,'HABILITADO'),(2,'202001',2,'HABILITADO'),(3,'202001',3,'HABILITADO'),(4,'202001',4,'HABILITADO'),(5,'202001',5,'HABILITADO'),(6,'202001',6,'HABILITADO'),(7,'202001',7,'HABILITADO'),(8,'202001',8,'HABILITADO');
/*!40000 ALTER TABLE `ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idcurso` varchar(45) NOT NULL,
  `nombre` text,
  `modalidad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(1000) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`iddocente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `idencuesta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `numeroPreguntas` int(11) DEFAULT NULL,
  `formula` varchar(45) DEFAULT NULL,
  `porcentajeValidas` double DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `firma` text,
  `estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idencuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'Tutor online',7,'1,1,1,1,1,1,1',40,'2020-06-13','Firma','HABILITADO'),(2,'Fully online',15,'1,1,1,1,1,1,1,1,1,1,1,1,1,1,1',40,'2020-06-13','Firma','HABILITADO'),(3,'General',13,'1,1,1,1,1,1,1,1,1,1,1,1,1',40,'2020-06-13','Firma','HABILITADO');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuela` (
  `idescuela` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idescuela`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` VALUES (1,'Tecnología de la Información'),(2,'Gestión y Negocios'),(3,'Ingeniería'),(4,'Diseño y Comunicaciones'),(5,'Salud');
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `idcurso` varchar(45) NOT NULL,
  `iddocente` int(11) NOT NULL,
  `idciclo` int(11) NOT NULL,
  `idencuesta` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `seccion` varchar(4) DEFAULT NULL,
  `grupo` varchar(2) DEFAULT NULL,
  `modalidad` varchar(2) DEFAULT NULL,
  `tipoclase` varchar(2) DEFAULT NULL,
  `principal` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`idhorario`),
  KEY `fk_seccionXdocente_ciclo1` (`idciclo`),
  KEY `fk_docente_has_seccion_docente1` (`iddocente`),
  KEY `fkencuesta_idx` (`idencuesta`),
  KEY `fkcurso_idx` (`idcurso`),
  KEY `fk_sede_idx` (`idsede`),
  CONSTRAINT `fkcurso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkencuesta` FOREIGN KEY (`idencuesta`) REFERENCES `encuesta` (`idencuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_has_seccion_docente1` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seccionXdocente_ciclo1` FOREIGN KEY (`idciclo`) REFERENCES `ciclo` (`idciclo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sede` FOREIGN KEY (`idsede`) REFERENCES `sede` (`idsede`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion`
--

DROP TABLE IF EXISTS `informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacion` (
  `idInformacion` int(11) NOT NULL AUTO_INCREMENT,
  `celular01` varchar(9) DEFAULT NULL,
  `celular02` varchar(9) DEFAULT NULL,
  `correo01` varchar(50) DEFAULT NULL,
  `correo02` varchar(50) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `idalumno` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idInformacion`),
  KEY `fk_alumno_data_idx` (`idalumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion`
--

LOCK TABLES `informacion` WRITE;
/*!40000 ALTER TABLE `informacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `idhorario` int(11) NOT NULL,
  `idalumno` varchar(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idhorario`,`idalumno`),
  KEY `fk_cursosXAlumno_alumno` (`idalumno`),
  KEY `fk_cursosXAlumno_ciclo4` (`idalumno`),
  KEY `fk_horario_idx` (`idhorario`),
  CONSTRAINT `fk_horario` FOREIGN KEY (`idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `kf_alumno` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `idMensaje` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumno` varchar(11) NOT NULL,
  `mensaje` text,
  `idSede` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `nps` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idMensaje`),
  KEY `fk_mensaje_sede_idx` (`idSede`),
  CONSTRAINT `fk_mensaje_sede` FOREIGN KEY (`idSede`) REFERENCES `sede` (`idsede`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_valoracion`
--

DROP TABLE IF EXISTS `mensaje_valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje_valoracion` (
  `idMensaje` int(11) NOT NULL,
  `idAspecto` int(11) NOT NULL,
  `idTema` int(11) NOT NULL,
  `valoracion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAspecto`,`idMensaje`,`idTema`),
  KEY `fk_valor_tema_idx` (`idTema`),
  KEY `fk_valor_mensaje_idx` (`idMensaje`),
  CONSTRAINT `fk_valor_mensaje` FOREIGN KEY (`idMensaje`) REFERENCES `mensaje` (`idMensaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_valor_tema` FOREIGN KEY (`idTema`) REFERENCES `tema` (`idTema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_valoracion`
--

LOCK TABLES `mensaje_valoracion` WRITE;
/*!40000 ALTER TABLE `mensaje_valoracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje_valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocio`
--

DROP TABLE IF EXISTS `negocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocio` (
  `idNegocio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNegocio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocio`
--

LOCK TABLES `negocio` WRITE;
/*!40000 ALTER TABLE `negocio` DISABLE KEYS */;
INSERT INTO `negocio` VALUES (1,'Acádemico'),(2,'Extensión');
/*!40000 ALTER TABLE `negocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `idopcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `ruta` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idopcion`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,'Curso','1','intranetCrudCurso.jsp','Visible'),(2,'Encuesta','1','intranetCrudEncuesta.jsp','Visible'),(3,'Periodo','1','intranetCrudPeriodo.jsp','Visible'),(4,'Sede','1','intranetCrudSede.jsp','Visible'),(5,'Generación de encuestas','2','intranetGeneracionEncuestas.jsp','Visible'),(6,'Subida de encuestas','2','intranetSuibidaEncuestao.jsp','Visible'),(7,'Envío de encuestas a docentes','3','intranetEnvioEncuestas.jsp','Visible'),(8,'Resultado de encuestas','3','intranetResultadoEncuesta.jsp','Visible'),(9,'Ranking de encuestas','3','intranetRanking.jsp','Visible'),(10,'Docente','1','intranetCrudDocente.jsp','Visible'),(11,'Creación de encuestas','2','intranetGeneracionEncuestas.jsp','Visible'),(12,'Verificación de encuestas','2','intranetVerificacionEncuestaso.jsp','Visible'),(13,'Subida de alumnos no encuestados','2','intranetSubidaAlumno.jsp','Visible'),(14,'Escuela','1','intranetCrudEscuela.jsp','Visible'),(15,'Carrera','1','intranetCrudCarrera.jsp','Visible'),(16,'Reporte de Encuesta Académico','1','intranetReporteAcademico.jsp','Visible'),(17,'Reporte de Encuesta NPS Académico','1','intranetReporteAcademicoNps.jsp','Visible'),(18,'Reporte de Encuesta NPS Extensión','1','intranetReporteExtensionNps.jsp','Visible'),(19,'Actualiza Aspecto','1','intranetCrudAspecto.jsp','Visible'),(20,'Actualiza Tema','1','intranetCrudTema.jsp','Visible'),(21,'Área de Trabajo','1','intranetAreaTrabajo.jsp','Visible'),(22,'Actualiza Usuario','1','intranetCrudUsuario.jsp','Visible'),(23,'Asignación de Trabajo','1','intranetAsignacion.jsp','Visible'),(24,'Reporte de Valoración de Mensajes','1','intranetReporteValoracionMensaje.jsp','Visible');
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `idusuario` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idrol`),
  KEY `fk_usuario_has_rol_rol1` (`idrol`),
  CONSTRAINT `fk_usuario_has_rol_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,1),(2,2),(3,2),(4,3),(5,4),(6,5);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_pregunta_tipo1` (`idtipo`),
  CONSTRAINT `fk_pregunta_tipo1` FOREIGN KEY (`idtipo`) REFERENCES `tipopregunta` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (31,'A través de los anuncios semanales, genera interés en los temas de clase haciendo explícita su aplicación en el campo laboral/personal.',10),(32,'Explica claramente los objetivos de cada tema o unidad de aprendizaje.',10),(33,'Me orienta y aclara mis dudas a través de foro de consultas o correos en el plazo máximo de 48 horas.',10),(34,'Motiva mi participación activa en las diferentes actividades del curso.',10),(35,'Muestra un trato respetuoso hacia los estudiantes, valora sus opiniones y propicia un ambiente positivo en clase (genera confianza para participar, debatir, aclarar dudas).',10),(36,'Se muestra dispuesto a atender las consultas, inquietudes y dificultades de los estudiantes dentro y fuera de la sesión de clase.',10),(37,'¿Qué tan satisfecho(a) estoy con mi docente a lo largo de este curso?',11),(38,'Envía constantemente mensajes motivadores sobre el desarrollo del curso.',10),(39,'Califica los foros, tareas y/o exámenes en el plazo máximo de una semana.',10),(40,'Envía retroalimentación a cada una de las tareas realizadas (comentarios sobre mi desempeño en las actividades).',10),(41,'Responde a las consultas planteadas por usted o por algún compañero en el foro de consultas en un tiempo máximo de 48 horas.',10),(42,'Maneja las herramientas de videoconferencia (compartir pantalla, silenciar micrófono, ceder la palabra a un participante, responder consultas del chat, etc.), lo que permite un adecuado desarrollo de la sesión.',10),(43,'Explica claramente los objetivos de cada tema o unidad de aprendizaje.',10),(44,'Genera interés en los temas de clase haciendo explícita su aplicación en el campo laboral/personal.',10),(45,'Propone actividades, trabajos y/o ejercicios que permiten poner en práctica los temas desarrollados en clase. ',10),(46,'Plantea  ejemplos prácticos reales e interesantes que motivan y permiten comprender los temas con facilidad.',10),(47,'Me orienta y aclara mis dudas en el momento adecuado, lo que ayuda a mi aprendizaje.',10),(48,'Motiva mi participación activa en las diferentes actividades del curso.',10),(49,'Muestra un trato respetuoso hacia los estudiantes, valora sus opiniones y propicia un ambiente positivo en clase (genera confianza para participar, debatir, aclarar dudas).',10),(50,'Se muestra dispuesto a atender las consultas, inquietudes y dificultades de los estudiantes dentro y fuera de la sesión de clase.',10),(51,'Demuestra conocimiento del tema.',10),(52,'¿Qué tan satisfecho(a) estoy con mi docente a lo largo de este curso?',11),(53,'Maneja las herramientas de videoconferencia (compartir pantalla, silenciar micrófono, ceder la palabra a un participante, responder consultas del chat, etc.), lo que permite un adecuado desarrollo de la sesión.',10),(54,'Explica claramente los objetivos de cada tema o unidad de aprendizaje.',10),(55,'Genera interés en los temas de clase haciendo explícita su aplicación en el campo laboral/personal.',10),(56,'Propone actividades, trabajos y/o ejercicios que permiten poner en práctica los temas desarrollados en clase.',10),(57,'Plantea  ejemplos prácticos reales e interesantes que motivan y permiten comprender los temas con facilidad.',10),(58,'Me orienta y aclara mis dudas en el momento adecuado, lo que ayuda a mi aprendizaje.',10),(59,'Motiva mi participación activa en las diferentes actividades del curso.',10),(60,'Mantiene la atención e interés de los estudiantes en clase.',10),(61,'Evalúa constantemente el progreso de mi aprendizaje.',10),(62,'Muestra un trato respetuoso hacia los estudiantes, valora sus opiniones y propicia un ambiente positivo en clase (genera confianza para participar, debatir, aclarar dudas).',10),(63,'Se muestra dispuesto a atender las consultas, inquietudes y dificultades de los estudiantes dentro y fuera de la sesión de clase.',10),(64,'Demuestra conocimiento del tema y/o software del curso.',10),(65,'¿Qué tan satisfecho(a) estoy con mi docente a lo largo de este curso?',11);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasxencuestas`
--

DROP TABLE IF EXISTS `preguntasxencuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntasxencuestas` (
  `idencuesta` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  PRIMARY KEY (`idencuesta`,`idpregunta`),
  KEY `fk_pregunta_has_encuesta_encuesta1` (`idencuesta`),
  KEY `fk_pregunta_has_encuesta_pregunta1` (`idpregunta`),
  CONSTRAINT `fk_pregunta_has_encuesta_encuesta1` FOREIGN KEY (`idencuesta`) REFERENCES `encuesta` (`idencuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_has_encuesta_pregunta1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasxencuestas`
--

LOCK TABLES `preguntasxencuestas` WRITE;
/*!40000 ALTER TABLE `preguntasxencuestas` DISABLE KEYS */;
INSERT INTO `preguntasxencuestas` VALUES (1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65);
/*!40000 ALTER TABLE `preguntasxencuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `idhorario` int(11) NOT NULL,
  `idalumno` varchar(11) NOT NULL,
  `respuesta` varchar(45) DEFAULT NULL,
  `pfinal` double DEFAULT '0',
  `comentario` text,
  `pregunta01` smallint(1) DEFAULT '-1',
  `pregunta02` smallint(1) DEFAULT '-1',
  `pregunta03` smallint(1) DEFAULT '-1',
  `fechaRegistro` datetime DEFAULT NULL,
  PRIMARY KEY (`idhorario`,`idalumno`),
  KEY `fk_respuestas_alumno1` (`idalumno`),
  KEY `fk_horario_2_idx` (`idhorario`),
  CONSTRAINT `fk_alumno` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_2` FOREIGN KEY (`idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Director de Calidad Educativa'),(2,'Calidad Educativa'),(3,'Desarrollo Docente'),(4,'Investigación de Mercado'),(5,'Extensión'),(6,'Clasificador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `idSede` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idNegocio` int(11) NOT NULL,
  PRIMARY KEY (`idSede`),
  KEY `fk_sede_negocio_idx` (`idNegocio`),
  CONSTRAINT `fk_sede_negocio` FOREIGN KEY (`idNegocio`) REFERENCES `negocio` (`idNegocio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (-1,'Ninguno',1),(1,'Independencia',1),(2,'Bellavista',1),(3,'Breña',1),(4,'Arequipa',1),(5,'Lima Centro',1),(6,'Miraflores',1),(7,'Trujillo',1),(8,'San Juan de Lurigancho',1),(9,'OnLine',2);
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `estado` smallint(1) DEFAULT NULL,
  `idAspecto` int(11) NOT NULL,
  `idNegocio` int(11) NOT NULL,
  `definicion` text,
  PRIMARY KEY (`idTema`),
  KEY `fk_aspecto_tema_idx` (`idAspecto`),
  KEY `fk_negocio_tema_idx` (`idNegocio`),
  CONSTRAINT `fk_aspecto_tema` FOREIGN KEY (`idAspecto`) REFERENCES `aspecto` (`idAspecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_negocio_tema` FOREIGN KEY (`idNegocio`) REFERENCES `negocio` (`idNegocio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopregunta`
--

DROP TABLE IF EXISTS `tipopregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopregunta` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `alternativas` text,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopregunta`
--

LOCK TABLES `tipopregunta` WRITE;
/*!40000 ALTER TABLE `tipopregunta` DISABLE KEYS */;
INSERT INTO `tipopregunta` VALUES (1,'Formato (S-CS-A-CN-N)','Siempre-Casi siempre-A veces-Casi Nunca-Nunca'),(2,'Formato (TD-D-NAND-D-TD)','Totalmente de acuerdo-De acuerdo-Ni en acuerdo ni en desacuerdo-En desacuerdo-Totalmente en desacuerdo'),(5,'Formato (10-9-.....-2-1)','10-9-8-7-6-5-4-3-2-1'),(6,'Formato (SI-AVECES-NO)','SI-AVECES-NO'),(8,'Formato (CS-C-CM-NC)','Cumplo satisfactoriamente-Cumplo-Cumplo medianamente-No cumplo'),(10,'Formato (N-R-AV-AM-S)','Siempre-A menudo-A veces-Raramente-Nunca'),(11,'Formato (MS-I-O-S-I)','Muy satisfecho-Satisfecho-Ni satisfecho ni insatisfecho-Insatisfecho-Muy insatisfecho');
/*!40000 ALTER TABLE `tipopregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  `idSede` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usario_sede_idx` (`idSede`),
  CONSTRAINT `fk_usuario_sede` FOREIGN KEY (`idSede`) REFERENCES `sede` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (-1,'Ninguno','Ninguno','Ninguno',1,-1),(1,'Yemiko kanashiro','yemiko','yemiko',1,-1),(2,'Steffany Prado','steffany','steffany',1,-1),(3,'Miguel Oblitas','miguel','miguel',1,-1),(4,'Desarrollo Docente','Academico','Academico',1,-1),(5,'Investigación de Mercados','Nps','Nps',1,-1),(6,'Extesión','Extension','Extension',1,-1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vs_reporte_academico`
--

DROP TABLE IF EXISTS `vs_reporte_academico`;
/*!50001 DROP VIEW IF EXISTS `vs_reporte_academico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vs_reporte_academico` AS SELECT 
 1 AS `ID Horario`,
 1 AS `Sede`,
 1 AS `ID Curso`,
 1 AS `Curso`,
 1 AS `Docente`,
 1 AS `Sección`,
 1 AS `Grupo`,
 1 AS `Modalidad`,
 1 AS `Tipo de Clase`,
 1 AS `Encuesta`,
 1 AS `Universo`,
 1 AS `Encuestados`,
 1 AS `Promedio`,
 1 AS `IdSede`,
 1 AS `Principal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vs_reporte_nps_academico`
--

DROP TABLE IF EXISTS `vs_reporte_nps_academico`;
/*!50001 DROP VIEW IF EXISTS `vs_reporte_nps_academico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vs_reporte_nps_academico` AS SELECT 
 1 AS `SEDE`,
 1 AS `CARRERA`,
 1 AS `MODALIDAD`,
 1 AS `UNIVERSO`,
 1 AS `ENCUESTADOS`,
 1 AS `PROMOTORES`,
 1 AS `NEUTROS`,
 1 AS `DETRACTORES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vs_reporte_nps_extension`
--

DROP TABLE IF EXISTS `vs_reporte_nps_extension`;
/*!50001 DROP VIEW IF EXISTS `vs_reporte_nps_extension`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vs_reporte_nps_extension` AS SELECT 
 1 AS `FAMILIA`,
 1 AS `CURSO`,
 1 AS `UNIVERSO`,
 1 AS `ENCUESTADOS`,
 1 AS `PROMOTORES`,
 1 AS `NEUTROS`,
 1 AS `DETRACTORES`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'cibertec_web'
--

--
-- Dumping routines for database 'cibertec_web'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_MODALIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_MODALIDAD`(var_tipo varchar(200)) RETURNS varchar(200) CHARSET utf8
BEGIN
DECLARE var_salida varchar(200);

set var_salida = (
	CASE var_tipo
		WHEN 'AC' THEN  'Regular'
		WHEN 'WS' THEN  'Working Student'
        WHEN 'SP' THEN  'Semipresencial'

END);


RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION`(var_horario  integer) RETURNS int(11)
BEGIN

DECLARE var_salida int;

SELECT count(m.idalumno)  into var_salida
FROM matricula m
where m.idhorario =var_horario;

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION_PRINCIPAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION_PRINCIPAL`(var_horario  integer) RETURNS int(11)
BEGIN

DECLARE var_salida int;

SELECT count(m.idalumno)  into var_salida
FROM matricula m
where m.idhorario =var_horario;

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_ACADEMICO_DETRACTORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_ACADEMICO_DETRACTORES`(var_campus  varchar(500),var_carrera  varchar(500),var_modalidad  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida from alumno 
where campus =var_campus and carrera= var_carrera and modalidad =var_modalidad and nps in (0,1,2,3,4,5,6);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_ACADEMICO_ENCUESTADOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_ACADEMICO_ENCUESTADOS`(var_campus  varchar(500),var_carrera  varchar(500),var_modalidad  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida from alumno 
where campus =var_campus and carrera= var_carrera and modalidad =var_modalidad and nps <> -1;

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_ACADEMICO_NEUTROS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_ACADEMICO_NEUTROS`(var_campus  varchar(500),var_carrera  varchar(500),var_modalidad  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida from alumno 
where campus =var_campus and carrera= var_carrera and modalidad =var_modalidad and nps in (7,8);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_ACADEMICO_PROMOTORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_ACADEMICO_PROMOTORES`(var_campus  varchar(500),var_carrera  varchar(500),var_modalidad  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida from alumno 
where campus =var_campus and carrera= var_carrera and modalidad =var_modalidad and nps in (9,10);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_EXTENSION_DETRACTORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_EXTENSION_DETRACTORES`(var_familia  varchar(500),var_curso  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida 
from alumno_extension 
where familia =var_familia and nombreCurso = var_curso  and nps in (0,1,2,3,4,5,6);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_EXTENSION_ENCUESTADOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_EXTENSION_ENCUESTADOS`(var_familia  varchar(500),var_curso  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida 
from alumno_extension 
where familia =var_familia and nombreCurso = var_curso  and nps <> -1;

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_EXTENSION_NEUTROS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_EXTENSION_NEUTROS`(var_familia  varchar(500),var_curso  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida 
from alumno_extension 
where familia =var_familia and nombreCurso = var_curso  and nps in (7,8);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_NPS_EXTENSION_PROMOTORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NPS_EXTENSION_PROMOTORES`(var_familia  varchar(500),var_curso  varchar(500)) RETURNS int(11)
BEGIN

DECLARE var_salida int;


SELECT count(*) into var_salida 
from alumno_extension 
where familia =var_familia and nombreCurso = var_curso  and nps in (9,10);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_PROMEDIO_FINAL_POR_DOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_PROMEDIO_FINAL_POR_DOCENTE`(var_iddocente  int, var_limite  int) RETURNS double
BEGIN

DECLARE var_salida double;

select round(sum(d.sumapromedio)/sum(d.cantidad),2) 
into var_salida
 from (
select r.idhorario,
count(r.idhorario) as 'cantidad', 
round(avg(r.pfinal)* count(r.idhorario),2) as 'sumapromedio'
from  respuestas r
inner join horario h on r.idhorario = h.idhorario 
where h.iddocente=var_iddocente
group by r.idhorario
having cantidad>= var_limite) as d;

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_TIPO_DE_CLASE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_TIPO_DE_CLASE`(var_tipo varchar(200)) RETURNS varchar(200) CHARSET utf8
BEGIN
DECLARE var_salida varchar(200);

set var_salida = (
	CASE var_tipo
		WHEN 'TE' THEN  'Teoría'
		WHEN 'LA' THEN  'Laboratorio'
		WHEN 'TA' THEN  'Taller'
		WHEN 'VT' THEN  'Virtual'
END);


RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_TIPO_DE_PREGUNTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_TIPO_DE_PREGUNTA`(var_tipo integer) RETURNS varchar(200) CHARSET utf8
BEGIN
DECLARE var_salida varchar(200);

set var_salida = (
	CASE var_tipo
		WHEN 1 THEN  '¿En qué te hemos fallado?'
        WHEN 2 THEN  '¿En qué te hemos fallado?'
        WHEN 3 THEN  '¿En qué te hemos fallado?'
        WHEN 4 THEN  '¿En qué te hemos fallado?'
        WHEN 5 THEN  '¿En qué te hemos fallado?'
        WHEN 6 THEN  '¿En qué te hemos fallado?'
        WHEN 7 THEN  '¿Qué debemos mejorar?'
        WHEN 8 THEN  '¿Qué debemos mejorar?'
        WHEN 9 THEN  '¿Qué hemos hecho para merecer tu recomendación?'
        WHEN 10 THEN  '¿Qué hemos hecho para merecer tu recomendación?'
END);


RETURN var_salida;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_VALIDA_DIVISION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_VALIDA_DIVISION`(var_num integer, var_den integer) RETURNS double
BEGIN

DECLARE var_salida double;

set var_salida = (
	CASE var_den
		WHEN 0 THEN  0
		ELSE  var_num/var_den
END);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_VALIDA_DIVISION_NPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_VALIDA_DIVISION_NPS`(var_num integer, var_den integer) RETURNS int(11)
BEGIN

DECLARE var_salida double;

set var_salida = (
	CASE var_den
		WHEN 0 THEN  0
		ELSE  round(var_num*100/var_den,0)
END);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_VALIDA_NULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_VALIDA_NULO`(var_texto text) RETURNS text CHARSET utf8
BEGIN
DECLARE var_salida text;

set var_salida = (
	CASE var_texto
		WHEN null THEN  '-'
        WHEN '' THEN  '-'
		ELSE  var_texto
END);

RETURN var_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cantidad_reporte_por_docente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cantidad_reporte_por_docente`(var_iddocente  int, var_limite  int, porcentaje  int)
BEGIN


select count(total.idhorario) 
from (
select r.idhorario as 'idhorario', 
count(r.idhorario) as 'encuestados',
FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION(r.idhorario) as 'total'
from respuestas r 
inner join horario h 
on r.idhorario = h.idhorario
where h.iddocente=var_iddocente 
group by r.idhorario 
having encuestados>=var_limite and ((encuestados*100)/total)>=porcentaje
) as total;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cantidad_reporte_por_docente_principal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cantidad_reporte_por_docente_principal`(var_iddocente  int, var_limite  int)
BEGIN


select count(total.idhorario) 
from (
select r.idhorario as 'idhorario', 
count(r.idhorario) as 'encuestados',
FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION(r.idhorario) as 'total'
from respuestas r 
inner join horario h 
on r.idhorario = h.idhorario
where h.iddocente=var_iddocente 
group by r.idhorario 
having encuestados>=var_limite 
) as total;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_completo_mensaje_nps_academico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_completo_mensaje_nps_academico`()
BEGIN

SELECT 
n.nombre as negocio, 
s.nombre as campus,
x.ciudad as ciudad, 
x.carrera as carrera, 
x.facultad as facultad,
x.ciclo as ciclo, 
x.tipoEstudiante as tipoEstudiante,
x.modalidad as modalidad,
m.idAlumno as idAlumno,
m.idMensaje as idMensaje,
m.mensaje as comentario,
m.nps as nps,
FN_TIPO_DE_PREGUNTA(m.nps) as pregunta,
IFNULL(a.nombre,'-') as aspecto,
IFNULL(t.nombre,'-')  as tema,
m.tipo as tipo,
IFNULL(v.valoracion,'-') as valoracion,
u.nombre as usuario
FROM alumno x
left join mensaje m on x.idalumno = m.idalumno
left join mensaje_valoracion v on m.idMensaje = v.idMensaje
left join usuario u on u.idUsuario = m.idUsuario 
left join sede s on s.idSede = m.idSede
left join aspecto a on a.idAspecto = v.idAspecto
left join tema t on t.idTema = v.idTema
left join negocio n on n.idNegocio = s.idNegocio
where m.estado ='Clasificado' and n.idNegocio=1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_completo_mensaje_nps_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_completo_mensaje_nps_extension`()
BEGIN

SELECT 
n.nombre as negocio, 
s.nombre as campus,
x.escuela as escuela,
x.familia as familia, 
x.nombreCurso as curso,
x.modalidad as modalidad,  
m.idAlumno as idAlumno,
m.idMensaje as idMensaje,
m.mensaje as comentario,
m.nps as nps,
FN_TIPO_DE_PREGUNTA(m.nps) as pregunta,
IFNULL(a.nombre,'-') as aspecto,
IFNULL(t.nombre,'-')  as tema,
m.tipo as tipo,
IFNULL(v.valoracion,'-') as valoracion,
u.nombre as usuario
FROM alumno_extension x
left join mensaje m on x.idalumno = m.idAlumno 
left join mensaje_valoracion v on m.idMensaje = v.idMensaje
left join sede s on s.idSede = m.idSede
left join aspecto a on a.idAspecto = v.idAspecto
left join tema t on t.idTema = v.idTema
left join negocio n on n.idNegocio = s.idNegocio
left join usuario u on u.idUsuario = m.idUsuario 
where m.estado ='Clasificado' and n.idNegocio=2; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_completo_nps_academico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_completo_nps_academico`()
BEGIN


SELECT idalumno, nps, comentario,  campus, ciudad, carrera, facultad,
  semestre, ciclo, tipoEstudiante, fechaRegistroNPS, modalidad, estado  FROM cibertec_web.alumno
  where nps <> -1;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_completo_nps_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_completo_nps_extension`()
BEGIN


SELECT idalumno, nps, comentario,  campus,  nombreCurso,  familia, escuela, 
modalidad, fechaRegistroNPS, estado  FROM cibertec_web.alumno_extension
where nps <> -1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_encuestas_por_sede` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_encuestas_por_sede`(var_idsede  int)
BEGIN

SELECT  s.nombre, h.idhorario,e.nombre,c.idcurso,c.nombre, d.nombres, 
h.seccion, h.grupo, FN_MODALIDAD(h.modalidad),
 FN_TIPO_DE_CLASE(h.tipoclase), r.idalumno, r.respuesta,r.pfinal, 
 r.pregunta01, r.pregunta02, r.pregunta03,r.comentario ,h.principal   
 FROM horario h 
 inner join respuestas r on h.idhorario = r.idhorario 
 inner join docente d on d.iddocente = h.iddocente
 inner join curso c on c.idcurso = h.idcurso 
 inner join sede s on s.idsede = h.idsede 
 inner join encuesta e on h.idencuesta = e.idencuesta where s.idsede = var_idsede; 


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_encuestas_totales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_encuestas_totales`()
BEGIN


SELECT  s.nombre, h.idhorario,e.nombre,c.idcurso,c.nombre, d.nombres, 
h.seccion, h.grupo, FN_MODALIDAD(h.modalidad), FN_TIPO_DE_CLASE(h.tipoclase), 
r.idalumno, r.respuesta,r.pfinal, r.pregunta01, r.pregunta02,
 r.pregunta03,r.comentario  ,h.principal   
 FROM horario h 
 inner join respuestas r on h.idhorario = r.idhorario 
 inner join docente d on d.iddocente = h.iddocente 
 inner join curso c on c.idcurso = h.idcurso 
 inner join sede s on s.idsede = h.idsede 
 inner join encuesta e on h.idencuesta = e.idencuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_nps_academico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_nps_academico`()
BEGIN

select 
e.SEDE,
e.CARRERA,
e.MODALIDAD,
e.UNIVERSO,
e.ENCUESTADOS,
e.ENCUESTADOS/e.UNIVERSO as 'AVANCE(%)',
e.PROMOTORES,
e.NEUTROS,
e.DETRACTORES,
FN_VALIDA_DIVISION(e.PROMOTORES,e.ENCUESTADOS) as 'PROMOTORES(%)',
FN_VALIDA_DIVISION(e.NEUTROS,e.ENCUESTADOS) as 'NEUTROS(%)',
FN_VALIDA_DIVISION(e.DETRACTORES,e.ENCUESTADOS) as 'DETRACTORES(%)',
FN_VALIDA_DIVISION_NPS( (e.PROMOTORES-e.DETRACTORES) ,e.ENCUESTADOS) as 'NPS'
from vs_reporte_nps_academico e;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_nps_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_nps_extension`()
BEGIN


select 
e.FAMILIA,
e.CURSO,
e.UNIVERSO,
e.ENCUESTADOS,
e.ENCUESTADOS/e.UNIVERSO as 'AVANCE(%)',
e.PROMOTORES,
e.NEUTROS,
e.DETRACTORES,
FN_VALIDA_DIVISION(e.PROMOTORES,e.ENCUESTADOS) as 'PROMOTORES(%)',
FN_VALIDA_DIVISION(e.NEUTROS,e.ENCUESTADOS) as 'NEUTROS(%)',
FN_VALIDA_DIVISION(e.DETRACTORES,e.ENCUESTADOS) as 'DETRACTORES(%)',
FN_VALIDA_DIVISION_NPS( (e.PROMOTORES-e.DETRACTORES) ,e.ENCUESTADOS) as 'NPS'
from vs_reporte_nps_extension e;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_promedio_final` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_promedio_final`(var_limite  int)
BEGIN


select d.nombres as 'Docente', 
FN_PROMEDIO_FINAL_POR_DOCENTE(d.iddocente,var_limite) as 'Promedio'  
from docente d
where FN_PROMEDIO_FINAL_POR_DOCENTE(d.iddocente,var_limite)  <> ''
order by promedio desc;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_reporte_por_docente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_reporte_por_docente`(var_iddocente  int, var_limite  int, porcentaje  int)
BEGIN


select r.idhorario as 'ID Horario', 
e.idencuesta as 'ID encuesta',
h.idcurso as 'ID Curso', 
c.nombre as 'Curso',
h.seccion as 'Sección', 
h.grupo as 'Grupo',  
fn_tipo_de_clase(h.tipoclase)as 'Tipo de Clase', 
fn_modalidad(h.modalidad) as 'Modalidad', 
e.nombre as 'Encuesta',
s.nombre as 'Sede', 
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',1),',','-1')),1) as 'p01',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',2),',','-1')),1) as 'p02',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',3),',','-1')),1) as 'p03',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',4),',','-1')),1) as 'p04',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',5),',','-1')),1) as 'p05',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',6),',','-1')),1) as 'p06',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',7),',','-1')),1) as 'p07',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',8),',','-1')),1) as 'p08',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',9),',','-1')),1) as 'p09',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',10),',','-1')),1) as 'p10',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',11),',','-1')),1) as 'p11',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',12),',','-1')),1) as 'p12',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',13),',','-1')),1) as 'p13',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',14),',','-1')),1) as 'p14',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',15),',','-1')),1) as 'p15',
count(r.idhorario) as 'encuestados',
round(avg(r.pfinal), 2) as 'promedio',
FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION(r.idhorario) as 'total'
from respuestas r
inner join horario h on r.idhorario = h.idhorario 
inner join curso c on c.idcurso = h.idcurso
inner join encuesta e on e.idencuesta = h.idencuesta
inner join sede s on s.idsede = h.idsede
where h.iddocente=var_iddocente
group by r.idhorario
having encuestados>=var_limite and ((encuestados*100)/total)>=porcentaje;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_reporte_por_docente_en_principal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_reporte_por_docente_en_principal`(var_iddocente  int, var_limite  int)
BEGIN


select r.idhorario as 'ID Horario', 
e.idencuesta as 'ID encuesta',
h.idcurso as 'ID Curso', 
c.nombre as 'Curso',
h.seccion as 'Sección', 
h.grupo as 'Grupo',  
fn_tipo_de_clase(h.tipoclase)as 'Tipo de Clase', 
fn_modalidad(h.modalidad) as 'Modalidad', 
e.nombre as 'Encuesta',
s.nombre as 'Sede', 
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',1),',','-1')),1) as 'p01',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',2),',','-1')),1) as 'p02',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',3),',','-1')),1) as 'p03',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',4),',','-1')),1) as 'p04',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',5),',','-1')),1) as 'p05',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',6),',','-1')),1) as 'p06',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',7),',','-1')),1) as 'p07',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',8),',','-1')),1) as 'p08',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',9),',','-1')),1) as 'p09',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',10),',','-1')),1) as 'p10',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',11),',','-1')),1) as 'p11',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',12),',','-1')),1) as 'p12',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',13),',','-1')),1) as 'p13',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',14),',','-1')),1) as 'p14',
round(avg(SUBSTRING_INDEX(SUBSTRING_INDEX(r.respuesta,',',15),',','-1')),1) as 'p15',
count(r.idhorario) as 'encuestados',
round(avg(r.pfinal), 2) as 'promedio',
FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION(r.idhorario) as 'total',
h.principal as 'Principal', 
h.iddocente as 'Docente'
from respuestas r
inner join horario h on r.idhorario = h.idhorario 
inner join curso c on c.idcurso = h.idcurso
inner join encuesta e on e.idencuesta = h.idencuesta
inner join sede s on s.idsede = h.idsede
where h.iddocente=var_iddocente
group by r.idhorario
having encuestados>=var_limite;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_secciones_por_sede` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_secciones_por_sede`(var_idsede  int, var_limite  int)
BEGIN

select 
x.`ID Horario`,
x.`Sede`,
x.`ID Curso`,
x.`Curso`,
x.`Docente`,
x.`Sección`,
x.`Grupo`,
x.`Modalidad`,
x.`Tipo de Clase`,
x.`Encuesta`,
x.`Universo`,
x.`Encuestados`,
FN_VALIDA_DIVISION(x.Encuestados,x.Universo) as 'Encuestados(%)',
x.`Promedio`,
x.`Principal`
from vs_reporte_academico x
where x.idsede=var_idsede and x.Encuestados>=var_limite;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_secciones_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_secciones_total`(var_limite  int)
BEGIN


select 
x.`ID Horario`,
x.`Sede`,
x.`ID Curso`,
x.`Curso`,
x.`Docente`,
x.`Sección`,
x.`Grupo`,
x.`Modalidad`,
x.`Tipo de Clase`,
x.`Encuesta`,
x.`Universo`,
x.`Encuestados`,
FN_VALIDA_DIVISION(x.Encuestados,x.Universo) as 'Encuestados(%)',
x.`Promedio`,
x.`Principal`
from vs_reporte_academico x
where x.Encuestados>=var_limite;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vs_reporte_academico`
--

/*!50001 DROP VIEW IF EXISTS `vs_reporte_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_reporte_academico` AS select `r`.`idhorario` AS `ID Horario`,`s`.`nombre` AS `Sede`,`h`.`idcurso` AS `ID Curso`,`c`.`nombre` AS `Curso`,`d`.`nombres` AS `Docente`,`h`.`seccion` AS `Sección`,`h`.`grupo` AS `Grupo`,`FN_MODALIDAD`(`h`.`modalidad`) AS `Modalidad`,`FN_TIPO_DE_CLASE`(`h`.`tipoclase`) AS `Tipo de Clase`,`e`.`nombre` AS `Encuesta`,`FN_NPS_ACADEMICO_ALUMNOS_POR_SECCION`(`r`.`idhorario`) AS `Universo`,count(`r`.`idhorario`) AS `Encuestados`,round(avg(`r`.`pfinal`),2) AS `Promedio`,`s`.`idSede` AS `IdSede`,`h`.`principal` AS `Principal` from (((((`respuestas` `r` join `horario` `h` on((`r`.`idhorario` = `h`.`idhorario`))) join `docente` `d` on((`h`.`iddocente` = `d`.`iddocente`))) join `curso` `c` on((`c`.`idcurso` = `h`.`idcurso`))) join `encuesta` `e` on((`e`.`idencuesta` = `h`.`idencuesta`))) join `sede` `s` on((`s`.`idSede` = `h`.`idsede`))) group by `r`.`idhorario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vs_reporte_nps_academico`
--

/*!50001 DROP VIEW IF EXISTS `vs_reporte_nps_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_reporte_nps_academico` AS select `x`.`campus` AS `SEDE`,`x`.`carrera` AS `CARRERA`,`x`.`modalidad` AS `MODALIDAD`,count(`x`.`idalumno`) AS `UNIVERSO`,`FN_NPS_ACADEMICO_ENCUESTADOS`(`x`.`campus`,`x`.`carrera`,`x`.`modalidad`) AS `ENCUESTADOS`,`FN_NPS_ACADEMICO_PROMOTORES`(`x`.`campus`,`x`.`carrera`,`x`.`modalidad`) AS `PROMOTORES`,`FN_NPS_ACADEMICO_NEUTROS`(`x`.`campus`,`x`.`carrera`,`x`.`modalidad`) AS `NEUTROS`,`FN_NPS_ACADEMICO_DETRACTORES`(`x`.`campus`,`x`.`carrera`,`x`.`modalidad`) AS `DETRACTORES` from `alumno` `x` group by 1,2,3 order by 1,2,3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vs_reporte_nps_extension`
--

/*!50001 DROP VIEW IF EXISTS `vs_reporte_nps_extension`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_reporte_nps_extension` AS select `x`.`familia` AS `FAMILIA`,`x`.`nombreCurso` AS `CURSO`,count(`x`.`idalumno`) AS `UNIVERSO`,`FN_NPS_EXTENSION_ENCUESTADOS`(`x`.`familia`,`x`.`nombreCurso`) AS `ENCUESTADOS`,`FN_NPS_EXTENSION_PROMOTORES`(`x`.`familia`,`x`.`nombreCurso`) AS `PROMOTORES`,`FN_NPS_EXTENSION_NEUTROS`(`x`.`familia`,`x`.`nombreCurso`) AS `NEUTROS`,`FN_NPS_EXTENSION_DETRACTORES`(`x`.`familia`,`x`.`nombreCurso`) AS `DETRACTORES` from `alumno_extension` `x` group by 1,2 order by 1,2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-05  0:08:22
