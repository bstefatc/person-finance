package com.sombra.inc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sombra.inc.entity.Comment;

public interface ICommentService {
	public List<Comment> findByAccountId(Integer accountId);

	// public void save(Comment comment, Integer itemId, MultipartFile
	// multipartFile);

	public void save(Comment comment, Integer itemId);

	void save(Comment comment, Integer itemId, MultipartFile multipartFile, String path);
}
