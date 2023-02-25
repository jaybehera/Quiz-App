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


public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Connection con = DatabaseConnectionFactory.createConnection();
		RequestDispatcher dispatcher = null;

		try {
			PreparedStatement pst = con
					.prepareStatement("insert into quizusers(username,email,password) values(?,?,?)");

			pst.setString(1, username);
			pst.setString(2, email);
			pst.setString(3,password );

			int rowCount = pst.executeUpdate();

			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}

			dispatcher = request.getRequestDispatcher("register.jsp");
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
