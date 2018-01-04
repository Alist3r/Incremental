package oggetti;

import java.io.Serializable;

public class Virtus implements Serializable {

	private static final long serialVersionUID = -1137115472418074900L;
	
	private int idVirtus;
	private String nome;
	private int valore;
	
	public Virtus() {
		
	}
	
	public Virtus(int idVirtus, String nome, int valore) {
		this.idVirtus = idVirtus;
		this.nome = nome;
		this.valore = valore;
	}
	
	public Virtus(int idVirtus, String nome) {
		this.idVirtus = idVirtus;
		this.nome = nome;
		valore = 0;
	}
		
	public int getIdVirtus() {
		return idVirtus;
	}

	public void setIdVirtus(int idVirtus) {
		this.idVirtus = idVirtus;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getValore() {
		return valore;
	}

	public void setValore(int valore) {
		this.valore = valore;
	}
	
	
	

}
