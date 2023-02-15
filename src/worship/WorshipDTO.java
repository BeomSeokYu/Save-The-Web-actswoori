package worship;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class WorshipDTO {
	int wno;
	String email;
	String wtitle;
	String wcontent;
	String wdate;
}
