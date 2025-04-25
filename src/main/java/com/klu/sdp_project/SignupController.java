package com.klu.sdp_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SignupController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("user", new User());
        return "signup";
    }

    @PostMapping("/signup")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        // Check if email already exists
        if (userRepository.existsByEmail(user.getEmail())) {
            model.addAttribute("error", "Email already registered");
            return "signup";
        }
        
        userRepository.save(user);
        model.addAttribute("success", "User registered successfully");
        return "home";
    }
}
