package programLibraries;

import java.sql.Blob;

public class User {

	private int id;
	private String fullName;
	private Blob img;
	private String imgPath;
	
	public User(int id, String name, String lastName, Blob img, String imgPath) {
		
		this.id = id;
		this.fullName = String.format("%s %s", name, lastName);
		this.img = img;
		this.imgPath = imgPath;	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Blob getImg() {
		return img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}
	
	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
}
