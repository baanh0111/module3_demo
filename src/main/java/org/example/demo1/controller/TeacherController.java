package org.example.demo1.controller;


import org.example.demo1.entity.Teacher;
import org.example.demo1.service.ITeacherService;
import org.example.demo1.service.impl.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TeacherController", urlPatterns = "/teachers")
public class TeacherController extends HttpServlet {
    private ITeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/teacher/create.jsp").forward(req, resp);
                break;
            case "update":
                int updateId = Integer.parseInt(req.getParameter("id"));
                Teacher teacher = teacherService.findById(updateId);
                req.setAttribute("teacher", teacher);
                req.getRequestDispatcher("/view/teacher/update.jsp").forward(req, resp);
                break;
            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                teacherService.remove(id);
                resp.sendRedirect("/teachers?message=deleted");
                break;
            default:
                List<Teacher> teachers = teacherService.getAll();
                req.setAttribute("teachers", teachers);
                req.getRequestDispatcher("view/teacher/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createTeacher(req, resp);
                break;
            case "update":
                updateTeacher(req, resp);
                break;
        }
    }

    private void createTeacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String dobString = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");

        java.sql.Date dob = (dobString != null && !dobString.isEmpty()) ? java.sql.Date.valueOf(dobString) : null;

        Teacher teacher = new Teacher(0, name, dob, gender, address, phone, email);
        teacherService.save(teacher);

        resp.sendRedirect("/teachers?message=created");
    }

    private void updateTeacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String dobString = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");

        java.sql.Date dob = (dobString != null && !dobString.isEmpty()) ? java.sql.Date.valueOf(dobString) : null;

        Teacher teacher = new Teacher(id, name, dob, gender, address, phone, email);
        teacherService.update(id, teacher);

        resp.sendRedirect("/teachers?message=updated");
    }
}