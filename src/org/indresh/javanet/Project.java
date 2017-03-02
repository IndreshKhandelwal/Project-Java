package org.indresh.javanet;

public class Project {
	String PId;
	String ProjectName;
	public void setProjectName(String ProjectName){
		this.ProjectName=ProjectName;
	}
	
	public void setPId(String PId){
		this.PId=PId;
	}
	public String getProjectName(){
		return ProjectName;
	}
	public String getPId(){
		return PId;
	}
}
