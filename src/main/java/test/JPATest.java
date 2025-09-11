package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/jpa-test")
public class JPATest extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><body>");
        out.println("<h2>JPA Class Loading Test</h2>");
        
        try {
            // Test if Jakarta Persistence classes can be loaded
            Class<?> persistenceClass = Class.forName("jakarta.persistence.Persistence");
            out.println("<p>✓ jakarta.persistence.Persistence class loaded successfully</p>");
            
            Class<?> emfClass = Class.forName("jakarta.persistence.EntityManagerFactory");
            out.println("<p>✓ jakarta.persistence.EntityManagerFactory class loaded successfully</p>");
            
            Class<?> hibernateProvider = Class.forName("org.hibernate.jpa.HibernatePersistenceProvider");
            out.println("<p>✓ org.hibernate.jpa.HibernatePersistenceProvider class loaded successfully</p>");
            
            // Try to create EntityManagerFactory
            jakarta.persistence.Persistence.createEntityManagerFactory("dataSource");
            out.println("<p>✓ EntityManagerFactory created successfully!</p>");
            
        } catch (ClassNotFoundException e) {
            out.println("<p>✗ Class not found: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        } catch (Exception e) {
            out.println("<p>✗ Error creating EntityManagerFactory: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }
        
        out.println("</body></html>");
    }
}