package com.jay.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jay.quiz.java.DatabaseConnectionFactory;
import com.jay.quiz.java.QuizDAO;
import com.jay.quiz.java.QuizQuestion;


public class Quiz extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DatabaseConnectionFactory.createConnection();
		String subCode = request.getParameter("subCode");
//		System.out.println(subCode);
		QuizDAO dao = new QuizDAO(con,subCode);
		List<QuizQuestion> questions = new ArrayList<>();
		
		try {
			questions = dao.getAllProducts();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(questions);
		request.setAttribute("questions", json);
		
		RequestDispatcher rd = request.getRequestDispatcher("/quiz.jsp");
		rd.forward(request, response);
	}

}
