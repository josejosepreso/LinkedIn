package programLibraries;

public class User {

	private int id;
	private String username;
	private String img;
	
	public User(int id, String username, String img) {
		
		this.id = id;
		this.username = username;
		this.img = img;
	}
	
	public int getId() {
		return this.id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String toJSON() {
		
		return String.format("{\"id\":\"%s\",\"username\":\"%s\",\"img\":\"%s\"}", this.id, this.username, this.img);
	}
}
