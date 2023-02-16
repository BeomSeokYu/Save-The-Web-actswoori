package jdbc;

public class coopDTO {
	private int cno;
	private String ctitle,ccontent,email,cdate;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public coopDTO(int cno, String ctitle, String ccontent, String email, String cdate) {
		super();
		this.cno = cno;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.email = email;
		this.cdate = cdate;
	}

	public coopDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
}
