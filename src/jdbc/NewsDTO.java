package jdbc;

import lombok.*;

/*최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15)*/


@AllArgsConstructor
@NoArgsConstructor
@Data
public class NewsDTO {
	private String nno, ntitle, ncontent, email, ndate;
	
	
}
