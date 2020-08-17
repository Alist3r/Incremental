package oggetti;

import java.io.Serializable;

public class Statsbase implements Serializable {
	
	private static final long serialVersionUID = -5260819860382082270L;
	
	private int idStatsbase;
	private String nome;
	private String descrizione;
	private String abbrev;
	private int valoreBase;
	private int valoreAttuale;
	private int bonusEquip;
	private int bonusTalento;
	
	public Statsbase() {
		
	}

	public int getIdStatsbase() {
		return idStatsbase;
	}

	public void setIdStatsbase(int idStatsbase) {
		this.idStatsbase = idStatsbase;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getValoreBase() {
		return valoreBase;
	}

	public void setValoreBase(int valoreBase) {
		this.valoreBase = valoreBase;
	}

	public int getValoreAttuale() {
		return valoreAttuale;
	}

	public void setValoreAttuale(int valoseAttuale) {
		this.valoreAttuale = valoseAttuale;
	}

	public int getBonusEquip() {
		return bonusEquip;
	}

	public void setBonusEquip(int bonusEquip) {
		this.bonusEquip = bonusEquip;
	}


	public int getBonusTalento() {
		return bonusTalento;
	}

	public void setBonusTalento(int bonusTalento) {
		this.bonusTalento = bonusTalento;
	}
		
	public String getAbbrev() {
		return abbrev;
	}

	public void setAbbrev(String abbrev) {
		this.abbrev = abbrev;
	}

	public int getValoreTot() {
		return valoreBase + bonusEquip + bonusTalento;
	}
	
	
}
