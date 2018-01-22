package oggetti;

import java.io.Serializable;

public class Virtus implements Serializable {

	private static final long serialVersionUID = -1137115472418074900L;
	
	private int idVirtus;
	private String nome;
	private int valore;
	private String descrizione;
	private int idStatsbase1;
	private int idStatsbase2;
	private int puntiCrescita;
	public final int maxPC = 5;
	
	public Virtus() {
		
	}
	
	public Virtus(int idVirtus, String nome, int valore, String descrizione) {
		this.idVirtus = idVirtus;
		this.nome = nome;
		this.valore = valore;
		this.descrizione = descrizione;
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
	
}
