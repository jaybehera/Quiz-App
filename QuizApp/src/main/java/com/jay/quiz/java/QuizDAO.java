package com.jay.quiz.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {
	
	private Connection conn;
	private String subCode;

   public QuizDAO(Connection conn, String subCode) {
        this.conn = conn;
       this.subCode = subCode;
    }

    public List<QuizQuestion> getAllProducts() throws SQLException {
        List<QuizQuestion> questionList = new ArrayList<>();
        
        PreparedStatement pst = conn.prepareStatement("select * from quiz_questions where subCode = ?");
		pst.setString(1, subCode);
		
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                	QuizQuestion question = new QuizQuestion();
                	question.setSubCode(rs.getString("subCode"));
                	question.setA(rs.getString("a"));
                	question.setB(rs.getString("b"));
                	question.setC(rs.getString("c"));
                	question.setD(rs.getString("d"));
                	question.setQn(rs.getString("question"));
                	question.setCorrect(rs.getString("ans"));
                    
                	questionList.add(question);
                }
            }
        return questionList;
    }

}
