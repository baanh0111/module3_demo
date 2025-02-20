//package org.example.demo1.controller;
//
//import org.example.demo1.entity.Classes;
//import org.example.demo1.repository.ClassRepository;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/classes")
//public class ClassController extends HttpServlet {
//    private ClassRepository classRepository;
//
//    @Override
//    public void init() {
//        classRepository = new ClassRepository();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if (action == null) {
//            listClasses(request, response);
//        } else {
//            switch (action) {
//                case "new":
//                    showNewForm(request, response);
//                    break;
//                case "edit":
//                    showEditForm(request, response);
//                    break;
//                case "delete":
//                    deleteClass(request, response);
//                    break;
//                default:
//                    listClasses(request, response);
//                    break;
//            }
//        }
//    }
//
//    private void listClasses(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        List<Classes> classList = classRepository.getAllClasses(); // 🔥 Sửa List<Class> → List<Classes>
//        request.setAttribute("classList", classList);
//        request.getRequestDispatcher("view/class/list.jsp").forward(request, response);
//    }
//
//    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("/class-form.jsp").forward(request, response);
//    }
//
//    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Classes classToEdit = classRepository.getClassById(id); // 🔥 Sửa Class → Classes
//        request.setAttribute("class", classToEdit);
//        request.getRequestDispatcher("/class-form.jsp").forward(request, response);
//    }
//
//    private void deleteClass(HttpServletRequest request, HttpServletResponse response)
//            throws IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        classRepository.deleteClass(id);
//        response.sendRedirect("classes");
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String id = request.getParameter("id");
//        String name = request.getParameter("name");
//        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
//
//        if (id == null || id.isEmpty()) {
//            classRepository.addClass(new Classes(0, name, teacherId)); // 🔥 Sửa Class → Classes
//        } else {
//            classRepository.updateClass(new Classes(Integer.parseInt(id), name, teacherId)); // 🔥 Sửa Class → Classes
//        }
//
//        response.sendRedirect("classes");
//    }
//}
