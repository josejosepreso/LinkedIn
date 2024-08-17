package programLibraries;

import java.sql.Blob;

public class User {

	private int id;
	private String fullName;
	private Blob img;
	
	public User(int id, String name, String lastName, Blob img) {
		
		this.id = id;
		this.fullName = String.format("%s %s", name, lastName);
		this.img = img;
	}

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
}
