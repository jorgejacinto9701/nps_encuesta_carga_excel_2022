package www.cibertec.encuesta.entidad;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Matricula {

	private String idCiclo, idAlumno, idCurso, idSeccion, grupo, idEncuesta, nombreCurso, idDocente, nombreDocente,
			seccion, estado, modalidad, tipoclase;

	private int idHorario;

}
