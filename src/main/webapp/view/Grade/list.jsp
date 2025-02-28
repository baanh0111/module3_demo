<%@ page import="org.example.demo1.repository.GradeRepository" %>
<%@ page import="org.example.demo1.entity.StudentGrades" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>

<%
    Connection connection = (Connection) application.getAttribute("DB_CONNECTION");
    GradeRepository gradeRepository = new GradeRepository(connection);
    List<StudentGrades> studentGradesList = gradeRepository.getStudentGrades();
%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Môn học</th>
        <th>Điểm</th>
    </tr>
    <%
        for (StudentGrades student : studentGradesList) {
            for (Map.Entry<String, Double> entry : student.getScores().entrySet()) {
    %>
    <tr>
        <td><%= student.getStudentId() %></td>
        <td><%= student.getStudentName() %></td>
        <td><%= entry.getKey() %></td>
        <td><%= entry.getValue() != null ? entry.getValue() : "N/A" %></td>
    </tr>
    <%
            }
        }
    %>
</table>
