package uz.click.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.click.enums.Role;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String name;
    private String surname;
    @Column(unique = true, nullable = false)
    private String phoneNumber;
    @Column(nullable = false)
    private String password;
    private String code;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Role role;
    private Boolean isConfirmed;
    private Boolean isActive;
}
