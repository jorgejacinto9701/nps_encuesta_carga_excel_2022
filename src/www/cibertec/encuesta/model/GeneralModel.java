package www.cibertec.encuesta.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lombok.extern.apachecommons.CommonsLog;
import www.cibertec.encuesta.entidad.Alumno;
import www.cibertec.encuesta.entidad.Carrera;
import www.cibertec.encuesta.entidad.Curso;
import www.cibertec.encuesta.entidad.Docente;
import www.cibertec.encuesta.entidad.Horario;
import www.cibertec.encuesta.entidad.Matricula;
import www.cibertec.encuesta.util.ConexionDB;

@CommonsLog
public class GeneralModel {

	public ArrayList<Carrera> listaCarreras() {
		ArrayList<Carrera> data = new ArrayList<Carrera>();
		Carrera bean = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select c.*, s.nombre from carrera c, escuela s where c.idescuela = s.idescuela";
			pstm = conn.prepareStatement(sql);
			log.info(pstm);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				bean = new Carrera();
				bean.setIdCarrera(rs.getString(1));
				bean.setNombre(rs.getString(2));
				bean.setIdEscuela(rs.getString(3));
				bean.setEscuela(rs.getString(4));
				data.add(bean);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
			}
		}
		return data;
	}

	public int insertaVerificacionCarrera(Carrera bean) {
		int contador = -1;
		int idCarrera = obtieneIdCarrera(bean.getNombre());
		if (idCarrera == -1) {
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "insert into carrera values(null,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, bean.getNombre());
				pstm.setString(2, bean.getIdEscuela());
				log.info(pstm);
				contador = pstm.executeUpdate();
			} catch (Exception e) {
				log.info(e.getMessage());
			} finally {
				try {
					pstm.close();
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return contador;
	}

	public int obtieneIdCarrera(String nombre) {
		if (nombre != null) {
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "select idCarrera from carrera where descripcion =  ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, nombre);
				// log.info(pstm);
				rs = pstm.executeQuery();
				if (rs.next()) {
					return rs.getInt("idCarrera");
				}
			} catch (Exception e) {
				log.info(e.getMessage());
			} finally {
				try {
					rs.close();
					pstm.close();
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return -1;
	}

	public int insertaVerificacionCurso(Curso bean) {
		int contador = -1;
		if (!existeCurso(bean.getIdCurso())) {
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "insert into curso values(?,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, bean.getIdCurso());
				pstm.setString(2, bean.getNombre());
				pstm.setString(3, bean.getModalidad());
				pstm.setString(4, bean.getEstado());
				log.info(pstm);
				contador = pstm.executeUpdate();
			} catch (Exception e) {
				log.info(e.getMessage());
			} finally {
				try {
					pstm.close();
					conn.close();

				} catch (SQLException e) {
				}
			}
		} else {
			contador = 1;
		}

		return contador;
	}

	public boolean existeCurso(String codigo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean existe = false;
		int salida = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select count(*) from curso where idcurso=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, codigo);
			log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				salida = rs.getInt(1);
			}
			if (salida > 0) {
				existe = true;
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();

			} catch (SQLException e) {
			}
		}
		return existe;
	}

	public int existeDocentePorNombre(String nombre) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int cod = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select iddocente from docente where nombres = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, nombre.trim());
			log.info(pstm);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				cod = rs.getInt("iddocente");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
			}
		}
		return cod;
	}

	public int insertaVerificacionDocente(Docente bean) {
		int contador = -1;
		int idDocente = existeDocentePorNombre(bean.getNombres());
		if (idDocente == -1) {
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "insert into docente(iddocente,nombres,estado,correo) values(null,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, bean.getNombres());
				pstm.setString(2, bean.getEstado());
				pstm.setString(3, bean.getCorreo());
				log.info(pstm);
				contador = pstm.executeUpdate();
			} catch (Exception e) {
				log.info(e.getMessage());
			} finally {
				try {
					pstm.close();
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return contador;
	}

	public int insertaAcademico(Alumno bean) throws SQLException {
		int contador = -2;

		boolean existe = existeAlumnoAcademico(bean.getIdAlumno());
		log.info(existe);
		int idCarrera = new GeneralModel().obtieneIdCarrera(bean.getCarrera());
		contador = idCarrera;
		if (idCarrera != -1 && !existe) {
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "insert into alumno values(?,-1,'',?,?,?,?,?,?,?,null,?,?,?,'FALSO')";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, bean.getIdAlumno());
				pstm.setString(2, bean.getCampus());
				pstm.setString(3, bean.getCiudad());
				pstm.setString(4, bean.getCarrera());
				pstm.setString(5, bean.getFacultad());
				pstm.setString(6, bean.getSemestre());
				pstm.setInt(7, bean.getCiclo());
				pstm.setString(8, bean.getTipoEstudiante());
				pstm.setString(9, bean.getModalidad());
				pstm.setDate(10, bean.getFechaNacimiento());
				pstm.setInt(11, idCarrera);
				log.info(pstm);
				contador = pstm.executeUpdate();
			} catch (Exception e) {
				log.info(e.getMessage());
			} finally {
				try {
					if (pstm != null)
						pstm.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
				}
			}
		}

		return contador;
	}

	public int insertaExtension(Alumno bean) throws SQLException {
		boolean existe = existeAlumnoExtension(bean.getIdAlumno());
		int contador = -1;
		if (existe) {
			contador = -2;
		}else {
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "insert into alumno_extension values(?,?,?,?,?,?,?,?,?,?,-1,'',null,'Falso')";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, bean.getIdAlumno());
				pstm.setString(2, bean.getEscuela());
				pstm.setString(3, bean.getFamilia());
				pstm.setString(4, bean.getCodCurso());
				pstm.setString(5, bean.getNomCurso());
				pstm.setString(6, bean.getSeccion());
				pstm.setString(7, bean.getModalidad());
				pstm.setString(8, bean.getCampana());
				pstm.setString(9, bean.getCampus());
				pstm.setString(10, bean.getDni());
				log.info(pstm);
				contador = pstm.executeUpdate();
			} catch (Exception e) {
				log.info(e.getMessage());
			} finally {
				try {
					if (pstm != null)
						pstm.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
				}
			}
		}

		return contador;
	}

	public int insertaVerificacionMatricula(Matricula bean) {
		int contador = -2;
		int ch = cuentaHorarios(bean);
		log.info("fila--> " + ch);
		if (ch > 1) {
			List<Integer> lista = buscaHorariosVarios(bean);
			for (Integer x : lista) {
				bean.setIdHorario(x);
				contador = insertaMatricula(bean);
			}
		} else if (ch == 1) {
			int idHorario = buscaHorariosUnico(bean);
			bean.setIdHorario(idHorario);
			contador = insertaMatricula(bean);
		}
		return contador;
	}

	public String existeSede(String nombre) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select idsede from sede where nombre = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, nombre.trim());
			// log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				return rs.getString("idsede");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			}
		}
		return null;
	}

	public int insertaHorario(Horario bean) {
		int contador = -1;

		int idDocente = existeDocentePorNombre(bean.getNombreDocente().trim());
		String idSede = existeSede(bean.getSede().trim());
		String idEncuesta = existeEncuesta(bean.getEncuesta().trim());
		String idCiclo = idSede;
		boolean existe = existeHorario(bean.getSeccion(), idDocente, idSede, idCiclo, bean.getGrupo(), idEncuesta);

		if (idDocente == -1)
			contador = -2;
		else if (idSede == null)
			contador = -3;
		else if (idEncuesta == null)
			contador = -4;
		else if (existe)
			contador = -5;
		else {
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = ConexionDB.getConexion();
				String sql = "insert into horario values(null,?,?,?,?,?,?,?,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, bean.getIdCurso());
				pstm.setInt(2, idDocente);
				pstm.setString(3, idCiclo);
				pstm.setString(4, idEncuesta);
				pstm.setString(5, idSede);
				pstm.setString(6, bean.getSeccion());
				pstm.setString(7, bean.getGrupo());
				pstm.setString(8, bean.getModalidad());
				pstm.setString(9, bean.getTipoClase());
				pstm.setString(10, bean.getSeccionPrincipal());
				//log.info(pstm);
				contador = pstm.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				log.info(e.getMessage());
			} finally {
				try {
					conn.close();
					pstm.close();
				} catch (SQLException e) {
				}
			}

		}

		return contador;
	}

	public String existeEncuesta(String nombre) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select idencuesta from encuesta where nombre = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, nombre.trim());
			// log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				return rs.getString("idencuesta");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			}
		}
		return null;
	}

	public boolean existeAlumnoExtension(String codigo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean existe = false;
		int salida = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select count(*) from alumno_extension where idalumno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, codigo);
			// log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				salida = rs.getInt(1);
			}
			if (salida > 0) {
				existe = true;
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return existe;
	}
	
	public boolean existeAlumnoAcademico(String codigo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean existe = false;
		int salida = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select count(*) from alumno where idalumno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, codigo);
			// log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				salida = rs.getInt(1);
			}
			if (salida > 0) {
				existe = true;
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return existe;
	}

	public int insertaMatricula(Matricula bean) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "insert into matricula values(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bean.getIdHorario());
			pstm.setString(2, bean.getIdAlumno());
			pstm.setString(3, bean.getEstado());
			// log.info(pstm);
			contador = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			log.info(e.getMessage());
		} finally {
			try {
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			}
		}
		return contador;
	}

	public boolean existeHorario(String idSeccion, int idDocente, String idCurso, String idCiclo, String grupo,
			String idEncuesta) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int c = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select count(*) from horario where seccion=? and  iddocente=? and  idCurso=? and  idCiclo=? and  grupo=?  and  idEncuesta =?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idSeccion);
			pstm.setInt(2, idDocente);
			pstm.setString(3, idCurso);
			pstm.setString(4, idCiclo);
			pstm.setString(5, grupo);
			pstm.setString(6, idEncuesta);
			// log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				c = rs.getInt(1);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			}
		}
		if (c > 0)
			return true;
		else
			return false;
	}

	public int buscaHorariosUnico(Matricula bean) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select idhorario from horario where idcurso=? and seccion=? and  grupo=? and  modalidad=? and  tipoclase=? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bean.getIdCurso());
			pstm.setString(2, bean.getSeccion());
			pstm.setString(3, bean.getGrupo());
			pstm.setString(4, bean.getModalidad());
			pstm.setString(5, bean.getTipoclase());

			// log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
			}
		}
		return -1;
	}

	public List<Integer> buscaHorariosVarios(Matricula bean) {
		List<Integer> data = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select idhorario from horario where idcurso=? and seccion=? and  grupo=? and  modalidad=? and  tipoclase=? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bean.getIdCurso());
			pstm.setString(2, bean.getSeccion());
			pstm.setString(3, bean.getGrupo());
			pstm.setString(4, bean.getModalidad());
			pstm.setString(5, bean.getTipoclase());

			// log.info(pstm);
			rs = pstm.executeQuery();
			while (rs.next()) {
				data.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info(e.getMessage());
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			}
		}
		return data;
	}

	public int cuentaHorarios(Matricula bean) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();

			String sql = "select count(*) from horario where idcurso=? and seccion=? and  grupo=? and  modalidad=? and  tipoclase=? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bean.getIdCurso());
			pstm.setString(2, bean.getSeccion());
			pstm.setString(3, bean.getGrupo());
			pstm.setString(4, bean.getModalidad());
			pstm.setString(5, bean.getTipoclase());
			System.out.println(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			}
		}
		return -1;
	}

	public boolean existeHorario(String idEncuesta, String idCiclo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int cantidad = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select count(*)   as 'total' from horario  where idEncuesta =? and idCiclo =?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idEncuesta);
			pstm.setString(2, idCiclo);
			log.info(pstm);

			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				cantidad = rs.getInt("total");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
			}
		}
		if (cantidad > 0)
			return true;
		else
			return false;
	}
}
