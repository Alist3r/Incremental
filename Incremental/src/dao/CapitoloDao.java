package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class CapitoloDao extends BaseDao {

	public CapitoloDao() throws SQLException {
		super();
	}
	
	public String getUltimoCapitolo(int idUtente) throws ClassNotFoundException, SQLException {
		
		String nomeCapitolo;
		getConnection();
		
		String query = "SELECT capitolo.nome FROM ultimocapitolo, capitolo WHERE ultimocapitolo.idUtente = " + idUtente + " and capitolo.idCapitolo = ultimocapitolo.idCapitolo";
		
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);
		
		if(!result.next()) {
			String query2 = "INSERT INTO ultimocapitolo(idUtente, idCapitolo) VALUES (" + idUtente + ",1)";
			statement.executeUpdate(query2);
			nomeCapitolo = "capitolo-1";
		}
		else {
			nomeCapitolo = result.getString("nome");
		}
		
		statement.close();
		connection.close(); 
		
		return nomeCapitolo;
	}	
	
	public void setUltimoCapitolo(int idUtente,String idCapitolo) {
		
		try {
			getConnection();
			Statement statement = connection.createStatement();
			
			String query = "UPDATE ultimocapitolo SET ultimocapitolo.idCapitolo = " + idCapitolo + " WHERE ultimocapitolo.idUtente = " + idUtente;
			
			statement.executeUpdate(query);
			statement.close();
			connection.close(); 
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}
	
}
