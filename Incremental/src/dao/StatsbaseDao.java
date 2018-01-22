package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import oggetti.Statsbase;



public class StatsbaseDao extends BaseDao {

	public StatsbaseDao() throws SQLException {
		super();
	}
	
	public void inserisciStatsDefault(int idUtente) throws ClassNotFoundException, SQLException {
		getConnection();
		Statement statement = connection.createStatement();
		
		
		String query = "select idStatsbase, defaultUtente from statsbase";
		ResultSet result = statement.executeQuery(query);
		
		while(result.next()) {
			int idStat = result.getInt("idStatsbase");
			int valoreDefault = result.getInt("defaultUtente");
			String query2 = "INSERT INTO defstatsutente(idUtente,idStatsbase,valoreBase,valoreAttuale) VALUES(" + idUtente + "," + idStat +"," + valoreDefault + "," + valoreDefault + ")";
			
			Statement statement2 = connection.createStatement();
			statement2.executeUpdate(query2);
			statement2.close();
		}
		
		statement.close();
		connection.close();
	}
	
	public ArrayList<Statsbase> getStatsUtente(int idUtente) throws ClassNotFoundException, SQLException {
		
		ArrayList<Statsbase> listaStats = new ArrayList<Statsbase>();
		getConnection();
		
		String query = "SELECT defstatsutente.idStatsbase as idstat,nome,descrizione,abbrev,valoreBase,valoreAttuale,bonusEquip,bonusVirtus,bonusAbilita FROM statsbase,defstatsutente WHERE ";
				query += " defstatsutente.idUtente = " + idUtente + " AND defstatsutente.idStatsbase = statsbase.idStatsbase";

		Statement statement = connection.createStatement();
		ResultSet result=statement.executeQuery(query);

		while(result.next()) {
			Statsbase stat = new Statsbase();
			stat.setIdStatsbase(result.getInt("idstat"));
			stat.setNome(result.getString("nome"));
			stat.setDescrizione(result.getString("descrizione"));
			stat.setAbbrev(result.getString("abbrev"));
			stat.setValoreBase(result.getInt("valoreBase"));
			stat.setValoreAttuale(result.getInt("valoreAttuale"));
			stat.setBonusEquip(result.getInt("bonusEquip"));
			stat.setBonusVirtus(result.getInt("bonusVirtus"));
			stat.setBonusAbilita(result.getInt("bonusAbilita"));	
			listaStats.add(stat);
		}
		
		statement.close();
		connection.close(); 

		return listaStats;
	}
	
	
}
