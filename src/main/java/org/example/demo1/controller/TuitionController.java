package org.example.demo1.controller;

import org.example.demo1.entity.Student;
import org.example.demo1.entity.Tuition;
import org.example.demo1.repository.StudentRepository;
import org.example.demo1.service.ITuitionService;
import org.example.demo1.service.impl.TuitionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "TuitionController", urlPatterns = "/tuitions")
public class TuitionController extends HttpServlet {
    private final ITuitionService tuitionService = new TuitionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                List<Student> students = new StudentRepository().findAll();
                System.out.println("Số sinh viên lấy từ DB: " + students.size());  // Kiểm tra số lượng sinh viên
                req.setAttribute("students", students);
                req.getRequestDispatcher("/view/tuition/create.jsp").forward(req, resp);
                break;
            case "update":
                String idStr = req.getParameter("id");  // Đảm bảo JSP truyền đúng "id"

                if (idStr == null || idStr.isEmpty()) {
                    System.out.println("Lỗi: ID không hợp lệ hoặc bị thiếu!");
                    resp.sendRedirect("/tuitions?message=id_missing");
                    return;
                }

                try {
                    int updateId = Integer.parseInt(idStr);
                    Tuition tuition = tuitionService.getTuitionById(updateId);

                    if (tuition == null) {
                        System.out.println("Lỗi: Không tìm thấy học phí với ID: " + updateId);
                        resp.sendRedirect("/tuitions?message=tuition_not_found");
                        return;
                    }

                    req.setAttribute("tuition", tuition);
                    req.getRequestDispatcher("/view/tuition/update.jsp").forward(req, resp);
                } catch (NumberFormatException e) {
                    System.out.println("Lỗi: ID không hợp lệ!");
                    resp.sendRedirect("/tuitions?message=invalid_id");
                }
                break;



            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                tuitionService.deleteTuition(id);
                resp.sendRedirect("/tuitions?message=deleted");
                break;
            default:
                List<Tuition> tuitions = tuitionService.getAllTuition();
                req.setAttribute("tuitions", tuitions);
                req.getRequestDispatcher("/view/tuition/list.jsp").forward(req, resp);
                System.out.println("Fetching all tuition data...");
                System.out.println("Total records: " + tuitions.size());

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        System.out.println("Giá trị studentId nhận được: " + req.getParameter("studentId"));

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createTuition(req, resp);
                break;
            case "update":
                updateTuition(req, resp);
                break;
        }
    }

    private void createTuition(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String studentIdStr = req.getParameter("studentId");

        if (studentIdStr == null || studentIdStr.isEmpty()) {
            System.out.println("Lỗi: studentId bị null hoặc rỗng!");
            resp.sendRedirect("/tuitions?message=student_id_missing");
            return;
        }

        int studentId = Integer.parseInt(studentIdStr);  // Tránh lỗi NumberFormatException

        BigDecimal amount = new BigDecimal(req.getParameter("amount"));
        String dueDateStr = req.getParameter("dueDate");
        String paidStatus = req.getParameter("paidStatus");
        String paymentDateStr = req.getParameter("paymentDate");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dueDate = null;
        Date paymentDate = null;

        try {
            dueDate = dateFormat.parse(dueDateStr);
            if (paymentDateStr != null && !paymentDateStr.isEmpty()) {
                paymentDate = dateFormat.parse(paymentDateStr);
            }
        } catch (ParseException e) {
            resp.sendRedirect("/tuitions?message=invalid_date");
            return;
        }

        // Kiểm tra sinh viên có tồn tại không
        Student student = new StudentRepository().findById(studentId);
        if (student == null) {
            resp.sendRedirect("/tuitions?message=student_not_found");
            return;
        }

        Tuition tuition = new Tuition(0, student, amount, dueDate, paidStatus, paymentDate);
        tuitionService.addTuition(tuition);

        resp.sendRedirect("/tuitions?message=created");
    }

    private void updateTuition(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int studentId = Integer.parseInt(req.getParameter("studentId"));
        BigDecimal amount = new BigDecimal(req.getParameter("amount"));
        String dueDateStr = req.getParameter("dueDate");
        String paidStatus = req.getParameter("paidStatus");
        String paymentDateStr = req.getParameter("paymentDate");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dueDate = null;
        Date paymentDate = null;

        try {
            dueDate = dateFormat.parse(dueDateStr);
            if (paymentDateStr != null && !paymentDateStr.isEmpty()) {
                paymentDate = dateFormat.parse(paymentDateStr);
            }
        } catch (ParseException e) {
            resp.sendRedirect("/tuitions?message=invalid_date");
            return;
        }

        // Fetch the Student object from the database
        Student student = new StudentRepository().findById(studentId);
        if (student == null) {
            resp.sendRedirect("/tuitions?message=student_not_found");
            return;
        }

        Tuition tuition = new Tuition(id, student, amount, dueDate, paidStatus, paymentDate);
        tuitionService.updateTuition(tuition);

        resp.sendRedirect("/tuitions?message=updated");
    }


}
