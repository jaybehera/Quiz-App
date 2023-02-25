package com.jay.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jay.quiz.java.DatabaseConnectionFactory;

/**
 * Servlet implementation class AddQuestion
 */
@WebServlet("/AddQuestion")
public class AddQuestion extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String subCode = request.getParameter("subCode");
		String question = request.getParameter("question");
		String optionA = request.getParameter("optionA");
		String optionB = request.getParameter("optionB");
		String optionC = request.getParameter("optionC");
		String optionD = request.getParameter("optionD");
		String answer = request.getParameter("answer");
		

		Connection con = DatabaseConnectionFactory.createConnection();
		RequestDispatcher dispatcher = null;

		try {
			PreparedStatement pst = con.prepareStatement("insert into quiz_questions(subCode,question,a,b,c,d,ans) values(?,?,?,?,?,?,?)");

			pst.setString(1, subCode);
			pst.setString(2, question);
			pst.setString(3,optionA );
			pst.setString(4, optionB);
			pst.setString(5, optionC);
			pst.setString(6,optionD );
			pst.setString(7,answer );
			

			int rowCount = pst.executeUpdate();

			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}

			dispatcher = request.getRequestDispatcher("addQuestion.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException sqe) {
			System.out.println("Error : While Inserting record in database");
		}
		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
		}

	}



}
