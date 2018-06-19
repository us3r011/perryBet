package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import bean.EventoBean;
import connection.ConnectionPool;


public class EventoModel {
	
	public Collection<EventoBean> doRetrieveAll() throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		Collection<EventoBean> eventi = new LinkedList<EventoBean>();
				
		String query = "select * from Evento";
 		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				EventoBean e = new EventoBean();
				
				e.setData(rs.getDate("DataEvento"));
				e.setEvento(rs.getString("Evento"));
				e.setPalinsesto(rs.getString("Palinsesto"));
				e.setQuota1(rs.getString("Quota1"));
				e.setQuota2(rs.getString("Quota2"));
				e.setQuotaX(rs.getString("QuotaX"));
				e.setSquadraCasa(rs.getString("CasaCod_Squadra"));
				e.setSquadraTrasferta(rs.getString("TrasfertaCod_Squadra"));
				
				eventi.add(e);
			}

		}  finally{
			
			 try{
				 if(stmt!=null)
					 stmt.close();
			 }
			 finally{
				 ConnectionPool.releaseConnection(conn);
			 }		 
		 }
		
		return eventi;	
	}
	
	public void aggiungiEvento(EventoBean evento) throws SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String query = "insert into Evento (Palinsesto, Evento, Data) values (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ConnectionPool.getConnection();
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, evento.getPalinsesto());
			stmt.setString(2, evento.getEvento());
			stmt.setDate(3, evento.getData());
			stmt.setString(4, evento.getSquadraCasa());
			stmt.setString(5, evento.getSquadraTrasferta());
			stmt.setString(6, evento.getQuota1());
			stmt.setString(7, evento.getQuotaX());
			stmt.setString(8, evento.getQuota2());
			
			stmt.executeUpdate();
			conn.commit();
			
			
		} finally {
			 try{
				 if(stmt!=null)
					 stmt.close();
			 }
			 finally{
				 ConnectionPool.releaseConnection(conn);
			 }		 
		}	
	}
	
	public void modificaEvento(EventoBean evento) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
	}
}
