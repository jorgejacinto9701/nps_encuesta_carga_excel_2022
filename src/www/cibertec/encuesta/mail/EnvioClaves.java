package www.cibertec.encuesta.mail;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EnvioClaves {

	static {
		SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy_hh_mm_ss");
		String filename = "mensajes_" + sdf.format(new Date()) + ".log";
		System.setProperty("logfile.name", filename);
	}

	
	public static void main(String[] args) {
		ModelMail model = new ModelMail();
		model.envioCorreoUsuarios();
		//model.envioCorreoUsuariosPrueba();
	}

}
