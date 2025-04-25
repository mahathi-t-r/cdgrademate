package com.klu.sdp_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

@Controller
public class AssignmentController {

    @Autowired
    private AssignmentDAO assignmentDAO;

    @GetMapping("addassignment")
    public ModelAndView addAssignment() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addassignment");
        return mv;
    }
/*
    @GetMapping("viewallassignments")
    public ModelAndView viewAllAssignments() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("viewallassignments");
        List<Assignment> assignments = assignmentDAO.viewAllAssignments();
        mv.addObject("assignments", assignments);
        return mv;
    }
*/
    @GetMapping("/viewallassignments")
    public String viewAssignments(@RequestParam(value = "courseCode", required = false) String courseCode, Model model) {
        List<Assignment> assignments = assignmentDAO.getAssignments(courseCode); // Fetch assignments
        model.addAttribute("assignments", assignments); // Add to the model
        return "viewallassignments"; // The JSP name
    }
   
    
    @PostMapping("add")
    public ModelAndView addAssignment(HttpServletRequest request, @RequestParam("questionPdf") MultipartFile questionPdf) {
        Assignment assignment = new Assignment();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String courseCode = request.getParameter("courseCode");
        String uploadType = request.getParameter("uploadType");
        LocalDate dueDate = LocalDate.parse(request.getParameter("dueDate"));
        int totalMarks = Integer.parseInt(request.getParameter("totalMarks"));
        String tags = request.getParameter("tags");

        // Handle file upload
        String questionPdfPath = uploadFile(questionPdf);

        assignment.setTitle(title);
        assignment.setDescription(description);
        assignment.setCourseCode(courseCode);
        assignment.setUploadType(uploadType);
        assignment.setDueDate(dueDate);
        assignment.setTotalMarks(totalMarks);
        assignment.setTags(tags);
        assignment.setQuestionPdfPath(questionPdfPath);
        assignment.setAssignedDate(LocalDate.now());

        String message = assignmentDAO.addAssignment(assignment);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addsuccess");
        mv.addObject("message", message);
        return mv;
    }

    private String uploadFile(MultipartFile file) {
        String folderPath = "D:/uploads/"; // Path to D drive for saving the file

        // Create the uploads folder if it doesn't exist
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdir(); // Create folder if not present
        }

        // Save the file with its original name
        String fileName = file.getOriginalFilename(); // Only take the file name
        Path path = Paths.get(folderPath + fileName);
        try {
            Files.write(path, file.getBytes());
            return fileName; // Return only the file name, not the full path
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("download")
    public ResponseEntity<Resource> downloadFile(@RequestParam("fileName") String fileName) {
        try {
            // Base folder path
            String folderPath = "D:/uploads/";
            Path filePath = Paths.get(folderPath).resolve(fileName).normalize();
            File file = filePath.toFile();

            if (!file.exists()) {
                return ResponseEntity.status(404).body(null); // Handle file not found
            }

            // Prepare file for download
            Resource resource = new UrlResource(filePath.toUri());
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }
    
    @GetMapping("updateassignment")
    public ModelAndView showUpdateForm(@RequestParam("id") int id) {
        ModelAndView mv = new ModelAndView();
        Assignment assignment = assignmentDAO.viewAllAssignments().stream()
                .filter(a -> a.getId() == id)
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Assignment not found"));
        mv.addObject("assignment", assignment);
        mv.setViewName("updateassignment");
        return mv;
    }

    @PostMapping("updateassignment")
    public ModelAndView updateAssignment(@RequestParam("id") int id, 
                                         HttpServletRequest request, 
                                         @RequestParam("questionPdf") MultipartFile questionPdf) {
        Assignment assignment = new Assignment();
        assignment.setTitle(request.getParameter("title"));
        assignment.setDescription(request.getParameter("description"));
        assignment.setCourseCode(request.getParameter("courseCode"));
        assignment.setUploadType(request.getParameter("uploadType"));
        assignment.setDueDate(LocalDate.parse(request.getParameter("dueDate")));
        assignment.setTotalMarks(Integer.parseInt(request.getParameter("totalMarks")));
        assignment.setTags(request.getParameter("tags"));

        // Handle updated file upload
        String questionPdfPath = uploadFile(questionPdf);
        assignment.setQuestionPdfPath(questionPdfPath);

        assignmentDAO.updateAssignment(id, assignment);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatesuccess");
        mv.addObject("message", "Assignment updated successfully!");
        return mv;
    }
    
    @GetMapping("deleteassignment")
    public ModelAndView deleteAssignment(@RequestParam("id") int id) {
        String message = assignmentDAO.deleteAssignment(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("deletesuccess");
        mv.addObject("message", message);
        return mv;
    }

// viewing to select assignments
    @GetMapping("/viewAssignments")
    public ModelAndView viewAssignments() {
        ModelAndView mv = new ModelAndView();
        List<Assignment> assignments = assignmentDAO.viewAllAssignments(); // Fetch all assignments
        mv.setViewName("teacher_assignments"); // JSP page to list assignments
        mv.addObject("assignments", assignments);
        return mv;
    }
    
    // select assignments 
    @GetMapping("/selectAssignment")
    public ModelAndView selectAssignment(@RequestParam("assignmentId") int assignmentId, HttpSession session) {
        session.setAttribute("selectedAssignmentId", assignmentId); // Store the selected assignmentId in session
        return new ModelAndView("redirect:/viewSubmissions"); // Redirect to view submissions page
    }
    @GetMapping("/studentviewassignments")
    public ModelAndView studentviewassignments() {
        ModelAndView mv = new ModelAndView();
        List<Assignment> assignments = assignmentDAO.viewAllAssignments(); // Fetch all assignments
        mv.setViewName("studentviewassignments"); // JSP page to list assignments
        mv.addObject("assignments", assignments);
        return mv;
    }

    
}
