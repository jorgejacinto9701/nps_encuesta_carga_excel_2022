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
//		modelExcel.cargaCarrera("Info_alumnos_2023_1_AC.xlsx");
//		modelExcel.cargaCarrera("Info_alumnos_2023_1_EA.xlsx");
//		modelExcel.cargaCarrera("Info_alumnos_2023_1_SP.xlsx");
//		modelExcel.cargaCarrera("Info_alumnos_2023_1_WS.xlsx");
//		
//		modelExcel.cargaCurso("Info_docentes_2023_1_completo.xlsx");
//		modelExcel.cargaDocente("Info_docentes_2023_1_completo.xlsx");
//		modelExcel.cargaHorario("Info_docentes_2023_1_completo.xlsx");
//		
//		modelExcel.cargaAlumoAcademico("Info_alumnos_2023_1_AC.xlsx");
//		modelExcel.cargaAlumoAcademico("Info_alumnos_2023_1_EA.xlsx");
//		modelExcel.cargaAlumoAcademico("Info_alumnos_2023_1_SP.xlsx");
//		modelExcel.cargaAlumoAcademico("Info_alumnos_2023_1_WS.xlsx");
//		
//		modelExcel.cargaMatricula("Info_alumnos_2023_1_AC.xlsx");
//		modelExcel.cargaMatricula("Info_alumnos_2023_1_EA.xlsx");
//		modelExcel.cargaMatricula("Info_alumnos_2023_1_SP.xlsx");

		modelExcel.cargaMatricula("Info_alumnos_2023_1_AC_extras.xlsx");
		
		//modelExcel.cargaAlumoAcademico("info_alumnos_extra_2.xlsx");
		//modelExcel.cargaMatricula("info_alumnos_extra_2.xlsx");
		
		
		
		//modelExcel.cargaAlumoExtension("Formato_Extension_20222_vs2.xlsx");
		
		//modelExcel.cargaHorario("Formato_Academico_Docentes_20221_extra2.xlsx");
		//modelExcel.cargaAlumoAcademico("Formato_Academico_Alumno_AC_20221_extra2.xlsx");
		//modelExcel.cargaMatricula("Formato_Academico_Alumno_AC_20221_extra2.xlsx");
	}

}
