package oggetti;

import java.io.Serializable;

public class Utente implements Serializable{
	
	private static final long serialVersionUID = -6712649409791035393L;
	
	private int 	idUtente = 0;
	private String 	username = "";
	private String 	password = "";
	private int 	tempoGioco = 0;
	
	private int pvMax;
	private int pvAttuali;
	private int pvBonus;
	
	private int paMax;
	private int paAttuali;
	private int paBonus;
	
	private int resistenza;
	private int resistenzaBonus;
	
	private int chanceCrit;
	private int chanceCritBonus;
	
	private int dannoCrit;
	private int dannoCritBonus;
	
	private int evasione;
	private int evasioneBonus;
	
	private int precisione;
	private int precisioneBonus;
	
	
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

	public int getPvMax() {
		return pvMax;
	}

	public void setPvMax(int pvMax) {
		this.pvMax = pvMax;
	}

	public int getPvAttuali() {
		return pvAttuali;
	}

	public void setPvAttuali(int pvAttuali) {
		this.pvAttuali = pvAttuali;
	}

	public int getPvBonus() {
		return pvBonus;
	}

	public void setPvBonus(int pvBonus) {
		this.pvBonus = pvBonus;
	}

	public int getPaMax() {
		return paMax;
	}

	public void setPaMax(int paMax) {
		this.paMax = paMax;
	}

	public int getPaAttuali() {
		return paAttuali;
	}

	public void setPaAttuali(int paAttuali) {
		this.paAttuali = paAttuali;
	}

	public int getPaBonus() {
		return paBonus;
	}

	public void setPaBonus(int paBonus) {
		this.paBonus = paBonus;
	}

	public int getResistenza() {
		return resistenza;
	}

	public void setResistenza(int resistenza) {
		this.resistenza = resistenza;
	}

	public int getResistenzaBonus() {
		return resistenzaBonus;
	}

	public void setResistenzaBonus(int resistenzaBonus) {
		this.resistenzaBonus = resistenzaBonus;
	}

	public int getChanceCrit() {
		return chanceCrit;
	}

	public void setChanceCrit(int chanceCrit) {
		this.chanceCrit = chanceCrit;
	}

	public int getChanceCritBonus() {
		return chanceCritBonus;
	}

	public void setChanceCritBonus(int chanceCritBonus) {
		this.chanceCritBonus = chanceCritBonus;
	}

	public int getDannoCrit() {
		return dannoCrit;
	}

	public void setDannoCrit(int dannoCrit) {
		this.dannoCrit = dannoCrit;
	}

	public int getDannoCritBonus() {
		return dannoCritBonus;
	}

	public void setDannoCritBonus(int dannoCritBonus) {
		this.dannoCritBonus = dannoCritBonus;
	}

	public int getEvasione() {
		return evasione;
	}

	public void setEvasione(int evasione) {
		this.evasione = evasione;
	}

	public int getEvasioneBonus() {
		return evasioneBonus;
	}

	public void setEvasioneBonus(int evasioneBonus) {
		this.evasioneBonus = evasioneBonus;
	}

	public int getPrecisione() {
		return precisione;
	}

	public void setPrecisione(int precisione) {
		this.precisione = precisione;
	}

	public int getPrecisioneBonus() {
		return precisioneBonus;
	}

	public void setPrecisioneBonus(int precisioneBonus) {
		this.precisioneBonus = precisioneBonus;
	}
	
	
	
}
