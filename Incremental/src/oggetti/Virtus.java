package oggetti;

import java.io.Serializable;

import utility.Costanti;

public class Virtus implements Serializable {

	private static final long serialVersionUID = -1137115472418074900L;
	
	/**private int idVirtus;
	private String nome;
	private int valore;
	private String descrizione;
	private int idStatsbase1;
	private int idStatsbase2;
	private int puntiCrescita;
	private String urlIcona;
	public final int maxPC = 5;
	
	public Virtus() {
		
	}
	
	
	public Virtus(int idVirtus, String nome, int valore, String descrizione, int idStatsbase1, int idStatsbase2, int puntiCrescita) {
		
		this.idVirtus = idVirtus;
		this.nome = nome;
		this.valore = valore;
		this.descrizione = descrizione;
		this.idStatsbase1 = idStatsbase1;
		this.idStatsbase2 = idStatsbase2;
		this.urlIcona = defaultUrlIcona(idVirtus);
		
	}
		
	private String defaultUrlIcona(int idVirtus) {
		
		String urlIcona = "";
		
		switch (idVirtus) {
			case 1: urlIcona = Costanti.URL_IMG_CORAGGIO; break;
			case 2: urlIcona = Costanti.URL_IMG_ASTUZIA; break;
			case 3: urlIcona = Costanti.URL_IMG_VIGORE; break;
			case 4: urlIcona = Costanti.URL_IMG_GIUSTIZIA; break;
			case 5: urlIcona = Costanti.URL_IMG_VOLONTA; break;
		}
		
		return urlIcona;
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

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getIdStatsbase1() {
		return idStatsbase1;
	}

	public void setIdStatsbase1(int idStatsbase1) {
		this.idStatsbase1 = idStatsbase1;
	}

	public int getIdStatsbase2() {
		return idStatsbase2;
	}

	public void setIdStatsbase2(int idStatsbase2) {
		this.idStatsbase2 = idStatsbase2;
	}

	public int getPuntiCrescita() {
		return puntiCrescita;
	}

	public void setPuntiCrescita(int puntiCrescita) {
		this.puntiCrescita = puntiCrescita;
	}

	public String getUrlIcona() {
		return urlIcona;
	}

	public void setUrlIcona(String urlIcona) {
		this.urlIcona = urlIcona;
	}	**/
		
}
