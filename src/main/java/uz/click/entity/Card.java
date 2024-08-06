package uz.click.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@Data
@NoArgsConstructor
@Entity
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String cardName;
    private String cardSurname;
    @Column(unique=true, nullable=false)
    private String cardNumber;
    private String cardType;
    @Column(nullable=false)
    private String cardExp;
    private Double balance = 0.0;
    private String cardCVV;
    private String ownerEmail;
}
