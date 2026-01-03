package com.tradetrove.backend.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "app_products")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private Double price;
    private String category; 

    @Column(name = "image_data")
    private byte[] imageData; 

    private String imageType; 

    @ManyToOne
    @JoinColumn(name = "seller_id")
    private User seller;
}
