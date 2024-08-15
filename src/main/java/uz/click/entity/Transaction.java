package uz.click.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import uz.click.enums.TransactionStatus;
import uz.click.enums.TransactionType;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String description;
    @CreationTimestamp
    private Timestamp date;
    private Double amount;
    private String receiver;
    private String sender;
    @Enumerated(EnumType.STRING)
    private TransactionStatus status;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private TransactionType type;
}
