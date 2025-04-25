package com.klu.sdp_project;



import java.util.List;

public interface AssignmentDAO {
    public String addAssignment(Assignment assignment);
    public String updateAssignment(int id, Assignment assignment);
    public String deleteAssignment(int id);
    public List<Assignment> viewAllAssignments();
	public List<Assignment> getAssignments(String courseCode);
}

