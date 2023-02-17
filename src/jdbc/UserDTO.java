package jdbc;

public class UserDTO {
	private String email;
	private String password;
	private String name;
	private String job;
	private String approve;
	private String joindate;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public UserDTO(String email, String password, String name, String job, String approve, String joindate) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.job = job;
		this.approve = approve;
		this.joindate = joindate;
	}
}

