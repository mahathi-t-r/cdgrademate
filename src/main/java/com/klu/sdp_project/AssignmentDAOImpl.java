package com.klu.sdp_project;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AssignmentDAOImpl implements AssignmentDAO {

    @Autowired
    private AssignmentRepository assignmentRepository;

    @Override
    public String addAssignment(Assignment assignment) {
        assignmentRepository.save(assignment);
        return "Assignment added successfully!";
    }

    @Override
    public String updateAssignment(int id, Assignment assignment) {
        Assignment existingAssignment = assignmentRepository.findById(id).orElseThrow();
        existingAssignment.setTitle(assignment.getTitle());
        existingAssignment.setDescription(assignment.getDescription());
        existingAssignment.setCourseCode(assignment.getCourseCode());
        existingAssignment.setDueDate(assignment.getDueDate());
        existingAssignment.setTotalMarks(assignment.getTotalMarks());
        existingAssignment.setTags(assignment.getTags());
        existingAssignment.setQuestionPdfPath(assignment.getQuestionPdfPath());
        existingAssignment.setAssignedDate(assignment.getAssignedDate());
        assignmentRepository.save(existingAssignment);
        return "Assignment updated successfully!";
    }

    @Override
    public String deleteAssignment(int id) {
        assignmentRepository.deleteById(id);
        return "Assignment deleted successfully!";
    }

    @Override
    public List<Assignment> viewAllAssignments() {
        return assignmentRepository.findAll();
    }
    public List<Assignment> getAssignments(String courseCode) {
        if (courseCode != null && !courseCode.isEmpty()) {
            return assignmentRepository.findByCourseCode(courseCode); // Filter by course code
        }
        return assignmentRepository.findAll(); // Return all assignments if no course code is provided
    }
    
}
