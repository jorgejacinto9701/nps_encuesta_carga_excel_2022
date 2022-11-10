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
//		modelExcel.cargaCarrera("info_alumnos_AC_20222.xlsx");
//		modelExcel.cargaCarrera("info_alumnos_EA_20222.xlsx");
//		modelExcel.cargaCarrera("info_alumnos_MVT_20222.xlsx");
//		modelExcel.cargaCarrera("info_alumnos_SP_20222.xlsx");
//		modelExcel.cargaCarrera("info_alumnos_WS_20222.xlsx");
//		
//		modelExcel.cargaCurso("Info_docente_20222.xlsx");
//		modelExcel.cargaDocente("Info_docente_20222.xlsx");
//		modelExcel.cargaHorario("Info_docente_20222_v2.xlsx");
//		
//		modelExcel.cargaAlumoAcademico("info_alumnos_AC_20222.xlsx");
//		modelExcel.cargaAlumoAcademico("info_alumnos_EA_20222.xlsx");
//		modelExcel.cargaAlumoAcademico("info_alumnos_MVT_20222.xlsx");
//		modelExcel.cargaAlumoAcademico("info_alumnos_SP_20222.xlsx");
//		modelExcel.cargaAlumoAcademico("info_alumnos_WS_20222.xlsx");
		
//		modelExcel.cargaMatricula("info_alumnos_AC_20222.xlsx");
//		modelExcel.cargaMatricula("info_alumnos_EA_20222.xlsx");
//		modelExcel.cargaMatricula("info_alumnos_MVT_20222.xlsx");
//		modelExcel.cargaMatricula("info_alumnos_SP_20222.xlsx");
//		modelExcel.cargaMatricula("info_alumnos_WS_20222.xlsx");
		
		//modelExcel.cargaAlumoAcademico("info_alumnos_extra_2.xlsx");
		modelExcel.cargaMatricula("info_alumnos_extra_2.xlsx");
		
		
		
		//modelExcel.cargaAlumoExtension("Formato_Extension_20222_vs2.xlsx");
		
		//modelExcel.cargaHorario("Formato_Academico_Docentes_20221_extra2.xlsx");
		//modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_AC_20221_extra2.xlsx");
		//modelExcel.cargaMatricula("Formato_Academico_Alumno_AC_20221_extra2.xlsx");
	}

}
