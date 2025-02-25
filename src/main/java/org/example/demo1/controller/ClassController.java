package org.example.demo1.controller;

import org.example.demo1.entity.Class;
import org.example.demo1.entity.Student;
import org.example.demo1.entity.Teacher;
import org.example.demo1.service.IClassService;
import org.example.demo1.service.ITeacherService;
import org.example.demo1.service.impl.ClassService;
import org.example.demo1.service.impl.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Quản lý các yêu cầu liên quan đến lớp học.
 */
@WebServlet(name = "classController", urlPatterns = {"/classes"})
public class ClassController extends HttpServlet {

    private final IClassService classService = new ClassService();
    private final ITeacherService teacherService = new TeacherService();

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
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                try {
                    deleteClass(request, response);
                } catch (SQLException e) {
                    throw new ServletException(e); // Bao bọc SQLException trong ServletException
                }
                break;
            case "details":
                showClassDetails(request, response);
                break;
            default:
                showClassList(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                createClass(request, response);
                break;
            case "update":
                try {
                    updateClass(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showClassList(request, response);
                break;
        }
    }

    private void showClassList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Class> classes = classService.getAll();
        request.setAttribute("classes", classes);
        request.getRequestDispatcher("/view/class/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> teachers = classService.getTeachersWithoutClass();
        request.setAttribute("teachers", teachers);
        request.getRequestDispatcher("/view/class/create.jsp").forward(request, response);
    }

    private void createClass(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));

        Teacher teacher = teacherService.findById(teacherId);
        Class newClass = new Class();
        newClass.setName(name);
        newClass.setTeacher(teacher);

        classService.save(newClass);
        response.sendRedirect("/classes");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int class_id = Integer.parseInt(request.getParameter("class_id")); //
        Class clazz = classService.findById(class_id);
        List<Teacher> teachers = teacherService.getAll();

        request.setAttribute("clazz", clazz);
        request.setAttribute("teachers", teachers);
        request.getRequestDispatcher("/view/class/update.jsp").forward(request, response);
    }


    private void updateClass(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        try {
            int class_id = Integer.parseInt(request.getParameter("class_id"));
            String name = request.getParameter("name");
            System.out.println("Received name from request: " + name);
            String teacherIdParam = request.getParameter("teacher_id");
            int teacherId = (teacherIdParam != null && !teacherIdParam.isEmpty()) ? Integer.parseInt(teacherIdParam) : -1;

            if (teacherId == -1) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Teacher ID is required");
                return;
            }

            Teacher teacher = teacherService.findById(teacherId);
            if (teacher == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Teacher not found");
                return;
            }

            Class updatedClass = new Class(class_id, name, teacher, null);
            classService.update(class_id, updatedClass);
            response.sendRedirect("/classes");
        } catch (NumberFormatException e) {
            System.out.println("Invalid ID format: " + e.getMessage()); // Log lỗi
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID or Teacher ID format");
        } catch (Exception e) {
            System.out.println("Update failed: " + e.getMessage()); // Log lỗi
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Update failed due to server error");
        }
    }

    private void deleteClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String idParam = request.getParameter("class_id");
        System.out.println("class_id received: " + idParam); // Debug

        int class_id;
        try {
            if (idParam == null || idParam.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Class ID is required");
                return;
            }
            class_id = Integer.parseInt(idParam.trim());
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Class ID format");
            return;
        }

        classService.remove(class_id);
        response.sendRedirect("/classes");
    }
    /**
     * Hiển thị chi tiết lớp học: giáo viên phụ trách, số lượng học sinh và danh sách học sinh.
     */
    /*private void showClassDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int class_id = Integer.parseInt(request.getParameter("class_id"));
        Class clazz = classService.findById(class_id);
        int studentCount = classService.countStudentsInClass(class_id);
        String teacherName = classService.getTeacherNameByClassId(class_id);

        request.setAttribute("class", clazz);
        request.setAttribute("studentCount", studentCount);
        request.setAttribute("teacherName", teacherName);

        request.getRequestDispatcher("/view/class/details.jsp").forward(request, response);
    }*/
    private void showClassDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy tham số từ request
        String IdParam = request.getParameter("class_id");

        // Kiểm tra tham số có tồn tại và không rỗng không
        if (IdParam == null || IdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số class_id");
            return;
        }

        try {
            // Chuyển đổi sang số nguyên
            int class_id = Integer.parseInt(IdParam);

            // Logic xử lý tiếp theo
            Class clazz = classService.findById(class_id);
            if (clazz == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy lớp học");
                return;
            }
            List<Student> studentList = classService.getStudentsInClassId(class_id);
            clazz.setStudents(studentList);
            int studentCount = classService.countStudentsInClass(class_id);
            String teacherName = classService.getTeacherNameByClassId(class_id);

            // Đặt tên attribute tránh từ khóa "class"
            request.setAttribute("clazz", clazz);
            request.setAttribute("studentCount", studentCount);
            request.setAttribute("teacherName", teacherName);

            // Forward đến JSP
            request.getRequestDispatcher("/view/class/details.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Xử lý trường hợp class_id không phải số
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "class_id phải là số nguyên");
        } catch (Exception e) {
            // Xử lý lỗi server
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server");
        }
    }
}



