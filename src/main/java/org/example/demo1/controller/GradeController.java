package org.example.demo1.controller;

import org.example.demo1.entity.Grade;
import org.example.demo1.service.IGradeService;
import org.example.demo1.service.impl.GradeService;
import org.example.demo1.service.impl.StudentService;
import org.example.demo1.service.impl.SubjectService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/grades")
public class GradeController extends HttpServlet {
    private final IGradeService gradeService = new GradeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        try {
            if ("list".equals(action)) {
                request.setAttribute("grades", gradeService.getAll());
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);
            } else if ("listRegular".equals(action)) {
                request.setAttribute("grades", gradeService.getByExamType("Regular"));
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.setAttribute("examType", "Regular");
                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);
            } else if ("listMidterm".equals(action)) {
                request.setAttribute("grades", gradeService.getByExamType("Midterm"));
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.setAttribute("examType", "Midterm");
                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);
            } else if ("listFinal".equals(action)) {
                request.setAttribute("grades", gradeService.getByExamType("Final"));
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.setAttribute("examType", "Final");
                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);
            } else if ("add".equals(action)) {
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.getRequestDispatcher("/view/grade/create.jsp").forward(request, response);
            } else if ("edit".equals(action)) {
                int gradeId = Integer.parseInt(request.getParameter("grade_id"));
                Grade grade = gradeService.findById(gradeId);
                request.setAttribute("grade", grade);
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.getRequestDispatcher("/view/grade/update.jsp").forward(request, response);
            } else {
                request.setAttribute("grades", gradeService.getAll());
                request.setAttribute("students", new StudentService().getAll());
                request.setAttribute("subjects", new SubjectService().getAll());
                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải trang: " + e.getMessage());
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        try {
            if ("add".equals(action)) {
                // Thêm điểm mới
                int studentId = Integer.parseInt(request.getParameter("student_id"));
                int subjectId = Integer.parseInt(request.getParameter("subject_id"));
                double score = Double.parseDouble(request.getParameter("score"));
                String examType = request.getParameter("exam_type");
                Date dateEntered = new Date(System.currentTimeMillis());

                Grade grade = new Grade(0, studentId, subjectId, score, dateEntered, examType);
                gradeService.save(grade);
                response.sendRedirect("/grades?action=list&success=true");
            } else if ("update".equals(action)) {
                // Cập nhật điểm
                int gradeId = Integer.parseInt(request.getParameter("grade_id"));
                int studentId = Integer.parseInt(request.getParameter("student_id"));
                int subjectId = Integer.parseInt(request.getParameter("subject_id"));
                double score = Double.parseDouble(request.getParameter("score"));
                String examType = request.getParameter("exam_type");
                Date dateEntered = new Date(System.currentTimeMillis());

                Grade grade = new Grade(gradeId, studentId, subjectId, score, dateEntered, examType);
                gradeService.update(grade);
                response.sendRedirect("/grades?action=list&success=true");
            } else if ("delete".equals(action)) {
                String gradeIdStr = request.getParameter("grade_id");
                System.out.println("Grade ID from request: " + request.getParameter("grade_id"));
                if (gradeIdStr == null || gradeIdStr.trim().isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "grade_id không hợp lệ");
                    return;
                }
                int gradeId;
                try {
                    gradeId = Integer.parseInt(gradeIdStr);
                } catch (NumberFormatException e) {
                    System.out.println("Error: grade_id phải là số: " + e.getMessage());
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "grade_id phải là số: " + e.getMessage());
                    return;
                }
                System.out.println("Attempting to delete grade with ID: " + gradeId);
                gradeService.delete(gradeId);
                System.out.println("Successfully deleted grade with ID: " + gradeId);
                response.sendRedirect("/grades?action=list&success=true");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu không hợp lệ: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý request: " + e.getMessage());
            e.printStackTrace();
        }
    }
}