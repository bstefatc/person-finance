package com.sombra.inc.web;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sombra.inc.entity.Comment;
import com.sombra.inc.service.ICommentService;

@Controller
public class CommentController {

	@Autowired
	private ICommentService commentService;

	@RequestMapping(value = "/account/notes/addcomment/{itemId}", method = RequestMethod.POST)
	public String addComment(@ModelAttribute("commentForm") Comment comment, @PathVariable Integer itemId, @RequestParam MultipartFile multipartFile) {
		commentService.save(comment, itemId, multipartFile, "D:/SpringWorkspace/PersonalFinance/src/main/webapp/resources/file/");
		return "redirect:/account/notes/id=" + itemId;
	}

	@RequestMapping(value = "/downloadfile", method = RequestMethod.GET)
	public void downloadnotepadfile(HttpServletResponse response, @RequestParam String fileName) {
		try {
			// String path =
			// request.getSession().getServletContext().getRealPath("");
			System.out.println(fileName);
			File f = new File("D:/SpringWorkspace/PersonalFinance/src/main/webapp/resources/file/" + fileName);
			System.out.println(f.getPath());
			// response.setContentType("application/txt");
			FileCopyUtils.copy(new FileInputStream(f), response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
