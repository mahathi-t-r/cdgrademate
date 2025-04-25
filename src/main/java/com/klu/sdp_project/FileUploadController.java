package com.klu.sdp_project;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.*;

@RestController
@RequestMapping("/upload")
public class FileUploadController {

    @PostMapping("/file")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                // Define the path where you want to save the uploaded file
                Path path = Paths.get("D:/uploads/" + file.getOriginalFilename());
                Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                return "File uploaded successfully: " + path.toString();
            } catch (IOException e) {
                e.printStackTrace();
                return "Failed to upload file.";
            }
        }
        return "No file selected.";
    }
}
