package com.f5704.ask.service.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.User;

public interface ProjectRepository extends JpaRepository<Project, String> {

	Project findById(String id);

	Project findByName(String name);

	Page<Project> findAll(Pageable pageable);
	
	@Query(value = "SELECT p FROM Project p WHERE " + 
            "(:id IS NULL OR p.id LIKE CONCAT('%', :id, '%')) AND \n" + 
            "(:name IS NULL OR p.name LIKE CONCAT('%', :name, '%')) AND \n" + 
            "(:principal IS NULL OR p.principal LIKE CONCAT('%', :principal, '%')) AND \n" + 
            "(:match IS NULL OR p.match LIKE CONCAT('%', :match, '%')) AND \n" + 
            "(:progress IS NULL OR p.progress LIKE CONCAT('%', :progress, '%')) AND \n" + 
            "(:begin IS NULL OR p.begin LIKE CONCAT('%', :begin, '%')) AND \n" + 
            "(:end IS NULL OR p.end LIKE CONCAT('%', :end, '%')) AND \n" + 
            "(:search IS NULL OR (\n" + 
            "     p.id LIKE CONCAT('%', :search, '%') OR \n" + 
            "     p.name LIKE CONCAT('%', :search, '%') OR \n" + 
            "     p.principal LIKE CONCAT('%', :search, '%') OR \n" + 
            "     p.match LIKE CONCAT('%', :search, '%') OR \n" + 
            "     p.progress LIKE CONCAT('%', :search, '%') OR \n" + 
            "     p.begin LIKE CONCAT('%', :search, '%') OR \n" + 
            "     p.end LIKE CONCAT('%', :search, '%')" +
            "))")
	Page<Project> search(
			@Param("id") String id,
			@Param("name") String name,
			@Param("principal") String principal,
			@Param("match") String match,
			@Param("progress") String progress,
			@Param("begin") String begin,
			@Param("end") String end,
			@Param("search") String search,
    		Pageable pageable);

	Page<Project> findByPrincipal(String principal, Pageable pageable);

	Page<Project> findByNameContainingOrMatchContainingIgnoreCase(String name, String match, Pageable pageable);

}
