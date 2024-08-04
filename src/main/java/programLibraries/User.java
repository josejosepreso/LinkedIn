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
	
	public String toJSON() {
		
		return String.format("{\"id\":\"%s\",\"username\":\"%s\",\"img\":\"%s\"}", this.id, this.username, this.img);
	}
}
