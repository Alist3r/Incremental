package oggetti;

import java.io.Serializable;

public class Dizionario implements Serializable {


	private static final long serialVersionUID = -5281333521164771076L;
	private int idDizionario;
	private String codParola;
	private int livelloAstuzia;
	private String parola;
	private String descrizione;
	
	public Dizionario() {
		
	}

	public int getIdDizionario() {
		return idDizionario;
	}

	public void setIdDizionario(int idDizionario) {
		this.idDizionario = idDizionario;
	}

	public String getCodParola() {
		return codParola;
	}

	public void setCodParola(String codParola) {
		this.codParola = codParola;
	}

	public int getLivelloAstuzia() {
		return livelloAstuzia;
	}

	public void setLivelloAstuzia(int livelloAstuzia) {
		this.livelloAstuzia = livelloAstuzia;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getParola() {
		return parola;
	}

	public void setParola(String parola) {
		this.parola = parola;
	}

	
}
