package oggetti;

import java.io.Serializable;

public class Pagina implements Serializable {
	
	private static final long serialVersionUID = -8840788563442439690L;
	private int idPagina;
	private String percorso = "";
	
	public Pagina() {
		
	}

	public int getIdPagina() {
		return idPagina;
	}

	public void setIdPagina(int idPagina) {
		this.idPagina = idPagina;
	}

	public String getPercorso() {
		return percorso;
	}

	public void setPercorso(String percorso) {
		this.percorso = percorso;
	}
	
	

}
