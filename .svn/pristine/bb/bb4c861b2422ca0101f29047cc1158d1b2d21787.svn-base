package com.sombra.inc.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sombra.inc.entity.Comment;
import com.sombra.inc.jpa.dao.IAccountDao;
import com.sombra.inc.jpa.dao.ICommentDao;

@Service
public class CommentService implements ICommentService {
	// public static final String SAVE_LOCATION =
	// "D:/SpringWorkspace/PersonalFinance/src/main/webapp/resources/file/";
	@Autowired
	private ICommentDao commentDao;

	@Autowired
	private IAccountDao accountDao;

	@Override
	public List<Comment> findByAccountId(Integer accountId) {
		return commentDao.findByAccountId(accountId);
	}

	@Override
	@Transactional
	public void save(Comment comment, Integer itemId, MultipartFile multipartFile, String path) {
		String fileName = multipartFile.getOriginalFilename();
		// String location = SAVE_LOCATION;
		String location = path;
		comment.setAccount(accountDao.findOne(itemId));
		comment.setDocName(fileName);
		commentDao.save(comment);
		File pathFile = new File(location);
		if (!pathFile.exists()) {
			pathFile.mkdir();
		}
		pathFile = new File(location + fileName);
		try {
			multipartFile.transferTo(pathFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	@Transactional
	public void save(Comment comment, Integer itemId) {
		comment.setAccount(accountDao.findOne(itemId));
		commentDao.save(comment);
	}
}
