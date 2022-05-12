package www.cibertec.encuesta.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lombok.extern.apachecommons.CommonsLog;
import www.cibertec.encuesta.entidad.Alumno;
import www.cibertec.encuesta.util.ConexionDB;
import www.cibertec.encuesta.util.ConexionDB202002;

@CommonsLog
public class ClasifificadorModel {

	public List<Alumno> listaAlumnosExtension() {
		ArrayList<Alumno> data = new ArrayList<Alumno>();
		Alumno bean = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB202002.getConexion();
			String sql = "select * from alumno_extension where nps > 0";
			pstm = conn.prepareStatement(sql);
			log.info(pstm);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				bean = new Alumno();
				bean.setIdAlumno(rs.getString(1));
				bean.setNps(rs.getInt(11));
				bean.setComentario(rs.getString(12));
				bean.setCampus(rs.getString(9));
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
	
	public List<Alumno> listaAlumnosAcademico() {
		ArrayList<Alumno> data = new ArrayList<Alumno>();
		Alumno bean = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB202002.getConexion();
			String sql = "select * from alumno where nps > 0";
			pstm = conn.prepareStatement(sql);
			log.info(pstm);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				bean = new Alumno();
				bean.setIdAlumno(rs.getString(1));
				bean.setNps(rs.getInt(2));
				bean.setComentario(rs.getString(3));
				bean.setCampus(rs.getString(4));
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

	
	public int insertaAcademicoNPS(Alumno obj) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm1 = null,pstm2 = null,pstm3 = null,pstm4 = null;
		ResultSet rs1 = null, rs2 = null;
		String campus = "-1";
		int idSede = -1;
		try {
			conn = ConexionDB.getConexion();
			conn.setAutoCommit(false);
			
			String sql1 = "update alumno set nps=?, comentario=?, fechaRegistroNPS=curtime(), estado='VERDADERO' where idalumno=?";
			String sql2 = "select campus from alumno where idalumno= ?";
			String sql3 = "select idSede from sede where nombre= ?";
			String sql4 = "insert into mensaje values(null,?,?,?,'-1','No Clasificado','No Clasificado',?)";
			
			pstm1 = conn.prepareStatement(sql1);
			pstm1.setInt(1, obj.getNps());
			pstm1.setString(2, obj.getComentario());
			pstm1.setString(3, obj.getIdAlumno());
			log.info(pstm1);
			contador = pstm1.executeUpdate();
			
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, obj.getIdAlumno());
			log.info(pstm2);
			rs1 = pstm2.executeQuery();
			if (rs1.next()) {
				campus = rs1.getString(1);
			}
			
			if (campus.equals("-1")) {
				conn.rollback();
				contador = -1;
			}
			
			pstm3 = conn.prepareStatement(sql3);
			pstm3.setString(1, campus);
			log.info(pstm3);
			rs2 = pstm3.executeQuery();
			if (rs2.next()) {
				idSede = rs2.getInt(1);
			}
			
			if (idSede == -1) {
				conn.rollback();
				contador = -1;
			}
			
			pstm4 = conn.prepareStatement(sql4);
			pstm4.setString(1, obj.getIdAlumno());
			pstm4.setString(2, obj.getComentario());
			pstm4.setInt(3, idSede);
			pstm4.setInt(4, obj.getNps());
			log.info(pstm4);
			contador = pstm4.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
			log.info(e.getMessage());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (rs1 != null) rs1.close();
				if (rs2 != null) rs2.close();
				if (pstm1 != null) pstm1.close();
				if (pstm2 != null) pstm2.close();
				if (pstm3 != null) pstm3.close();
				if (pstm4 != null) pstm4.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {}
		}
		return contador;
	}
	
	public int insertaExtensionNPS(Alumno obj) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm1 = null,pstm2 = null,pstm3 = null,pstm4 = null;
		ResultSet rs1 = null, rs2 = null;
		String campus = "-1";
		int idSede = -1;
		try {
			conn = ConexionDB.getConexion();
			conn.setAutoCommit(false);
			
			String sql1 = "update alumno_extension set nps=?, comentario=?, fechaRegistroNPS=curtime(), estado='VERDADERO' where idalumno=?";
			String sql2 = "select campus from alumno_extension where idalumno= ?";
			String sql3 = "select idSede from sede where nombre= ?";
			String sql4 = "insert into mensaje values(null,?,?,?,'-1','No Clasificado','No Clasificado',?)";
			
			pstm1 = conn.prepareStatement(sql1);
			pstm1.setInt(1, obj.getNps());
			pstm1.setString(2, obj.getComentario());
			pstm1.setString(3, obj.getIdAlumno());
			log.info(pstm1);
			contador = pstm1.executeUpdate();
			
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, obj.getIdAlumno());
			log.info(pstm2);
			rs1 = pstm2.executeQuery();
			if (rs1.next()) {
				campus = rs1.getString(1);
			}
			
			if (campus.equals("-1")) {
				conn.rollback();
				contador = -1;
			}
			
			pstm3 = conn.prepareStatement(sql3);
			pstm3.setString(1, campus);
			log.info(pstm3);
			rs2 = pstm3.executeQuery();
			if (rs2.next()) {
				idSede = rs2.getInt(1);
			}
			
			if (idSede == -1) {
				conn.rollback();
				contador = -1;
			}
			
			pstm4 = conn.prepareStatement(sql4);
			pstm4.setString(1, obj.getIdAlumno());
			pstm4.setString(2, obj.getComentario());
			pstm4.setInt(3, idSede);
			pstm4.setInt(4, obj.getNps());
			log.info(pstm4);
			contador = pstm4.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (pstm1 != null)
					pstm1.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {}
		}
		return contador;
	}
}
