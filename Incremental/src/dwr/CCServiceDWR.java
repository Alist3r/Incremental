package dwr;

import java.sql.SQLException;

import dao.DizionarioDao;

public class CCServiceDWR {

	
	public String dizionarioGetDescrizione(String codParola) throws SQLException, ClassNotFoundException {
		
		DizionarioDao dizDao = new DizionarioDao();
		return dizDao.getDescrizione(codParola);
		
	}
	
	public String dizionarioGetParola(String codParola) throws SQLException, ClassNotFoundException {
		
		DizionarioDao dizDao = new DizionarioDao();
		return dizDao.getParola(codParola);
		
	}
}
