package dto;
 
public class Work implements java.io.Serializable{
    private String workId;			// 작품 고유번호
    private String name;			// 작품명
    private Integer unitPrice;		// 작품 가격
    private String worker; 			// 작가
    private String description;		// 작품 설명
    private String category;		// 카테고리
    private long unitsInStock;		// 재고 수
    private String releaseDate;		// 작품 등록 날짜
    private String condition; 		// 작품 상태
    private String filename; 		// 파일명
    private int quantity;			// 좋아요 개수
    
    public Work() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public Work(String workId, String name, Integer unitPrice) {
    	super();
        this.workId = workId;
        this.name = name;
        this.unitPrice = unitPrice;
    }
 
    public String getWorkId() {
        return workId;
    }
    public void setWorkId(String workId) {
        this.workId = workId;
    }
    
    public String getWorker() {
        return worker;
    }
 
    public void setWorker(String worker) {
        this.worker = worker;
    }
 
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public long getUnitsInStock() {
        return unitsInStock;
    }
    public void setUnitsInStock(long unitsInStock) {
        this.unitsInStock = unitsInStock;
    }
    public String getReleaseDate() {
        return releaseDate;
    }
    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }
    public String getCondition() {
        return condition;
    }
    public void setCondition(String condition) {
        this.condition = condition;
    }
    
    public String getFilename() {				
		return filename;
	}											
	public void setFilename(String filename) {
		this.filename = filename;
	}
    

	public int getQuantity(){
	    return quantity;
	}
	public void setQuantity(int quantity){
	    this.quantity = quantity;
	}
}