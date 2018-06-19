package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import bean.EventoBean;
import bean.UtenteBean;
import connection.ConnectionPool;

public class UtenteModel {
	
	public UtenteBean checkUser(String user, String pass) throws SQLException{
		boolean found = false;
		Connection conn = null;
		PreparedStatement stmt = null;
		UtenteBean utente = new UtenteBean();
		String query="SELECT * FROM Registrato WHERE Username=? AND Password=?";
		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				found = true;
				utente = doRetrieveByUsername(user);
			}
			stmt.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try{
				 if(stmt!=null)
					 stmt.close();
			 }
			 finally{
				 ConnectionPool.releaseConnection(conn);
			 }
		}
		
		return utente;
	}
	
	public UtenteBean doRetrieveByUsername(String username) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		UtenteBean utente = new UtenteBean();
		String query ="SELECT * FROM Registrato WHERE Username=?";
		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			
			utente.setUser(rs.getString("Username"));
			utente.setPassword(rs.getString("Password"));
			utente.setCodiceConto(rs.getString("CodiceConto"));
			utente.setCF(rs.getString("CF"));
			utente.setAdmin(rs.getBoolean("Admin"));
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				} 
			} finally {
				ConnectionPool.releaseConnection(conn);
			}
		}
		
		return utente;			
	}
	
	public Collection<UtenteBean> doRetrieveAll() throws SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		
		Collection<UtenteBean> utenti = new LinkedList<UtenteBean>();
		
		String query = "select * from Registrato";
		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				UtenteBean u = new UtenteBean();
				
				u.setAdmin(rs.getBoolean("Admin"));
				u.setCF(rs.getString("CF"));
				u.setCittà(rs.getString("Città"));
				u.setCodiceConto(rs.getString("CodiceConto"));
				u.setCognome(rs.getString("Cognome"));
				u.setDataDiNascita(rs.getDate("DataDiNascita"));
				u.setEmail(rs.getString("Email"));
				u.setIndirizzo(rs.getString("Indirizzo"));
				u.setNome(rs.getString("Nome"));
				u.setPassword(rs.getString("Password"));
				u.setUser(rs.getString("Username"));
				
				utenti.add(u);
			}
		} finally {
			try {
				if(stmt != null) stmt.close();
			} finally {
				ConnectionPool.releaseConnection(conn);
			}
		}
		
		return utenti;
				
	}
	
	public void doSave(UtenteBean utente) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String query = "INSERT INTO Registrato (Username, Password, CF, Email, Nome, Cognome, Città, Indirizzo, DataDiNascita) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1, utente.getUser());
			stmt.setString(2, utente.getPassword());
			stmt.setString(3, utente.getCF());
			stmt.setString(4, utente.getEmail());
			stmt.setString(5, utente.getNome());
			stmt.setString(6, utente.getCognome());
			stmt.setString(7, utente.getCittà());
			stmt.setString(8, utente.getIndirizzo());
			stmt.setDate(9, utente.getDataDiNascita());
			stmt.executeUpdate();
			
			conn.commit();
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
			
			}  finally {
				ConnectionPool.releaseConnection(conn);
				}
		}
	}
	
	
	public boolean alreadyExists(UtenteBean utente) throws SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		String query = "SELECT * FROM Registrato WHERE Username = ?";
		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1, utente.getUser());
			
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				return true;
			}
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
			} finally {
				ConnectionPool.releaseConnection(conn);
			}
		}
		
		return false;
	}
	
	
}
