package com.example.web_slave;

// Import the necessary libraries
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

// Annotate the class as a Controller
@Controller
public class controller {

    // Define a GET mapping for the root path
    @GetMapping("/")
    public String index() {
        // Return the name of the HTML file that contains the text field and the button
        return "index.html";
    }

    // Define a GET mapping for the redirect path
    @GetMapping("/redirect")
    public RedirectView redirect(@RequestParam("text") String text) {
        // Construct the deep link to the flutter app with the text parameter
        String deepLink = "myapp://master?name=" + text;
        // Return a redirect view with the deep link
        return new RedirectView(deepLink);
    }
}
