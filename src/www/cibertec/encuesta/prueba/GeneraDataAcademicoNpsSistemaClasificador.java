package www.cibertec.encuesta.prueba;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import www.cibertec.encuesta.entidad.Alumno;
import www.cibertec.encuesta.model.ClasifificadorModel;


public class GeneraDataAcademicoNpsSistemaClasificador {

	static {
		SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy_hh_mm_ss");
		String filename = "mensajes_" + sdf.format(new Date()) + ".log";
		System.setProperty("logfile.name", filename);
	}
	
	public static void main(String[] args) {
		ClasifificadorModel model = new ClasifificadorModel();
		List<Alumno> lista = model.listaAlumnosAcademico();

		for (Alumno alumno : lista) {
			try {
				model.insertaAcademicoNPS(alumno);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
