import java.util.Date;

public class User {
	private String id;
	private String pw;
	private Date date;
	private String sdate;

	public User(String id, String pw, Date date, String sdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.date = date;
		this.sdate = sdate;
	}

	public String getId() {
		return id;
	}
	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}




}
