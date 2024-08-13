package uz.click.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.click.enums.CardStatus;
import uz.click.enums.CardType;
import uz.click.enums.TransactionStatus;

@Builder
@AllArgsConstructor
@Data
@NoArgsConstructor
@Entity
@NamedQuery(name = "by.number",query = "select c from Card c where c.number = :number")
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String name;
    private String surname;
    @Column(unique=true, nullable=false)
    private String number;
    @Enumerated(EnumType.STRING)
    private CardType type;
    @Column(nullable=false)
    private String exp;
    @Enumerated(EnumType.STRING)
    private CardStatus status;
    private Double balance = 0.0;
    private String cvv;
    private String phone;
}
