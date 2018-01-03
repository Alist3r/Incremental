package oggetti.utili;

public class Messaggio {

	private String msg = "";
	private String colore = "";
	
	public Messaggio() {
		
	}
	
	public Messaggio(String msg, String colore) {
		this.msg = msg;
		this.colore = colore;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getColore() {
		return colore;
	}

	public void setColore(String colore) {
		this.colore = colore;
	}
	
	
}
