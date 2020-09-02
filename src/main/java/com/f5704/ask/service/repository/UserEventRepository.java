package com.f5704.ask.service.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.f5704.ask.web.model.UserHistory;

/**
 * 
 * @author admin
 *
 */
public interface UserEventRepository extends JpaRepository<UserHistory, String> {

}
