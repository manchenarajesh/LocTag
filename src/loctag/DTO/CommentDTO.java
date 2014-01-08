package loctag.DTO;

/**
 * Representation of a Comment
 */
public class CommentDTO {
	private int commentID;
	private int annotationID;
	private int userID;
	private String displayName;
	private String userPic;
	private String time;
	private String comment;
	
	
	
	
	public CommentDTO() {

		this.commentID=0;
		this.annotationID=0;
		this.userID=0;
		this.displayName="";
		this.userPic="";
		this.time="";
		this.comment="";
	}

	//new comment for an annotation
	public CommentDTO(int userID, String comment) {

		
		this.userID=userID;
		this.comment=comment;
	}
	
	//comments for an annotation
	public CommentDTO(int commentID, int annotationID, int userID, String displayName, String userPic, String time, String comment) {
		
		this.commentID=commentID;
		this.annotationID=annotationID;
		this.userID=userID;
		this.displayName=displayName;
		this.userPic=userPic;
		this.time=time;
		this.comment=comment;
	}


	public int getCommentID() {
		return commentID;
	}


	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}


	public int getAnnotationID() {
		return annotationID;
	}


	public void setAnnotationID(int annotationID) {
		this.annotationID = annotationID;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public String getDisplayName() {
		return displayName;
	}


	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}


	public String getUserPic() {
		return userPic;
	}


	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}



	
}
