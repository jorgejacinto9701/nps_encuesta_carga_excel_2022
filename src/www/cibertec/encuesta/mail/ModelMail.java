package www.cibertec.encuesta.mail;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import lombok.extern.apachecommons.CommonsLog;

@CommonsLog
public class ModelMail {
	
	
	public void envioCorreoUsuariosPrueba() {
		String subject = "Sistema de gestión de mensajes NPS";
		String username = "jorgejacinto9701@gmail.com";
		String password = "Nene1131";
		String nombres = "Prueba";
		String apellidos = "Prueba";
		String dni = "Prueba";
		String clave = "Prueba";
		String toCorreo = "gisselle.dioses@cibertec.pe";
		//String toCorreo = "pjjacint@cibertec.edu.pe";
		
		
		String texto = "";
		texto += "<p>Estimado/a "+ nombres + " " + apellidos +":</p>";
		texto += "<p>&nbsp;</p>";
		texto += "<p>Se les env&iacute;a el acceso al <b>Sistema de gestión de mensajes NPS</b></p>";
		texto += "<p>&nbsp;</p>";
		texto += "<p><strong>Ruta</strong>: <a href='http://encuesta.cibertec.edu.pe/administracion/'>http://encuesta.cibertec.edu.pe/administracion/</a></p>";
		texto += "<p><strong>Usuario: </strong>"+dni+"</p>";
		texto += "<p><strong>Clave: </strong>"+clave+"</p>";
		texto += "<p>&nbsp;</p>";
		texto += "<p>Saludos Cordiales</p>";
		texto += "<p>Jorge Jacinto Gutarra</p>";
		texto += "<p>&nbsp;</p>";
		
		String strResultado = envioMail(username, password, subject, toCorreo, texto);
		log.info(strResultado);
	}
	
	public void envioCorreoUsuarios() {
		Workbook workbook = null;
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(new File("FormatoClasificadores 2021 FINAL.XLSX"));
			workbook = new XSSFWorkbook(inputStream);
			Sheet sheet = workbook.getSheetAt(0);
			String dni = null;
			String clave = null;
			String toCorreo = null;
			String subject = "Sistema de gestión de mensajes NPS 202102";
			boolean noEsPrimero = false;
			String strResultado = null;
			String nombres = null;
			String apellidos= null;

			String username = "jorgejacinto9701@gmail.com";
			String password = "Nene1131";
			String texto = "";
			Random r = new Random();
			
			for (Row row : sheet) {
				if (noEsPrimero) {
					for (Cell cell : row) {
						switch (cell.getColumnIndex() + 1) {
						case 1:
							if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
								dni = cell.getStringCellValue().trim();
							} else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
								dni = String.valueOf((int) cell.getNumericCellValue());
							}
							String letras = "abcdefghijqlmnijk0123456789@";
						
							int pos  = r.nextInt(25);
							clave = "Nps20212-" + letras.charAt(pos) ;
							//System.out.println(clave);
							break;
						case 2:
							nombres = cell.getStringCellValue().trim();
						break;	
						case 3:
							apellidos = cell.getStringCellValue().trim();
						break;	
						case 6:
							toCorreo = cell.getStringCellValue().trim();
							break;
						}
					}
					
					System.out.println(nombres + "\t"+ apellidos + "\t" + dni + "\t" + clave);
					texto = "";
					texto += "<p>Estimado/a "+ nombres + " " + apellidos +":</p>";
					texto += "<p>&nbsp;</p>";
					texto += "<p>Se les env&iacute;a el acceso al <b>Sistema de gestión de mensajes NPS</b></p>";
					texto += "<p>&nbsp;</p>";
					texto += "<p><strong>Ruta</strong>: <a href='http://encuesta.cibertec.edu.pe/administracion/'>http://encuesta.cibertec.edu.pe/administracion/</a></p>";
					texto += "<p><strong>Usuario: </strong>"+dni+"</p>";
					texto += "<p><strong>Clave: </strong>"+clave+"</p>";
					texto += "<p>&nbsp;</p>";
					texto += "<p>Saludos Cordiales</p>";
					texto += "<p>Jorge Jacinto Gutarra</p>";
					texto += "<p>&nbsp;</p>";

					//System.out.println(texto);
					strResultado = envioMail(username, password, subject, toCorreo, texto);
					//strResultado = pruebaMail(username, password, subject, toCorreo);
					log.info(strResultado);
				}
				noEsPrimero = true;
			}
		} catch (Exception e) {
			log.info(e.getLocalizedMessage());
			log.info(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (inputStream != null)
					inputStream.close();
			} catch (IOException e) {
				log.info(e.getMessage());
			}
		}

	}

	public String envioMail(final String username, final String password, String subject, String to, String texto) {
		Session session = null;
		Transport t = null;
		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true"); 

			session = Session.getDefaultInstance(props);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			//message.setRecipients(Message.RecipientType.CC, InternetAddress.parse("gisselle.dioses@cibertec.pe"));
			message.setSubject(subject);

			BodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(texto, "text/html");

			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(bodyPart);

			message.setContent(multipart);

			t = session.getTransport("smtp");
			t.connect(username, password);
			t.sendMessage(message, message.getAllRecipients());

			return "ENVIADO:  " + username;

		} catch (MessagingException e) {
			log.info("NO ENVIADO:  " + username + " - " + e.getMessage());
			for (int i = 0; i < e.getStackTrace().length; i++) {
				log.info(e.getStackTrace()[i].toString());
			}
			return "NO ENVIADO:  " + username + " - " + e.getMessage();
		} finally {
			try {
				if (t != null) {
					t.close();
				}
			} catch (MessagingException e) {
				log.info(e.getMessage());
			}
		}
	}
	
	
	public String pruebaMail(final String username, final String password, String subject, String to) {
		Session session = null;
		Transport t = null;    
		 
		String mensaje = null;
		try {
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true"); 

			session = Session.getDefaultInstance(props);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);

			BodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent("<p>prueba</p>", "text/html");

			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(bodyPart);

			message.setContent(multipart);

			t = session.getTransport("smtp");
			t.connect(username, password);
			t.sendMessage(message, message.getAllRecipients());

            mensaje = "ENVIADO:  " + username;
         return mensaje;   
 		} catch (MessagingException e) {
			 log.info("NO ENVIADO:  " + username+ " - "  + e.getMessage());
			 mensaje = "NO ENVIADO:  " + username+ " - "  + e.getMessage();
			 for (int i = 0; i < e.getStackTrace().length; i++) {
				 log.info(e.getStackTrace()[i].toString());
			 }
			 return mensaje;
		} finally{
			try {
				if(t != null){
					t.close();
				}
			} catch (MessagingException e) {
				log.info(e.getMessage());
			}
		}
	}
	

}
