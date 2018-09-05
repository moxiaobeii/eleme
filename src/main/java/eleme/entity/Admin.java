package eleme.entity;

import java.util.jar.Attributes.Name;

import javax.swing.plaf.synth.SynthInternalFrameUI;

/**
 * 管理员实体类
 * @author momo
 *
 */
public class Admin {
	
	private String name;
	private String password;
	private String compassword;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCompassword() {
		return compassword;
	}
	public void setCompassword(String compassword) {
		this.compassword = compassword;
	}
	
	
}


