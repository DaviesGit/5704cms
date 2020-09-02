package com.f5704.ask.service.repository;

import java.util.List;

import org.hibernate.annotations.NamedQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.f5704.ask.web.model.User;

/**
 * 
 * @author admin
 *
 */
public interface UserRepository extends JpaRepository<User, String> {

	User findById(String id);

	User findByIdAndPassword(String id, String password);

	User findBySno(String sno);

	User findByUsername(String username);

	User findByEmail(String email);

	User findByUsernameAndPassword(String username, String password);

	Page<User> findAll(Pageable pageable);
	
	@Query(value = "SELECT u FROM User u WHERE " + 
            "(:id IS NULL OR u.id LIKE CONCAT('%', :id, '%')) AND \n" + 
            "(:username IS NULL OR u.username LIKE CONCAT('%', :username, '%')) AND \n" + 
            "(:usertype IS NULL OR u.usertype LIKE CONCAT('%', :usertype, '%')) AND \n" + 
            "(:lastlogintime IS NULL OR FUNCTION('date_format',u.lastlogintime,'%Y-%m-%d') LIKE CONCAT('%', :lastlogintime, '%')) AND \n" + 
            "(:rank IS NULL OR u.rank LIKE CONCAT('%', :rank, '%')) AND \n" + 
            "(:nickname IS NULL OR u.nickname LIKE CONCAT('%', :nickname, '%')) AND \n" + 
            "(:firstname IS NULL OR u.firstname LIKE CONCAT('%', :firstname, '%')) AND \n" + 
            "(:midname IS NULL OR u.midname LIKE CONCAT('%', :midname, '%')) AND \n" + 
            "(:lastname IS NULL OR u.lastname LIKE CONCAT('%', :lastname, '%')) AND \n" + 
            "(:language IS NULL OR u.language LIKE CONCAT('%', :language, '%')) AND \n" + 
            "(:jobtitle IS NULL OR u.jobtitle LIKE CONCAT('%', :jobtitle, '%')) AND \n" + 
            "(:title IS NULL OR u.title LIKE CONCAT('%', :title, '%')) AND \n" + 
            "(:birthday IS NULL OR u.birthday LIKE CONCAT('%', :birthday, '%')) AND \n" + 
            "(:department IS NULL OR u.department LIKE CONCAT('%', :department, '%')) AND \n" + 
            "(:gender IS NULL OR u.gender LIKE CONCAT('%', :gender, '%')) AND \n" + 
            "(:name IS NULL OR u.name LIKE CONCAT('%', :name, '%')) AND \n" + 
            "(:email IS NULL OR u.email LIKE CONCAT('%', :email, '%')) AND \n" + 
            "(:mobile IS NULL OR u.mobile LIKE CONCAT('%', :mobile, '%')) AND \n" + 
            "(:phone IS NULL OR u.phone LIKE CONCAT('%', :phone, '%')) AND \n" + 
            "(:parent_phone IS NULL OR u.parent_phone LIKE CONCAT('%', :parent_phone, '%')) AND \n" + 
            "(:organ IS NULL OR u.organ LIKE CONCAT('%', :organ, '%')) AND \n" + 
            "(:skill IS NULL OR u.skill LIKE CONCAT('%', :skill, '%')) AND \n" + 
            "(:city IS NULL OR u.city LIKE CONCAT('%', :city, '%')) AND \n" + 
            "(:province IS NULL OR u.province LIKE CONCAT('%', :province, '%')) AND \n" + 
            "(:sno IS NULL OR u.sno LIKE CONCAT('%', :sno, '%')) AND \n" + 
            "(:grade IS NULL OR u.grade LIKE CONCAT('%', :grade, '%')) AND \n" + 
            "(:major IS NULL OR u.major LIKE CONCAT('%', :major, '%')) AND \n" + 
            "(:room_id IS NULL OR u.room_id LIKE CONCAT('%', :room_id, '%')) AND \n" + 
            "(:join_time IS NULL OR u.join_time LIKE CONCAT('%', :join_time, '%')) AND \n" + 
            "(:search IS NULL OR (\n" + 
            "     u.id LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.username LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.usertype LIKE CONCAT('%', :search, '%') OR \n" + 
            "     FUNCTION('date_format',u.lastlogintime,'%Y-%m-%d') LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.rank LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.nickname LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.firstname LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.midname LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.lastname LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.language LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.jobtitle LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.title LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.birthday LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.department LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.gender LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.name LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.email LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.mobile LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.phone LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.parent_phone LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.organ LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.skill LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.city LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.province LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.sno LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.grade LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.major LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.room_id LIKE CONCAT('%', :search, '%') OR \n" + 
            "     u.join_time LIKE CONCAT('%', :search, '%')" +
            "))")
	Page<User> search(
			@Param("id") String id,
    		@Param("username") String username,
    		@Param("usertype") String usertype,
    		@Param("lastlogintime") String lastlogintime,
    		@Param("rank") String rank,
    		@Param("nickname") String nickname,
    		@Param("firstname") String firstname,
    		@Param("midname") String midname,
    		@Param("lastname") String lastname,
    		@Param("language") String language,
    		@Param("jobtitle") String jobtitle,
    		@Param("title") String title,
    		@Param("birthday") String birthday,
    		@Param("department") String department,
    		@Param("gender") String gender,
    		@Param("name") String name,
    		@Param("email") String email,
    		@Param("mobile") String mobile,
    		@Param("phone") String phone,
    		@Param("parent_phone") String parent_phone,
    		@Param("organ") String organ,
    		@Param("skill") String skill,
    		@Param("city") String city,
    		@Param("province") String province,
    		@Param("sno") String sno,
    		@Param("grade") String grade,
    		@Param("major") String major,
    		@Param("room_id") String room_id,
    		@Param("join_time") String join_time,
    		@Param("search") String search,
    		Pageable pageable);

	Page<User> findByUsertype(String usertype, Pageable pageable);

	Page<User> findBySkill(String skill, Pageable pageable);

	Page<User> findByUsernameContainingOrNicknameContainingOrNameContainingOrEmailContainingOrMobileContainingOrPhoneContainingOrSnoContainingIgnoreCase(String username,
			String nickname, String name, String email, String mobile, String phone, String sno, Pageable pageable);

}
