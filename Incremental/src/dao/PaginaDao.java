package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class PaginaDao extends BaseDao {

	public PaginaDao() throws SQLException {
		super();
	}
	
	public String getUltimaPagina(int idUtente) throws ClassNotFoundException, SQLException {
		
		String percorso = "";
		getConnection();
		
		String query = "SELECT percorso FROM pagina, ultimapagina WHERE ultimapagina.idUtente = " + idUtente + " AND pagina.idPagina = ultimapagina.idPagina";
		
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);
		
		if(!result.next()) {
			String query2 = "INSERT INTO ultimapagina(idUtente, idPagina) VALUES (" + idUtente + ",1)";
			statement.executeUpdate(query2);
			percorso = "prologo/prologo-1";
		}
		else {
			percorso = result.getString("percorso");
		}
		
		statement.close();
		connection.close(); 
		
		return percorso;
	}	
	
}
