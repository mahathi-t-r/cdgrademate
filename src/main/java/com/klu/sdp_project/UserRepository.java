package com.klu.sdp_project;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByEmail(String email);
    User findByEmail(String email);
    User findByEmailAndRole(String email, String role);
    List<User> findByRole(String role);
    @Query("SELECT u FROM User u WHERE u.username = :username")
    User findByUsername(String username);
}
