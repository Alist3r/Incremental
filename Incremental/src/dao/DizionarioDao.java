package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class DizionarioDao extends BaseDao {

	public DizionarioDao() throws SQLException {
		super();
	}
	
	
	public String getDescrizione(String codParola) throws ClassNotFoundException, SQLException {
		String desc = "";
		getConnection();
		
		String query = "SELECT descrizione FROM dizionario WHERE codparola = '" + codParola + "'";
		Statement statement = connection.createStatement();
		ResultSet result=statement.executeQuery(query);
		
		if(result.next()) {
			desc = result.getString("descrizione");
		}
		
		return desc;
	}
	
	public String getParola(String codParola) throws ClassNotFoundException, SQLException {
		String parola = "";
		getConnection();
		
		String query = "SELECT parola FROM dizionario WHERE codparola = '" + codParola + "'";
		Statement statement = connection.createStatement();
		ResultSet result=statement.executeQuery(query);
		
		if(result.next()) {
			parola = result.getString("parola");
		}
		
		return parola;
	}
	
	
}
