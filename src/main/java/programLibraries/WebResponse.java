package programLibraries;

/*
 * Entrega una respuesta unforme en formato JSON o XML para peticiones asincronas.
 * @author jose.inestroza@unah.edu.hn
 * @version 0.1.1
 * @date 2024/03/19
 * @since 2024/03/18
 * */
public class WebResponse {
	
	/*Define el estado booleano de la respuesta. False refiere a una respuesta negativa y True su opuesto*/
	private boolean status;
	
	/*Posee el contenido de la respuesta para/hacia el usuario final*/
	private String content;
	
	/*
	 * Retorna el estado de la respuesta web
	 * @return Si el estado refiere a que existio fallo o no existio.
	 * */
	public boolean isStatus() {
		return this.status;
	}
	
	/*
	 * Establece el nuevo estado de la respuesta asincrona, indicando si existio error o no al procesar la misma.
	 * @param status Refiere al nuevo estado.
	 * */
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	/*
	 * Retorna el contenido establecido en la respuesta
	 * @return retorna el contenido de la respuesta
	 * */
	public String getContent() {
		return this.content;
	}
	
	/*
	 * Establece el contenido de la respuesta asincrona
	 * @param content Refiere al nuevo contenido
	 * */
	public void setContent(String content) {
		this.content = content;
	}
	
	/*
	 * Limpia una cadena de texto de caracteres de salto de linea o tabulado
	 * @param text Refiere al texto a limpiar
	 * @return Retorna el texto limpio
	 * */
	public String clean(String text) {
		
		text = text.trim().replaceAll("[\\n\\t]+", "");
		
		return text;
		
	}
	
	/*
	 * Formatea la respuesta a un JSON
	 * @return Retorna la respuesta en formato JSON
	 * */
	public String toJSON() {
		StringBuilder result = new StringBuilder("{");
		
		result.append(String.format("\"status\":%s,", this.status));
		result.append(String.format("\"content\":\"%s\"", this.clean(this.content)));
		
		result.append("}");
		return result.toString();
	}
	
	/*
	 * Formatea la respuesta a XML
	 * @return Retorna la respuesta en formato XML 
	 * */
	public String toXML() {
		StringBuilder result = new StringBuilder("<response>");
		
		result.append(String.format("<status>%s</status>", this.status));
		result.append(String.format("<content>%s</content>", this.content));
		
		result.append("</response>");
		return result.toString();
	}
}
