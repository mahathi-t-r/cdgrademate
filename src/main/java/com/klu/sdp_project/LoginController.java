package com.klu.sdp_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.*;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/slogin")
    public String showStudentLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "slogin";
    }

    @PostMapping("/slogin")
    public String studentLogin(@ModelAttribute("user") User user, Model model, HttpSession session) {
        User existingUser = userRepository.findByEmailAndRole(user.getEmail(), "student");

        if (existingUser != null && existingUser.getPassword().equals(user.getPassword())) {
            session.setAttribute("username", existingUser.getUsername()); // Store studentId (username) in session
            return "studentDashboard"; // Redirect to student dashboard
        } else {
            model.addAttribute("error", "Invalid email or password for student");
            return "slogin"; // Return back to login page if there's an error
        }
    }

    // Educator Login
    @GetMapping("/elogin")
    public String showEducatorLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "elogin";
    }

    @PostMapping("/elogin")
    public String educatorLogin(@ModelAttribute("user") User user, Model model, HttpSession session) {
        User existingUser = userRepository.findByEmailAndRole(user.getEmail(), "educator");

        if (existingUser != null && existingUser.getPassword().equals(user.getPassword())) {
            session.setAttribute("username", existingUser.getUsername()); // Store educatorId (username) in session
            return "educatorDashboard"; // Redirect to educator dashboard
        } else {
            model.addAttribute("error", "Invalid email or password for educator");
            return "elogin"; // Return back to login page if there's an error
        }
    }
    @GetMapping("edashboard")
    public ModelAndView edashboard() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("educatorDashboard");
        return mv;
    }
    @GetMapping("sdashboard")
    public ModelAndView sdashboard() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentDashboard");
        return mv;
    }
}
