package jdbc;

public class PageDTO {
	private final double NUM_PER_PAGE = 5.0;	// 한 페이지에 표시 할 페이지 번호 수
	private int start;							// 시작 페이지 번호
	private int end;							// 끝 페이지 번호
	private boolean previous;					// 이전
	private boolean next;						// 다음
	private Criteria criteria;					// 페이지에 대한 정보 객체
	
	public PageDTO(Criteria criteria, int totalCount) {
		this.criteria = criteria;
		
		int amount = criteria.getAmount();
		int pageNum = criteria.getPageNum();
		
		int pages = (int) Math.ceil((double) totalCount / amount);
		//int pagingPage = (int) Math.ceil(pages / NUM_PER_PAGE);

		end = (int) (Math.ceil(pageNum / NUM_PER_PAGE) * NUM_PER_PAGE);
		start = (int) (end - (NUM_PER_PAGE - 1));
		end = end >= pages ? pages : end;	// 실제 끝 페이지 번호 확인
//		if (criteria.getPageNum() > end) {
//			criteria.setPageNum(end);
//		}
		previous = start > 1;
		next = end < pages;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrevious() {
		return previous;
	}

	public void setPrevious(boolean previous) {
		this.previous = previous;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	public double getNUM_PER_PAGE() {
		return NUM_PER_PAGE;
	}
	
}