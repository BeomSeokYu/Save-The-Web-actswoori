package vow;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class VowDTO {
	int vno;
	String email;
	String vtitle;
	String vcontent;
	String vdate;
}
