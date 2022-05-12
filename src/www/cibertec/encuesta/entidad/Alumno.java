package www.cibertec.encuesta.entidad;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Alumno {

	private String idAlumno, idCarrera;
	private Date fechaNacimiento;
	private List<Curso> cursos;
	private int nps;
	private String comentario;
	private String ciudad;
	private String carrera;
	private String facultad;
	
	private String escuela;
	private String familia;
	private String codCurso;
	private String nomCurso;
	private String seccion;
	private String modalidad;
	private String campana;
	private String dni;
	private String campus;
	
	private String semestre;
	private int ciclo;
	private String tipoEstudiante;
	private Date fechaRegistro;
	

}
