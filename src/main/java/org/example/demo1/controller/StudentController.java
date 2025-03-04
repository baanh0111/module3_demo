package org.example.demo1.controller;

import org.example.demo1.entity.Student;
import org.example.demo1.service.IStudentService;
import org.example.demo1.service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "StudentController", urlPatterns = "/students")
public class StudentController extends HttpServlet {
    private final IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null || action.isEmpty()) {
            listStudents(req, resp);
        } else {
            switch (action) {
                case "create":
                    showCreateForm(req, resp);
                    break;
                case "delete":
                    deleteStudent(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "search": // Thêm case tìm kiếm
                    searchStudents(req, resp);
                    break;
                default:
                    listStudents(req, resp);
            }
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/student/create.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Student student = studentService.findById(id);

        if (student != null) {
            req.setAttribute("student", student);
            req.getRequestDispatcher("view/student/update.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/students?message=notfound");
        }
    }
    private void searchStudents(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Student> students;

        if (keyword != null && !keyword.trim().isEmpty()) {
            students = studentService.searchByName(keyword.trim()); // Gọi phương thức tìm kiếm từ service
            req.setAttribute("keyword", keyword); // Lưu từ khóa để hiển thị lại trên form
        } else {
            students = studentService.getAll(); // Nếu không có từ khóa, hiển thị tất cả
        }

        req.setAttribute("students", students);
        req.getRequestDispatcher("view/student/list.jsp").forward(req, resp);
    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            studentService.remove(id);
            resp.sendRedirect("/students?message=deleted");
        } catch (NumberFormatException e) {
            resp.sendRedirect("/students?message=error");
        }
    }

    private void listStudents(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        if (message != null) {
            switch (message) {
                case "created":
                    req.setAttribute("message", "Thêm mới thành công");
                    break;
                case "updated":
                    req.setAttribute("message", "Cập nhật thành công");
                    break;
                case "deleted":
                    req.setAttribute("message", "Xóa thành công");
                    break;
                case "error":
                    req.setAttribute("message", "Đã có lỗi xảy ra");
                    break;
                case "notfound":
                    req.setAttribute("message", "Không tìm thấy sinh viên");
                    break;
            }
        }
        List<Student> students = studentService.getAll();
        req.setAttribute("students", students);
        req.getRequestDispatcher("view/student/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null) {
            listStudents(req, resp);
            return;
        }

        switch (action) {
            case "create":
                createStudent(req, resp);
                break;
            case "update":
                updateStudent(req, resp);
                break;
        }
    }

    private void createStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String name = req.getParameter("name");
            Date dob = Date.valueOf(req.getParameter("dob"));
            String gender = req.getParameter("gender");
            String address = req.getParameter("address");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");

            Student student = new Student(0, name, dob, gender, address, phone, email);
            studentService.save(student);
            resp.sendRedirect("/students?message=created");
        } catch (Exception e) {
            resp.sendRedirect("/students?message=error");
        }
    }

    private void updateStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            Date dob = Date.valueOf(req.getParameter("dob"));
            String gender = req.getParameter("gender");
            String address = req.getParameter("address");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");

            Student student = new Student(id, name, dob, gender, address, phone, email);
            studentService.update(id, student);

            // Chuyển hướng về danh sách để tải lại dữ liệu mới
            resp.sendRedirect("/students?message=updated");
        } catch (Exception e) {
            resp.sendRedirect("/students?message=error");
        }
    }

}
