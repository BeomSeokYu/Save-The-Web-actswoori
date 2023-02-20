/*
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
       0.5(기본작업 23/02/15) 
       0.7(추가 디자인 23/02/15)
       1.0(1차 완성 23/02/15)
*/
package jdbc;

import lombok.Data;

@Data
public class PostDTO {
	int pno;
	String ptitle, pupfolder, puuid, pfilename, email, pdate;
	
	public PostDTO() {}
	public PostDTO(int pno, String ptitle, String pupfolder, String puuid, String pfilename, String email,
			String pdate) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.pupfolder = pupfolder;
		this.puuid = puuid;
		this.pfilename = pfilename;
		this.email = email;
		this.pdate = pdate;
	}
	
}
