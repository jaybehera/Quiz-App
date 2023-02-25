package com.jay.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jay.quiz.java.DatabaseConnectionFactory;

public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String username = null;
		Connection con = DatabaseConnectionFactory.createConnection();
		ResultSet set = null;
		int i = 0;
		try {
			
			PreparedStatement pst = con.prepareStatement("select * from quizusers where email = ? and password = ?");
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				i = 1;
				username = rs.getString("username");
				
			}
			if (i != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				//System.out.println("hello "+ username);
				RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("errorMessage", "Invalid username or password");
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException sqe) {
			System.out.println("Error : While Fetching records from database");
		}
		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
		}
	}
}
