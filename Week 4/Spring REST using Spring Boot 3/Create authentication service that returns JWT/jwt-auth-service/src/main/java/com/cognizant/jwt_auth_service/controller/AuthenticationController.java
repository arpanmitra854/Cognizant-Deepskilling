package com.cognizant.jwt_auth_service.controller;

import com.cognizant.jwt_auth_service.util.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

@RestController
public class AuthenticationController {

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/authenticate")
    public ResponseEntity<?> authenticate(HttpServletRequest request) {
        System.out.println("Auth endpoint hit!");

        String authHeader = request.getHeader("Authorization");
        System.out.println("Authorization Header = " + authHeader);  // ✅ Console log

        if (authHeader == null || !authHeader.startsWith("Basic ")) {
            return ResponseEntity.status(401).body("Missing or invalid Authorization header");
        }

        byte[] decoded = Base64.getDecoder().decode(authHeader.substring(6));
        String[] credentials = new String(decoded, StandardCharsets.UTF_8).split(":", 2);

        String username = credentials[0];
        String password = credentials[1];

        if ("user".equals(username) && "cognizant".equals(password)) {
            String token = jwtUtil.generateToken(username);
            return ResponseEntity.ok("{\"token\":\"" + token + "\"}");
        }

        return ResponseEntity.status(401).body("Invalid username or password");
    }
}
