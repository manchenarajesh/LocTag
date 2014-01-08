package loctag.DTO;

/**
 * Representation of a Category
 */
public class CategoryDTO {
	private int categoryID;
	private String category;
		
	
	public CategoryDTO() {

		this.categoryID=0;
		this.category="";
		
	}


	public CategoryDTO(int categoryID, String category) {

		this.categoryID=categoryID;
		this.category=category;
		
	}


	public int getCategoryID() {
		return categoryID;
	}


	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	
	


	
}
