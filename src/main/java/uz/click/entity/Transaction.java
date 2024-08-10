package uz.click.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.click.enums.TransactionType;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Locale;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String description;
    private Timestamp date;
    private Double amount;
    private String receiver;
    private String sender;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private TransactionType type;
}
