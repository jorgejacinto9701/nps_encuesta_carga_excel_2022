package www.cibertec.encuesta.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class JLibreria {

	private static DecimalFormatSymbols simbolos = new DecimalFormatSymbols();

	public static String toSuprimeDigitosDerecha(String num) {
		return num.substring(0, num.indexOf(".")).concat("%");
	}

	public static String toMinusculaYPrimerCaracterMayuscula(String valor) {
		if (valor == null || valor.isEmpty()) {
			return valor;
		} else {
			return valor.trim().toUpperCase().charAt(0) + valor.substring(1, valor.length()).toLowerCase();
		}
	}

	public static String toMinusculaYPrimerCaracterMayusculaDeCadaPalabra(String cadena) {
		char[] caracteres = cadena.trim().toLowerCase().toCharArray();
		caracteres[0] = Character.toUpperCase(caracteres[0]);
		for (int i = 0; i < cadena.length() - 2; i++) {
			if (caracteres[i] == ' ') {
				caracteres[i + 1] = Character.toUpperCase(caracteres[i + 1]);
			}
		}
		return new String(caracteres);
	}

	public static int notas(String num, int numAlternativas) {
		return 20 - Integer.parseInt(num) * (20 / numAlternativas);
	}

	public static String toDosDigitos(double num) {
		simbolos.setDecimalSeparator('.');
		DecimalFormat nf1 = new DecimalFormat("##.##", simbolos);
		return nf1.format(num);
	}

	public static String toUnDigito(double num) {
		simbolos.setDecimalSeparator('.');
		DecimalFormat nf1 = new DecimalFormat("##.#", simbolos);
		return nf1.format(num);
	}

	public static String toSinDigito(double num) {
		simbolos.setDecimalSeparator('.');
		DecimalFormat nf1 = new DecimalFormat("##", simbolos);
		return nf1.format(num);
	}

	public static String eliminaDobleEspaciosYEspaciosAntesYDespues(String cad) {
		StringBuilder sb = new StringBuilder(cad);
		for (int i = 0; i < sb.length(); i++) {
			if (sb.codePointAt(i) == 160) {
				sb.setCharAt(i, ' ');
			}
		}
		return sb.toString().trim().replaceAll("\\s+", " ");
	}

	public static String eliminaCerosIzquierda(String cad) {
		boolean todosCeros = true;
		for (int i = 0; i < cad.length(); i++) {
			if (cad.charAt(i) != '0') {
				todosCeros = false;
			}
		}
		if (todosCeros) {
			return "0";
		} else {
			if (cad.charAt(0) == '0') {
				int posUltimoCero = cad.lastIndexOf('0');
				cad = cad.substring(posUltimoCero + 1);
			} else {
				return cad;
			}
		}
		return cad;
	}

	public static String toSinTildes(String cadena) {
		String aux = cadena.trim();
		StringBuilder sb = new StringBuilder();

		char[] especiales = { 'á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú' };
		char[] normales = { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' };

		externo: for (int i = 0; i < aux.length(); i++) {
			for (int j = 0; j < normales.length; j++) {
				if (aux.charAt(i) == especiales[j]) {
					sb.append(normales[j]);
					continue externo;
				}
			}
			sb.append(aux.charAt(i));
		}

		return sb.toString();
	}

	public static String toSinTildesSinEspacios(String cadena) {
		String aux = cadena.trim();
		StringBuilder sb = new StringBuilder();

		char[] especiales = { 'á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú' };
		char[] normales = { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' };

		externo: for (int i = 0; i < aux.length(); i++) {
			if (aux.charAt(i) != ' ') {
				for (int j = 0; j < normales.length; j++) {
					if (aux.charAt(i) == especiales[j]) {
						sb.append(normales[j]);
						continue externo;
					}
				}
				sb.append(aux.charAt(i));
			}

		}

		return sb.toString();
	}

}
