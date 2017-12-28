package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import utility.*;

public class BaseDao {

	protected String driver = "";
	protected String dbURL = "";
	protected Connection connection = null;
	
	public BaseDao() {

	}
	
	public void getConnection() throws SQLException ,ClassNotFoundException{
		this.driver = Costanti.DB_CONNECTOR_DRIVER;
		
		Class.forName(driver);
		
		this.dbURL = Costanti.DB_CONNECTION;
		this.connection = DriverManager.getConnection(dbURL, "root", "");
		
		
	}
}
