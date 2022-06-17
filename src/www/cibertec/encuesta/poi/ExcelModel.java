package www.cibertec.encuesta.poi;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import www.cibertec.encuesta.entidad.Alumno;
import www.cibertec.encuesta.entidad.Carrera;
import www.cibertec.encuesta.entidad.Curso;
import www.cibertec.encuesta.entidad.Docente;
import www.cibertec.encuesta.entidad.Horario;
import www.cibertec.encuesta.entidad.Matricula;
import www.cibertec.encuesta.model.GeneralModel;
import www.cibertec.encuesta.util.Conversiones;
import www.cibertec.encuesta.util.JLibreria;

public class ExcelModel {


	public String verificaHorario(String file) {
		StringBuilder salida = new StringBuilder("Es Correcto");
		int fila = 0;
		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				if (fila > 1) {
					
					// Valida el vacio
					if (row.getCell(0) == null) {
						return "Fila " + fila + ", Sección principal no puede ser vacio";
					}
					// Valida el vacio
					if (row.getCell(1) == null) {
						return "Fila " + fila + ", Sección no puede ser vacio";
					}
					if (row.getCell(2) == null) {
						return "Fila " + fila + ", Cod. Asignatura no puede ser vacio";
					}
					if (row.getCell(3) == null) {
						return "Fila " + fila + ", Asignatura no puede ser vacio";
					}
					if (row.getCell(4) == null) {
						return "Fila " + fila + ", Grupo no puede ser vacio";
					}
					if (row.getCell(5) == null) {
						return "Fila " + fila + ", Nombre de docente no puede ser vacio";
					}
					if (row.getCell(6) == null) {
						return "Fila " + fila + ", Correo no puede ser vacio";
					}
					if (row.getCell(7) == null) {
						return "Fila " + fila + ", sede no puede ser vacio";
					}
					if (row.getCell(8) == null) {
						return "Fila " + fila + ", Tipo de clase no puede ser vacio";
					}
					if (row.getCell(9) == null) {
						return "Fila " + fila + ", Modalidad no puede ser vacio";
					}
					if (row.getCell(10) == null) {
						return "Fila " + fila + ", Encuesta no puede ser vacio";
					}
					// Valida el tipo de dato
					if (row.getCell(0).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Sección principal es texto";
					}
					if (row.getCell(1).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Sección es texto";
					}
					if (row.getCell(2).getCellType() != HSSFCell.CELL_TYPE_NUMERIC && row.getCell(3).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Cod. Curso es de fotmato texto o numérico";
					}
					if (row.getCell(3).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Curso es texto";
					}
					if (row.getCell(4).getCellType() != HSSFCell.CELL_TYPE_NUMERIC	&& row.getCell(3).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Grupo es de formato texto o numérico";
					}
					if (row.getCell(5).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Docente es texto";
					}
					if (row.getCell(6).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Correo es texto";
					}
					if (row.getCell(7).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Sede es texto";
					}
					if (row.getCell(8).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Tipo de clase es texto";
					}
					if (row.getCell(9).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Modalidad es texto";
					}
					if (row.getCell(10).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Encuesta es texto";
					}
				}
			}

			// Validaciones por duplicidad del excel

			List<Horario> lista = cargaListaHorario(file);
			int[] duplicados = validaDuplicidadHorario(lista);
			if (duplicados != null) {
				return "Existen duplicados(Id de curso, sección y grupo) en la fila " + duplicados[0] + " y en la fila "
						+ duplicados[1];
			}

			// Valida Cursos con igual codigo pero diferente nombre

