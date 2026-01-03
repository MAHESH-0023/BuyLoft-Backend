package com.tradetrove.backend.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "app_users")
@Data 
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    private String whatsappNumber;
    private String address;
    private String about;   
    private String role = "USER"; 

    private String profileImageType;
    
    @Column(name = "profile_image_data")
    private byte[] profileImageData;
}
