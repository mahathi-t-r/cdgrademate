package com.klu.sdp_project;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssignmentRepository extends JpaRepository<Assignment, Integer> {
	  List<Assignment> findByCourseCode(String courseCode);  // Method to search by courseCode

	    List<Assignment> findAll();
}
