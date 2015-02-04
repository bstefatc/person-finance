package com.sombra.inc.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sombra.inc.entity.Comment;

@Repository
public interface ICommentDao extends JpaRepository<Comment, Integer> {

	@Query(name = "query", value = "select c from Comment c where c.account.id = ?1")
	List<Comment> findByAccountId(Integer accountId);

}
