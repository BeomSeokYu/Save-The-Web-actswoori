package jdbc;

import lombok.Data;

@Data
public class UserDTO {
	private String email;
	private String password;
	private String name;
	private String job;
	private String approve;
	private String joindate;
}