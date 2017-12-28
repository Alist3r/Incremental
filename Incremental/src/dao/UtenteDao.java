package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oggetti.Utente;



public class UtenteDao extends BaseDao {

	public UtenteDao() throws SQLException {
		super();
	}
	
	public int inserisciUtente(String email, String psw) throws ClassNotFoundException, SQLException {
		
		/* 0 = Non registrato
		 * 1 = Registrato
		 * 2 = Email già esistente
		 */
		int esito = 0;
		getConnection();
		Statement statement = connection.createStatement();
		
		String query = "INSERT INTO utente(email,password) VALUES('" +  email + "','" + psw + "')";
		
		try {
			statement.executeUpdate(query);
			statement.close();
			statement.close();
			connection.close(); 
		}
		catch(SQLException e) {
			e.printStackTrace();
			esito = 0;
			return esito;
		}
		
		
		
		return esito;
		
	}
	
	public Utente getDaUsernameEPassword(String email, String password) throws ClassNotFoundException, SQLException
	{
		Utente account=null;
		getConnection();

		String 	query  = "SELECT * FROM utente ";
				query += "WHERE email='" + email + "'";
				query += "AND password='" + password + "'";

		Statement statement = connection.createStatement();
		ResultSet result=statement.executeQuery(query);
		
		
		//System.out.println("RESULT_USERNAME:" + result.getString("username"));
		//System.out.println("RESULT_PASSWORD:" + result.getString("password"));
		
		//setto l'utente da mettere in session
		if(result.next()) {
			account = new Utente();
			account.setIdUtente(result.getInt("idUtente"));
			account.setEmail(result.getString("email"));
			account.setPassword(result.getString("password"));
		}
		
		statement.close();
		connection.close(); 
		
		return account;
		
	}
}
