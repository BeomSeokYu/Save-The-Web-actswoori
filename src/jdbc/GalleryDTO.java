package jdbc;

public class GalleryDTO {
	private int gno;
	private String gtitle;
	private String gupfolder;
	private String guuid;
	private String gfilename;
	private String email;
	private String gdate;
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGtitle() {
		return gtitle;
	}
	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}
	public String getGuuid() {
		return guuid;
	}
	public void setGuuid(String guuid) {
		this.guuid = guuid;
	}
	public String getGfilename() {
		return gfilename;
	}
	public void setGfilename(String gfilename) {
		this.gfilename = gfilename;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGdate() {
		return gdate;
	}
	public void setGdate(String gdate) {
		this.gdate = gdate;
	}
	public String getGupfolder() {
		return gupfolder;
	}
	public void setGupfolder(String gupfolder) {
		this.gupfolder = gupfolder;
	}
	public GalleryDTO(int gno, String gtitle, String gupfolder, String guuid, String gfilename, String email,
			String gdate) {
		super();
		this.gno = gno;
		this.gtitle = gtitle;
		this.gupfolder = gupfolder;
		this.guuid = guuid;
		this.gfilename = gfilename;
		this.email = email;
		this.gdate = gdate;
	}
	
}
