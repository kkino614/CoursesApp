

package ecom;

public class UserInfo {
	
	String userId;
	String firstName;
	String lastName;
	String email;
	String stream;
	boolean loggedIn = false;
	
	public void setUserId(String a) {
		userId = a;
	}
	
	public void setFirstName(String a) {
		firstName = a;
	}
	
	public void setLastName(String a) {
		lastName = a;
	}
	
	public void setEmail(String a) {
		email = a;
	}
	
	public void setStream (String a) {
		stream = a;
	}
	
	public void setLoggedIn(boolean a) {
		loggedIn = a;	
	}	
	
	public String getUserId() {
		return userId;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getStream() {
		return stream;
	}
	
	public String getEmail() {
		return email;
	}
	
	public boolean isLoggedIn() {
		return loggedIn;
	}
	
}
