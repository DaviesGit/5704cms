package com.f5704.ask.service.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.f5704.ask.web.model.Achievement;
import com.f5704.ask.web.model.Project;

public interface AchievementRepository extends JpaRepository<Achievement, String> {
	Achievement findById(String id);

    Achievement findByName(String name);
    
    Achievement findByNumber(String number);

	@Query(value = "SELECT a FROM Achievement a WHERE " + 
            "(:id IS NULL OR a.id LIKE CONCAT('%', :id, '%')) AND \n" + 
            "(:name IS NULL OR a.name LIKE CONCAT('%', :name, '%')) AND \n" + 
            "(:type IS NULL OR a.type LIKE CONCAT('%', :type, '%')) AND \n" + 
            "(:number IS NULL OR a.number LIKE CONCAT('%', :number, '%')) AND \n" + 
            "(:progress IS NULL OR a.progress LIKE CONCAT('%', :progress, '%')) AND \n" + 
            "(:apply_time IS NULL OR a.apply_time LIKE CONCAT('%', :apply_time, '%')) AND \n" + 
            "(:accept_time IS NULL OR a.accept_time LIKE CONCAT('%', :accept_time, '%')) AND \n" + 
            "(:authorize_time IS NULL OR a.authorize_time LIKE CONCAT('%', :authorize_time, '%')) AND \n" + 
            "(:search IS NULL OR (\n" + 
            "     a.id LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.name LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.type LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.number LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.progress LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.apply_time LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.accept_time LIKE CONCAT('%', :search, '%') OR \n" + 
            "     a.authorize_time LIKE CONCAT('%', :search, '%')" +
            "))")
	Page<Achievement> search(
			@Param("id") String id,
			@Param("name") String name,
			@Param("type") String type,
			@Param("number") String number,
			@Param("progress") String progress,
			@Param("apply_time") String apply_time,
			@Param("accept_time") String accept_time,
			@Param("authorize_time") String authorize_time,
			@Param("search") String search,
    		Pageable pageable);
    
    Page<Achievement> findAll(Pageable pageable);
    
    Page<Achievement> findByNameContainingOrTypeContainingOrNumberContainingIgnoreCase(String name,String type,String number,Pageable pageable);

}
