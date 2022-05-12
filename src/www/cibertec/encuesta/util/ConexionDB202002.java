package www.cibertec.encuesta.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConexionDB202002 {

	private static final Log log = LogFactory.getLog(ConexionDB202002.class);
	private static ResourceBundle rb = ResourceBundle.getBundle("database202002");

	private static BasicDataSource ds = new BasicDataSource();

	private ConexionDB202002() {
	}

	static {

		try {
			ds.setDriverClassName(rb.getString("driver"));
			ds.setUrl(rb.getString("url"));
			ds.setUsername(rb.getString("username"));
			ds.setPassword(rb.getString("password"));
			ds.setMinIdle(5);
			ds.setMaxIdle(10);
			ds.setMaxOpenPreparedStatements(200);

		} catch (Exception e) {
			log.info(e.getMessage());
		}

	}

	public static Connection getConexion() throws SQLException {
		return ds.getConnection();
	}

}
