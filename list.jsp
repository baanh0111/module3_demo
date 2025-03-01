[1mdiff --git a/.idea/webContexts.xml b/.idea/webContexts.xml[m
[1mindex b04080a..6c0f3d0 100644[m
[1m--- a/.idea/webContexts.xml[m
[1m+++ b/.idea/webContexts.xml[m
[36m@@ -3,6 +3,7 @@[m
   <component name="WebContextManager">[m
     <option name="state">[m
       <map>[m
[32m+[m[32m        <entry key="file://$PROJECT_DIR$/src/main/webapp/view/grade/list.jsp" value="file://$PROJECT_DIR$/src/main/webapp/view/grade" />[m
         <entry key="file://$PROJECT_DIR$/src/main/webapp/view/schedule/create.jsp" value="file://$PROJECT_DIR$/src/main/webapp/view/schedule" />[m
       </map>[m
     </option>[m
[1mdiff --git a/src/main/java/org/example/demo1/controller/GradeController.java b/src/main/java/org/example/demo1/controller/GradeController.java[m
[1mindex 74f4328..d1da386 100644[m
[1m--- a/src/main/java/org/example/demo1/controller/GradeController.java[m
[1m+++ b/src/main/java/org/example/demo1/controller/GradeController.java[m
[36m@@ -1,2 +1,124 @@[m
[31m-package org.example.demo1.controller;public class GradeController {[m
[31m-}[m
[32m+[m[32mpackage org.example.demo1.controller;[m
[32m+[m
[32m+[m[32mimport org.example.demo1.entity.Grade;[m
[32m+[m[32mimport org.example.demo1.service.IGradeService;[m
[32m+[m[32mimport org.example.demo1.service.impl.GradeService;[m
[32m+[m[32mimport org.example.demo1.service.impl.StudentService;[m
[32m+[m[32mimport org.example.demo1.service.impl.SubjectService;[m
[32m+[m
[32m+[m[32mimport javax.servlet.annotation.WebServlet;[m
[32m+[m[32mimport javax.servlet.http.HttpServlet;[m
[32m+[m[32mimport javax.servlet.http.HttpServletRequest;[m
[32m+[m[32mimport javax.servlet.http.HttpServletResponse;[m
[32m+[m[32mimport java.io.IOException;[m
[32m+[m[32mimport java.sql.Date;[m
[32m+[m
[32m+[m[32m@WebServlet("/grades")[m
[32m+[m[32mpublic class GradeController extends HttpServlet {[m
[32m+[m[32m    private final IGradeService gradeService = new GradeService();[m
[32m+[m
[32m+[m[32m    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {[m
[32m+[m[32m        String action = request.getParameter("action");[m
[32m+[m[32m        try {[m
[32m+[m[32m            if ("list".equals(action)) {[m
[32m+[m[32m                request.setAttribute("grades", gradeService.getAll());[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);[m
[32m+[m[32m            } else if ("listRegular".equals(action)) {[m
[32m+[m[32m                request.setAttribute("grades", gradeService.getByExamType("Regular"));[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.setAttribute("examType", "Regular");[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);[m
[32m+[m[32m            } else if ("listMidterm".equals(action)) {[m
[32m+[m[32m                request.setAttribute("grades", gradeService.getByExamType("Midterm"));[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.setAttribute("examType", "Midterm");[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);[m
[32m+[m[32m            } else if ("listFinal".equals(action)) {[m
[32m+[m[32m                request.setAttribute("grades", gradeService.getByExamType("Final"));[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.setAttribute("examType", "Final");[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);[m
[32m+[m[32m            } else if ("add".equals(action)) {[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/create.jsp").forward(request, response);[m
[32m+[m[32m            } else if ("edit".equals(action)) {[m
[32m+[m[32m                int gradeId = Integer.parseInt(request.getParameter("grade_id"));[m
[32m+[m[32m                Grade grade = gradeService.findById(gradeId);[m
[32m+[m[32m                request.setAttribute("grade", grade);[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/update.jsp").forward(request, response);[m
[32m+[m[32m            } else {[m
[32m+[m[32m                request.setAttribute("grades", gradeService.getAll());[m
[32m+[m[32m                request.setAttribute("students", new StudentService().getAll());[m
[32m+[m[32m                request.setAttribute("subjects", new SubjectService().getAll());[m
[32m+[m[32m                request.getRequestDispatcher("/view/grade/list.jsp").forward(request, response);[m
[32m+[m[32m            }[m
[32m+[m[32m        } catch (Exception e) {[m
[32m+[m[32m            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải trang: " + e.getMessage());[m
[32m+[m[32m            e.printStackTrace();[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {[m
[32m+[m[32m        String action = request.getParameter("action");[m
[32m+[m[32m        try {[m
[32m+[m[32m            if ("add".equals(action)) {[m
[32m+[m[32m                // Thêm điểm mới[m
[32m+[m[32m                int studentId = Integer.parseInt(request.getParameter("student_id"));[m
[32m+[m[32m                int subjectId = Integer.parseInt(request.getParameter("subject_id"));[m
[32m+[m[32m                double score = Double.parseDouble(request.getParameter("score"));[m
[32m+[m[32m                String examType = request.getParameter("exam_type");[m
[32m+[m[32m                Date dateEntered = new Date(System.currentTimeMillis());[m
[32m+[m
[32m+[m[32m                Grade grade = new Grade(0, studentId, subjectId, score, dateEntered, examType);[m
[32m+[m[32m                gradeService.save(grade);[m
[32m+[m[32m                response.sendRedirect("/grades?action=list&success=true");[m
[32m+[m[32m            } else if ("update".equals(action)) {[m
[32m+[m[32m                // Cập nhật điểm[m
[32m+[m[32m                int gradeId = Integer.parseInt(request.getParameter("grade_id"));[m
[32m+[m[32m                int studentId = Integer.parseInt(request.getParameter("student_id"));[m
[32m+[m[32m                int subjectId = Integer.parseInt(request.getParameter("subject_id"));[m
[32m+[m[32m                double score = Double.parseDouble(request.getParameter("score"));[m
[32m+[m[32m                String examType = request.getParameter("exam_type");[m
[32m+[m[32m                Date dateEntered = new Date(System.currentTimeMillis());[m
[32m+[m
[32m+[m[32m                Grade grade = new Grade(gradeId, studentId, subjectId, score, dateEntered, examType);[m
[32m+[m[32m                gradeService.update(grade);[m
[32m+[m[32m                resp