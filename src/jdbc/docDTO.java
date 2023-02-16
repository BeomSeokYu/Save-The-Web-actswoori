package jdbc;

public class docDTO {
	private int dno;
	private String dtitle;
	private String dcontent;
	private String email;
	private String ddate;
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public docDTO(int dno, String dtitle, String dcontent, String email, String ddate) {
		super();
		this.dno = dno;
		this.dtitle = dtitle;
		this.dcontent = dcontent;
		this.email = email;
		this.ddate = ddate;
	}
	public docDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
