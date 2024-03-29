package com.nhnacademy.board.controller;

import com.nhnacademy.board.repository.PostRepository;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;

@Component
public class BoardDeleteController implements Command {
    @Override
    public String excute(HttpServletRequest req, HttpServletResponse res) {

        PostRepository postRepository = (PostRepository) req.getServletContext().getAttribute("postRepository");

        long boardId = Long.parseLong(req.getQueryString().split("=")[1]);

        ServletContext servletContext = req.getServletContext();
        URL resource = null;
        File file = null;

        try {
            resource = servletContext.getResource("/WEB-INF/classes/post.json");
            file = Paths.get(resource.toURI()).toFile();

        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }

        postRepository.removeBoard(file, boardId);

        return "redirect:/board.do?page=1&size=10";
    }
}
