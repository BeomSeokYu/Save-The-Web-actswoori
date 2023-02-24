package worship;

import lombok.*;

@AllArgsConstructor
@Data
public class WorshipDTO {
	int wno;
	String email;
	String wname;
	String wtitle;
	String wcontent;
	String wdate;
}
