package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor //모든 필드쓰는 생성자
@Data //기본생성자
public class LectureDTO {
	
	private int lno;
	private String ltitle;
	private String lname;
	private String lcontent;
	private String email;
	private String ldate;
}
