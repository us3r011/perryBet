package bean;

import java.sql.Date;

public class UtenteBean {
	private String nome;
	private String cognome;
	private String user;
	private String password;
	private String email;
	private String citta;
	private String indirizzo;
	private Date dataDiNascita;
	private String codiceConto;
	private String CF;
	private boolean admin;
	
	public UtenteBean() {
		this.nome = "";
		this.cognome = "";
		this.user ="";
		this.password="";
		this.email="";
		this.citta="";
		this.indirizzo="";
		this.dataDiNascita=null;
		this.codiceConto="";
		this.CF="";
		this.admin=false;
		
	}
	
	public UtenteBean(String CF, String nome, String cognome, String user, String password, String email, String citta, String indirizzo, Date dataDiNascita) {
		super();
		this.CF = CF;
		this.nome = nome;
		this.cognome = cognome;
		this.user = user;
		this.password = password;
		this.email = email;
		this.citta = citta;
		this.indirizzo = indirizzo;
		this.dataDiNascita = dataDiNascita;
		this.admin = false;
	}

	
	
	public String getCittà() {
		return citta;
	}

	public void setCittà(String citta) {
		this.citta = citta;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public Date getDataDiNascita() {
		return dataDiNascita;
	}

	public void setDataDiNascita(Date dataDiNascita) {
		this.dataDiNascita = dataDiNascita;
	}

	public String getCF() {
		return CF;
	}

	public void setCF(String cF) {
		CF = cF;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCodiceConto() {
		return codiceConto;
	}

	public void setCodiceConto(String codiceConto) {
		this.codiceConto = codiceConto;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "UtenteBean [nome=" + nome + ", cognome=" + cognome + ", user=" + user + ", password=" + password
				+ ", email=" + email + ", codiceConto=" + codiceConto + ", CF=" + CF + ", admin=" + admin + "]";
	}
	
	
	
	
}
