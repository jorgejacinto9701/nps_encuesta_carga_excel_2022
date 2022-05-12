package www.cibertec.encuesta.prueba;

import java.text.SimpleDateFormat;
import java.util.Date;

import www.cibertec.encuesta.poi.ExcelModel;

public class ExcelPruebaLeer {

	static {
		SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy_hh_mm_ss");
		String filename = "mensajes_" + sdf.format(new Date()) + ".log";
		System.setProperty("logfile.name", filename);
	}

	public static void main(String[] args) {

		ExcelModel modelExcel = new ExcelModel();
//		{
//			String mensaje = modelExcel.verificaHorario("Formato_Academico_Docentes_20212.xlsx");
//			System.out.println(mensaje);
//		}
//
//		modelExcel.cargaCarrera("Formato_Academico_Alumno_AC_20212.xlsx");
//		modelExcel.cargaCarrera("Formato_Academico_Alumno_SP_20212.xlsx");
//		modelExcel.cargaCarrera("Formato_Academico_Alumno_WS_20212.xlsx");
//		modelExcel.cargaCarrera("Formato_Academico_Alumno_EA_20212.xlsx");
//		
//		
//		modelExcel.cargaCurso("Formato_Academico_Docentes_20212.xlsx");
//		modelExcel.cargaDocente("Formato_Academico_Docentes_20212.xlsx");
//		modelExcel.cargaHorario("Formato_Academico_Docentes_20212.xlsx");
//		
//		modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_SP_20212.xlsx");
//		modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_SP_20212.xlsx");
//		modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_WS_20212.xlsx");
//		modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_EA_20212.xlsx");
//
//		
//		modelExcel.cargaMatricula("Formato_Academico_Alumno_AC_20212.xlsx");
//		modelExcel.cargaMatricula("Formato_Academico_Alumno_SP_20212.xlsx");
//		modelExcel.cargaMatricula("Formato_Academico_Alumno_WS_20212.xlsx");
//		modelExcel.cargaMatricula("Formato_Academico_Alumno_EA_20212.xlsx");
//		
//		modelExcel.cargaAlumoExtension("Formato_Extension_20212.xlsx");
		
		
		//modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_AC_20212_subida_2.xlsx");
		modelExcel.cargaMatricula("Formato_Academico_Alumno_AC_20212_subida_2.xlsx");
	}

}
