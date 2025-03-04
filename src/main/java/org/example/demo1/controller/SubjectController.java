package org.example.demo1.controller;

import org.example.demo1.entity.Subject;
import org.example.demo1.service.ISubjectService;
import org.example.demo1.service.impl.SubjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SubjectController", urlPatterns = {"/subjects"})
public class SubjectController extends HttpServlet {
    private final ISubjectService subjectService = new SubjectService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                deleteSubject(request, response);
                break;
            default:
                listSubjects(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            createSubject(request, response);
        } else if ("edit".equals(action)) {
            updateSubject(request, response);
        }
    }

    private void listSubjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = subjectService.getAllSubject();


        if (subjects == null || subjects.isEmpty()) {
            System.out.println("Subjects list is empty or null!");
        } else {
            System.out.println("Subjects found: " + subjects.size());
            for (Subject subject : subjects) {
                System.out.println("ID: " + subject.getId() + ", Name: " + subject.getName());
            }
        }

        request.setAttribute("subjects", subjects);
        request.getRequestDispatcher("/view/subject/list.jsp").forward(request, response);
    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/subject/create.jsp").forward(request, response);
    }

    private void createSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String subject_name = request.getParameter("subject_name");

        Subject subject = new Subject(subject_name);
        subjectService.addSubject(subject);
        response.sendRedirect("/subjects");
    }



    private void updateSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("subject_name");
        Subject subject = new Subject(id, name);
        subjectService.updateSubject(subject);
        response.sendRedirect("/subjects");
    }


    private void deleteSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        subjectService.deleteSubject(id);
        response.sendRedirect("/subjects");
    }
}