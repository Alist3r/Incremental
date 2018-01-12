package oggetti;

import java.io.Serializable;

public class Utente implements Serializable {
	
	private static final long serialVersionUID = -6712649409791035393L;
	
	private int 	idUtente = 0;
	private String 	username = "";
	private String 	password = "";
	private int 	tempoGioco = 0;
		
	public Utente() {
		
	}	
	
	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public float getTempoGioco() {
		return tempoGioco;
	}

	public void setTempoGioco(int tempoGioco) {
		this.tempoGioco = tempoGioco;
	}

	
}
