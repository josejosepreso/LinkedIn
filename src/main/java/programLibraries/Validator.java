package programLibraries;

/*
 * Confirma si la entrada de texto del usuario es adecuada al campo de texto.
 * @version 0.1.2
 * @date 2024/04/29
 * @since 2024/04/27
 * */
public class Validator {

	/*
	 * Valida si el texto ingresado tiene el formato de un email
	 * @return True si tiene el formato; False si no.
	 * */
	public static boolean isEmail(String text) {
		
		if(text != null && text.trim().matches("[\\w\\.-]+@[\\w\\.-]+\\.\\w+")) {
			return true;
		}
		
		return false;
	}
	
	/*
	 * Valida si el texto ingresado tiene el formato de un nombre cuenta de YouTube
	 * @return True si tiene el formato; False si no.
	 * */
	public static boolean isAccountName(String text) {

		if(text != null && text.trim().matches("([a-zA-Z0-9áéíóú\\/\\!]\\s*)+")) {
			return true;
		}
		
		return false;
	}
	
	/*
	 * Valida si la opcion elegida es v\'alida
	 * @return True si es v\'alida; False si no.
	 * */
	public static boolean isValidOption(String option) {
		
		if(option !=null && option.trim().matches("[2345]")) {
			return true;
		}
		
		return false;
	}
	
	/*
	 * Valida si el texto ingresado tiene el formato de una etiqueta iframe
	 * @return True si tiene el formato; False si no.
	 * */
	public static boolean isIframe(String text) {
		
		if(text != null && text.trim().matches("<iframe\\s+.*?\\/?><\\/iframe>")) {
			return true;
		}
		
		return false;
	}
	
	/*
	 * Limpia el texto de descripcion
	 * @param text Refiere al texto a limpiar.
	 * @return Retorna el texto limpio.
	 * */
	public static String cleanDescription(String text) {
		
		if(text != null) {
			text = text.trim().replaceAll(",", "(()");
			text = text.trim().replaceAll("\\t", ")))");
			text = text.trim().replaceAll("[^\\w \\náéíóú\\!\\?\\(\\)\\@\\#\\-\\.\\&]", "");
			text = text.replaceAll("\\n", "(((");
		}
		
		return text;
	}

	/*
	 * Valida si el texto ingresado es una fecha valida
	 * @return True si tiene el formato; False si no.
	 * */
	public static boolean isDate(String text) {
		
		if(text != null && text.trim().matches("(19|20)\\d{2}\\/(0[1-9]|1[012])\\/(0[1-9]|[12][0-9]|3[01])")) {
			return true;
		}
		
		return false;
	}

	/*
	 * Valida si el texto ingresado es un numero entero
	 * @return True si tiene el formato; False si no.
	 * */
	public static boolean isNumber(String text) {
		
		if(text != null && text.trim().matches("\\d+")) {
			return true;
		}
		
		return false;
	}
}