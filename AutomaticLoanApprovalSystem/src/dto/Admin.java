package dto;

public class Admin {
	private String adminName;
	private String adminPass;
	
	public Admin() {
		super();
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	@Override
	public String toString() {
		return "Admin [adminName=" + adminName + ", adminPass=" + adminPass + "]";
	}
}
