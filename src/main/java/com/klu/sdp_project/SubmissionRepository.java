package com.klu.sdp_project;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SubmissionRepository extends JpaRepository<Submission, Integer> {
    List<Submission> findByAssignmentId(int assignmentId);
    List<Submission> findByStudentId(@Param("studentId") String studentId);
}
