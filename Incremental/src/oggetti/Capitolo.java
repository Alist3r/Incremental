package oggetti;

import java.io.Serializable;

public class Capitolo implements Serializable {
	
	private static final long serialVersionUID = -8840788563442439690L;
	private int idCapitolo;
	private String nome = "";
	
	public Capitolo() {
		
	}

	public int getIdCapitolo() {
		return idCapitolo;
	}

	public void setIdCapitolo(int idCapitolo) {
		this.idCapitolo = idCapitolo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	

}
