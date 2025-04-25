package com.klu.sdp_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;


@Controller
public class HomeController {
	
	@Autowired
	private FeedbackRepository feedbackRepository;
	
	@Autowired
	private UserRepository userRepository;
	@GetMapping("/")
  public String home()
  {
	  return "home";
  }
	
	@GetMapping("/about")
	public String about()
	{
		return "about";
	}
	
	@GetMapping("/contact")
	public String contact()
	{
		return "contact";
	}
	
	@PostMapping("contactSubmit")
    public String submitFeedback(Feedback feedback, Model model) {
        // Save feedback details to the database
        feedbackRepository.save(feedback);
        
        model.addAttribute("message", "Thank you for your feedback!");
        return "contact"; // Redirect or forward to a success page
    }
	
	@GetMapping("/feedback")
    public String getFeedbackList(Model model) {
        // Fetch all feedback from the service
        List<Feedback> feedbackList = feedbackRepository.findAll();

        // Add feedback list to the model
        model.addAttribute("feedbackList", feedbackList);

        // Return the JSP page name
        return "feedbackCards";
    }
	

	@GetMapping("/profile")
	public String showProfile(HttpSession session, Model model) {
	    // Retrieve the username from the session
	    String username = (String) session.getAttribute("username");
	    if (username == null) {
	        return "redirect:/slogin"; // Redirect to login if username is not in session
	    }

	    // Fetch the User object using UserRepository
	    User user = userRepository.findByUsername(username);
	    if (user == null) {
	        return "redirect:/slogin"; // Redirect to login if user not found
	    }

	    // Add the User object to the model
	    model.addAttribute("user", user);
	    return "profile"; // Render the profile.jsp
	}
    
}
