package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import oggetti.Virtus;



public class VirtusDao extends BaseDao {

	public VirtusDao() throws SQLException {
		super();
	}
	
	/**public void inserisciVirtusDefault(int idUtente) throws ClassNotFoundException, SQLException {
		getConnection();
		Statement statement = connection.createStatement();
		
		for(int i=1; i <= 5; i++) {
			String query = "INSERT INTO ha_virtus(idUtente,idVirtus) VALUES(" + idUtente + "," + i +")";
			
			try {
				statement.executeUpdate(query);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}	
		
		statement.close();
		connection.close();
	}
	
	public ArrayList<Virtus> getVirtusUtente(int idUtente) throws ClassNotFoundException, SQLException {
		
		ArrayList<Virtus> listaVirtus = new ArrayList<Virtus>();
		getConnection();
		
		String 	query  = "SELECT virtus.idVirtus as idVirtus, virtus.nome as nome, ha_virtus.valore, virtus.descrizione as descrizione, virtus.idStatsbase1 as stat1,virtus.idStatsbase2 as stat2, ha_virtus.puntiCrescita as PC FROM virtus, ha_virtus ";
		query += "WHERE ha_virtus.idUtente = " + idUtente + " AND virtus.idVirtus = ha_virtus.idVirtus";

		Statement statement = connection.createStatement();
		ResultSet result=statement.executeQuery(query);

		while(result.next()) {
						
			Virtus virtus = new Virtus(result.getInt("idVirtus"),result.getString("nome"),result.getInt("valore"),result.getString("descrizione"),result.getInt("stat1"),result.getInt("stat2"),result.getInt("PC"));
			listaVirtus.add(virtus);
		}
		
		statement.close();
		connection.close(); 

		return listaVirtus;
	}**/
	
	
}
