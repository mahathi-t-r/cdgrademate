package com.klu.sdp_project;

import java.util.List;

public interface SubmissionDAO {
    String addSubmission(Submission submission);
    List<Submission> viewSubmissionsByAssignment(int assignmentId);
    Submission getSubmissionById(int submissionId);  // Fetch submission by ID
    List<Submission> getSubmissionsByStudentId(String studentId);
}