			// int[] duplicadosCursos = validaCursos(lista);
			// if (duplicadosCursos != null) {
			// return "Existen cursos con el mismo id de curso pero diferente nombre o
			// viceversa en la fila " + duplicadosCursos[0] + " y en la fila " +
			// duplicadosCursos[1];
			// }

		} catch (FileNotFoundException e) {
			return "Exception";
		} catch (IOException e) {
			return "Exception";
		} catch (Exception e) {
			return "Exception";
		}

		return salida.toString().concat("-").concat(String.valueOf(fila));
	}

	public int[] validaDuplicidadHorario(List<Horario> lista) {
		int[] salida = null;

		fuera: for (int i = 0; i < lista.size(); i++) {
			Horario beanA = lista.get(i);

			for (int j = 0; j < lista.size(); j++) {
				Horario beanB = lista.get(j);

				if (i != j && beanA.equals(beanB)) {
					salida = new int[2];
					salida[0] = (i + 2);
					salida[1] = (j + 2);
					break fuera;
				}
			}
		}
		return salida;
	}

	public int[] validaCursos(List<Horario> lista) {
		int[] salida = null;

		fuera: for (int i = 0; i < lista.size(); i++) {
			Horario beanA = lista.get(i);

			for (int j = 0; j < lista.size(); j++) {
				Horario beanB = lista.get(j);

				if (i != j && ((beanA.getIdCurso().equals(beanB.getIdCurso())
						&& !(beanA.getNombreCurso().toUpperCase().equals(beanB.getNombreCurso().toUpperCase())))
						|| (!(beanA.getIdCurso().equals(beanB.getIdCurso())) && beanA.getNombreCurso().toUpperCase()
								.equals(beanB.getNombreCurso().toUpperCase())))) {
					salida = new int[2];
					salida[0] = (i + 2);
					salida[1] = (j + 2);

					break fuera;
				}
			}
		}
		return salida;
	}

	public List<Horario> cargaListaHorario(String file) {
		int fila = 0;
		List<Horario> lstaHorarios = new ArrayList<Horario>();
		String seccion = "";
		String seccionPrincipal = "";
		String idCurso = "";
		String grupo = "";
		String nomDocente = "";
		String nomCurso = "";
		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;

				if (fila > 1) {

					seccionPrincipal = row.getCell(0).getStringCellValue().trim();
					seccion = row.getCell(1).getStringCellValue().trim();

					if (row.getCell(2).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						idCurso = String.valueOf((int) row.getCell(2).getNumericCellValue()).trim();
					} else {
						idCurso = row.getCell(2).getStringCellValue();
					}

					nomCurso = row.getCell(3).getStringCellValue().trim();

					if (row.getCell(4).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						grupo = String.valueOf((int) row.getCell(4).getNumericCellValue()).trim();
					} else {
						grupo = row.getCell(4).getStringCellValue().trim();
						grupo = JLibreria.eliminaCerosIzquierda(grupo);
					}

					nomDocente = row.getCell(5).getStringCellValue().trim();

					Horario h = new Horario();
					h.setGrupo(grupo);
					h.setNombreDocente(nomDocente);
					h.setSeccion(seccion);
					h.setSeccion(seccionPrincipal);
					h.setIdCurso(idCurso);
					h.setNombreDocente(nomDocente);
					h.setNombreCurso(nomCurso);

					lstaHorarios.add(h);
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lstaHorarios;

	}

	public String verificaMatricula(String file) {
		StringBuilder salida = new StringBuilder("Es Correcto");
		int fila = 0;

		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			GeneralModel model = new GeneralModel();
			List<Carrera> carreras = model.listaCarreras();
			List<String> auxCarreras = new ArrayList<String>();

			String obj = null;
			for (Carrera aux : carreras) {
				obj = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(aux.getNombre());
				obj = JLibreria.toSinTildes(obj);
				auxCarreras.add(obj);
			}

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				if (fila > 1) {

					// Valida numero de columnas
					if (row.getCell(8) != null) {
						return "Fila " + fila + ", el archivo excel debe tener solo 8 columnas";
					}
					// Valida el vacio
					if (row.getCell(0) == null) {
						return "Fila " + fila + ", Cod. Alumno no puede ser vacio";
					}
					if (row.getCell(1) == null) {
						return "Fila " + fila + ", Carrera no puede ser vacio";
					}
					if (row.getCell(2) == null) {
						return "Fila " + fila + ", Cod. Curso no puede ser vacio";
					}
					if (row.getCell(3) == null) {
						return "Fila " + fila + ", Sección no puede ser vacio";
					}
					if (row.getCell(4) == null) {
						return "Fila " + fila + ", Grupo no puede ser vacio";
					}

					// Valida el tipo de dato
					if (row.getCell(0).getCellType() != HSSFCell.CELL_TYPE_NUMERIC
							&& row.getCell(0).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Cod. Alumno debería ser de formato texto o numérico";
					}
					if (row.getCell(1).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Carrea debería es un texto";
					}
					if (row.getCell(2).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", codigo curso debería es un texto";
					}
					if (row.getCell(3).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Sección es texto";
					}
					if (row.getCell(4).getCellType() != HSSFCell.CELL_TYPE_NUMERIC
							&& row.getCell(4).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Grupo debería de fotmato texto o numérico";
					}
					if (row.getCell(5).getCellType() != HSSFCell.CELL_TYPE_BLANK
							&& row.getCell(5).getCellType() != HSSFCell.CELL_TYPE_NUMERIC
							&& row.getCell(5).getCellType() != HSSFCell.CELL_TYPE_STRING) {
						return "Fila " + fila + ", Fecha de nacimiento debería ser de formato texto, numérico o vacio";
					}

					// valida contenido
					if (row.getCell(1).getCellType() == HSSFCell.CELL_TYPE_STRING) {
						String carrera = row.getCell(1).getStringCellValue().trim();
						carrera = JLibreria.toSinTildes(carrera);
						carrera = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(carrera);
						boolean noExiste = true;
						for (String e : auxCarreras) {
							if (e.equalsIgnoreCase(carrera)) {
								noExiste = false;
								break;
							}
						}
						if (noExiste) {
							return "<html>Fila " + fila
									+ ", Las carrera no se encontró, verifique en el menú Administración y opción Carrera, <br>el texto de la carrera (No el nombre) debe coincidir con la carrera que está en el excel:  <br>- Si no existe la carrera, créelo.<br>- Si existe la carrera, modifique el texto de la carrera hasta que coincida con el excel.</html>";
						}
					}

				}
			}

		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
			return "FileNotFoundException";
		} catch (IOException e) {
			System.out.println(e.getMessage());
			return "IOException";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "Exception";
		}

		return salida.toString().concat("-").concat(String.valueOf(fila));
	}

	public void cargaCarrera(String file) {
		GeneralModel modelCarrera = new GeneralModel();
		int fila = 0;

		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();
			String nomCarrera = "";

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				if (fila > 1) {

					nomCarrera = row.getCell(1).getStringCellValue();
					nomCarrera = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomCarrera);
					nomCarrera = JLibreria.toMinusculaYPrimerCaracterMayuscula(nomCarrera);

					Carrera obj = new Carrera();
					obj.setNombre(nomCarrera);
					obj.setIdEscuela("1");

					int idCarrera = modelCarrera.insertaVerificacionCarrera(obj);
					if (idCarrera == -1) {
						// System.out.println("NO existe carrera -->" + fila);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void cargaAlumoExtension(String file) {
		System.out.println("En Carga Alumno Extension");
		GeneralModel modelAlumno = new GeneralModel();
		int fila = 0;
		try {

			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hojaVendedores = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hojaVendedores.iterator();

			String idAlumno, escuela, familia, codCurso, nomCurso, seccion, modalidad, campana, dni, campus;
			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				if (fila > 1) {
					System.out.println("fila--> " + fila);

					idAlumno = row.getCell(0).getStringCellValue();
					
					escuela = row.getCell(1).getStringCellValue();
					escuela = JLibreria.toMinusculaYPrimerCaracterMayuscula(escuela);
					
					familia = row.getCell(2).getStringCellValue();

					if (row.getCell(3).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						codCurso = String.valueOf((int) row.getCell(3).getNumericCellValue()).trim();

					} else {
						codCurso = row.getCell(3).getStringCellValue();
					}
					
					escuela = row.getCell(1).getStringCellValue();
					escuela = JLibreria.toMinusculaYPrimerCaracterMayuscula(escuela);
					
					nomCurso = row.getCell(4).getStringCellValue();
					nomCurso = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomCurso);
					nomCurso = JLibreria.toMinusculaYPrimerCaracterMayuscula(nomCurso);
					
					seccion = row.getCell(5).getStringCellValue();
					
					modalidad = row.getCell(6).getStringCellValue();
					modalidad = JLibreria.toMinusculaYPrimerCaracterMayuscula(modalidad);
					
					if (row.getCell(7).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						campana = String.valueOf((int) row.getCell(7).getNumericCellValue()).trim();

					} else {
						campana = row.getCell(7).getStringCellValue();
					}

					campus = row.getCell(8).getStringCellValue();
					campus = JLibreria.toMinusculaYPrimerCaracterMayuscula(campus);
					
					if (row.getCell(9).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						dni = String.valueOf((int) row.getCell(9).getNumericCellValue()).trim();

					} else {
						dni = row.getCell(9).getStringCellValue();
					}
					
					idAlumno = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(idAlumno);
					escuela = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(escuela);
					familia = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(familia);
					codCurso = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(codCurso);
					nomCurso = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomCurso);
					seccion = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(seccion);
					modalidad = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(modalidad);
					campana = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(campana);
					dni = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(dni);
					campus = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(campus);

					if (!dni.matches("[0-9]{8}")) {
						dni = "11111111";
					}
					Alumno a = new Alumno();
					a.setIdAlumno(idAlumno);
					a.setEscuela(escuela);
					a.setFamilia(familia);
					a.setCodCurso(codCurso);
					a.setNomCurso(nomCurso);
					a.setModalidad(modalidad);
					a.setCampana(campana);
					a.setDni(dni);
					a.setSeccion(seccion);
					a.setCampus(campus);

					int insertados = modelAlumno.insertaExtension(a);
					if (insertados == -2) {
						System.out.println("Ya existe -->" + fila);
					}
				}
				if (fila % 10000 == 0) {
					System.out.println("fila--> " + fila);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public void cargaAlumoAcademico(String file) {
		System.out.println("En Carga Alumno Academico");
		GeneralModel modelAlumno = new GeneralModel();
		SimpleDateFormat sdf_1 = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdf_2 = new SimpleDateFormat("yyyy-MM-dd");
		int fila = 0;
		try {

			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hojaVendedores = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hojaVendedores.iterator();

			String idAlumno = "", fechaNacimiento = "", nomCarrera = "", campus = "", ciudad = "", facultad = "",
					semestre = "", tipo = "", ciclo = "", modalidad;
			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				if (fila > 1) {
					System.out.println("fila--> " + fila);

					if (row.getCell(0).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						idAlumno = String.valueOf((int) row.getCell(0).getNumericCellValue()).trim();

					} else {
						idAlumno = row.getCell(0).getStringCellValue();
					}

					nomCarrera = row.getCell(1).getStringCellValue();
					nomCarrera = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomCarrera);
					nomCarrera = JLibreria.toMinusculaYPrimerCaracterMayuscula(nomCarrera);
					
					if (row.getCell(5).getCellType() == HSSFCell.CELL_TYPE_BLANK) {
						fechaNacimiento = "1111-11-11";
					} else if (row.getCell(5).getCellType() == HSSFCell.CELL_TYPE_STRING
							&& row.getCell(5).getStringCellValue().trim().equals("")) {
						fechaNacimiento = "1111-11-11";
					} else if (row.getCell(5).getCellType() == HSSFCell.CELL_TYPE_STRING) {
						fechaNacimiento = sdf_2.format(sdf_1.parse(row.getCell(5).getStringCellValue().trim()));
					}
					modalidad = row.getCell(6).getStringCellValue();
					
					campus = row.getCell(8).getStringCellValue();
					campus = JLibreria.toMinusculaYPrimerCaracterMayuscula(campus);
					
					ciudad = row.getCell(9).getStringCellValue();
					ciudad = JLibreria.toMinusculaYPrimerCaracterMayuscula(ciudad);
					
					facultad = row.getCell(10).getStringCellValue();

					if (row.getCell(11).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						semestre = String.valueOf((int) row.getCell(11).getNumericCellValue()).trim();
					} else {
						semestre = row.getCell(11).getStringCellValue();
					}

					tipo = row.getCell(12).getStringCellValue();
					tipo = JLibreria.toMinusculaYPrimerCaracterMayuscula(tipo);
					
					if (row.getCell(13).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						ciclo = String.valueOf((int) row.getCell(13).getNumericCellValue()).trim();
					} else {
						ciclo = row.getCell(13).getStringCellValue();
					}

					idAlumno = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(idAlumno);
					

					Alumno a = new Alumno();
					a.setIdAlumno(idAlumno);
					a.setModalidad(modalidad);
					a.setCampus(campus);
					a.setCiudad(ciudad);
					a.setFacultad(facultad);
					a.setSemestre(semestre);
					a.setTipoEstudiante(tipo);
					a.setCiclo(Integer.parseInt(ciclo));
					a.setCarrera(nomCarrera);
					a.setFechaNacimiento(Conversiones.toFecha(fechaNacimiento));

					int insertados = modelAlumno.insertaAcademico(a);
					if (insertados == -1) {
						System.out.println("NO existe carrera -->" + fila);
					}

				}
				if (fila % 10000 == 0) {
					System.out.println("fila--> " + fila);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public void cargaMatricula(String file) {
		System.out.println("En Carga Matrícula");
		GeneralModel modelMatricula = new GeneralModel();
		int fila = 0;
		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			String idAlumno = "", idCurso = "", seccion = "", grupo = "", modalidad = "", tipoclase = "";

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;

				if (fila > 0) {

					if (row.getCell(0).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						idAlumno = String.valueOf((int) row.getCell(0).getNumericCellValue()).trim();

					} else {
						idAlumno = row.getCell(0).getStringCellValue();
					}

					if (row.getCell(2).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						idCurso = String.valueOf((int) row.getCell(2).getNumericCellValue()).trim();

					} else {
						idCurso = row.getCell(2).getStringCellValue();
					}
		
					seccion = row.getCell(3).getStringCellValue();

					if (row.getCell(4).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						grupo = String.valueOf((int) row.getCell(4).getNumericCellValue()).trim();
					} else {
						grupo = row.getCell(4).getStringCellValue().trim();
						grupo = JLibreria.eliminaCerosIzquierda(grupo);
					}

					modalidad = row.getCell(6).getStringCellValue();
					tipoclase = row.getCell(7).getStringCellValue();

					idAlumno = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(idAlumno);
					grupo = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(grupo);
					modalidad = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(modalidad);
					tipoclase = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(tipoclase);
					seccion = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(seccion);

					Matricula c = new Matricula();
					c.setIdAlumno(idAlumno);
					c.setIdCurso(idCurso);
					c.setGrupo(grupo);
					c.setSeccion(seccion);
					c.setEstado("PENDIENTE");
					c.setModalidad(modalidad);
					c.setTipoclase(tipoclase);

					//System.out.println();
					//System.out.println("fila--> " + c.getIdAlumno());

					int s = modelMatricula.insertaVerificacionMatricula(c);
					if (s == -2) {
						System.out.println("No tiene Horario " + s + "  -->" + fila);
					}
				}
				/*if (fila % 10000 == 0) {
					System.out.println("fila--> " + fila);
				}*
				/*if (fila == 201739) {
					System.out.println("fila--> " + fila + "Finalizado");
					break;
				}*/

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public void cargaHorario(String file) {
		GeneralModel modelHorario = new GeneralModel();
		int fila = 0;
		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			String seccion = "";
			String seccionPrincipal = "";
			String idCurso = "";
			String grupo = "";
			String nomDocente = "";
			String nomCurso = "";
			String correo = "";
			String sede = "";
			String tipoClase = "";
			String modalidad = "";
			String encuesta = "";

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				System.out.println(fila);
				if (fila > 1) {

					seccionPrincipal = row.getCell(0).getStringCellValue().trim();
					seccion = row.getCell(1).getStringCellValue().trim();
					
					if (row.getCell(2).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						idCurso = String.valueOf((int) row.getCell(2).getNumericCellValue()).trim();
					} else {
						idCurso = row.getCell(2).getStringCellValue();
					}
					
					nomCurso = row.getCell(3).getStringCellValue().trim();

					if (row.getCell(4).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						grupo = String.valueOf((int) row.getCell(4).getNumericCellValue()).trim();
					} else {
						grupo = row.getCell(4).getStringCellValue().trim();
						grupo = JLibreria.eliminaCerosIzquierda(grupo);
					}

					nomDocente = row.getCell(5).getStringCellValue().trim();
					correo = row.getCell(6).getStringCellValue().trim();
					sede = row.getCell(7).getStringCellValue().trim();
					tipoClase = row.getCell(8).getStringCellValue().trim();
					modalidad = row.getCell(9).getStringCellValue().trim();
					encuesta = row.getCell(10).getStringCellValue().trim();

					seccion = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(seccion.toUpperCase());
					nomCurso = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomCurso.toUpperCase());
					grupo = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(grupo);
					nomDocente = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomDocente.trim());
					correo = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(correo.toLowerCase());
					sede = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(sede);
					tipoClase = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(tipoClase);
					modalidad = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(modalidad);
					encuesta = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(encuesta);

					Horario h = new Horario();
					h.setIdCurso(idCurso);
					h.setNombreDocente(nomDocente);
					h.setEncuesta(encuesta);
					h.setSede(sede);
					h.setSeccion(seccion);
					h.setSeccionPrincipal(seccionPrincipal);
					h.setGrupo(grupo);
					h.setModalidad(modalidad);
					h.setTipoClase(tipoClase);

					int insertados = modelHorario.insertaHorario(h);
					if (insertados == -2) {
						System.out.println ("No encontro docente: " + fila);
					} else if (insertados == -3) {
						System.out.println("No encontró sede : " + fila);
					} else if (insertados == -4) {
						System.out.println("No encontró encuesta : " + fila);
					} else if (insertados == -5) {
						System.out.println("No existe fila : " + fila);
					}

				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}
	}

	public void cargaDocente(String file) {
		GeneralModel modelDocente = new GeneralModel();
		int fila = 0;
		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			String nomDocente = "";
			String correo = "";

			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				System.out.println(fila);
				if (fila > 1) {

					nomDocente = row.getCell(5).getStringCellValue().trim();
					correo = row.getCell(6).getStringCellValue().trim();
					correo = correo.trim().toLowerCase();

					nomDocente = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomDocente.trim());

					Docente d = new Docente();
					d.setNombres(JLibreria.toMinusculaYPrimerCaracterMayusculaDeCadaPalabra(nomDocente));
					d.setCorreo(correo);
					d.setEstado("ACTIVO");

					int insertados = modelDocente.insertaVerificacionDocente(d);
					if (insertados < 1) {
						System.out.println("No se insertó Docente verifica excel en la fila: " + fila);
					}

				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void cargaCurso(String file) {
		GeneralModel modelCurso = new GeneralModel();
		int fila = 0;
		try {
			FileInputStream fis = new FileInputStream(new File(file));
			XSSFWorkbook excel = new XSSFWorkbook(fis);
			XSSFSheet hoja = excel.getSheetAt(0);
			Iterator<Row> rowIterator = hoja.iterator();

			String idCurso = "";
			String nomCurso = "";
			String modalidad = "";
			while (rowIterator.hasNext()) {
				XSSFRow row = (XSSFRow) rowIterator.next();
				fila++;
				if (fila > 1) {
					System.out.println(fila);
					
					if (row.getCell(2).getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						idCurso = String.valueOf((int) row.getCell(2).getNumericCellValue()).trim();
					} else {
						idCurso = row.getCell(2).getStringCellValue();
					}
					nomCurso = row.getCell(3).getStringCellValue().trim();
					modalidad = row.getCell(9).getStringCellValue().trim();

					nomCurso = JLibreria.eliminaDobleEspaciosYEspaciosAntesYDespues(nomCurso);

					Curso c = new Curso();
					c.setIdCurso(idCurso);
					c.setNombre(JLibreria.toMinusculaYPrimerCaracterMayuscula(nomCurso));
					c.setModalidad(modalidad);
					c.setEstado("ACTIVO");

					int insertados = modelCurso.insertaVerificacionCurso(c);

					if (insertados < 1) {
						System.out.println("No se insertó Docente verifica excel en la fila: " + fila);
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

	}
}
