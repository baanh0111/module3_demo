package org.example.demo1.controller;

import org.example.demo1.entity.Schedule;
import org.example.demo1.service.IClassService;
import org.example.demo1.service.IScheduleService;
import org.example.demo1.service.ISubjectService;
import org.example.demo1.service.impl.ClassService;
import org.example.demo1.service.impl.ScheduleService;
import org.example.demo1.service.impl.SubjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

@WebServlet(name = "scheduleController", urlPatterns = {"/schedules"})
public class ScheduleController extends HttpServlet {
    private final IScheduleService scheduleService = new ScheduleService();
    private final IClassService classService = new ClassService();
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
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                try {
                    deleteSchedule(request, response);
                } catch (SQLException e) {
                    throw new ServletException(e);
                }
                break;
            case "details":
                showScheduleDetails(request, response);
                break;
            default:
                showScheduleList(request, response);
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
                createSchedule(request, response);
                break;
            case "edit":
                try {
                    updateSchedule(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showScheduleList(request, response);
                break;
        }
    }

    private void showScheduleList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Schedule> schedules = scheduleService.getAll();
        request.setAttribute("schedules", schedules);
        request.getRequestDispatcher("/view/schedule/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("classes", classService.getAll());
        request.setAttribute("subjects", subjectService.getAllSubject());
        request.getRequestDispatcher("/view/schedule/create.jsp").forward(request, response);
    }

    private void createSchedule(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int class_id = Integer.parseInt(request.getParameter("class_id"));
            int subject_id = Integer.parseInt(request.getParameter("subject_id"));
            String day_of_week = request.getParameter("day_of_week");

            // Lấy và kiểm tra start_time
            String startTimeStr = request.getParameter("start_time");
            Time start_time = null;
            if (startTimeStr != null && !startTimeStr.trim().isEmpty()) {
                // Đảm bảo định dạng HH:MM:SS, nếu chỉ có HH:MM thì thêm :00
                String formattedStartTime = startTimeStr;
                if (startTimeStr.split(":").length == 2) {
                    formattedStartTime = startTimeStr + ":00";
                }
                start_time = Time.valueOf(formattedStartTime);
            } else {
                throw new IllegalArgumentException("Thời gian bắt đầu không được để trống");
            }

            // Lấy và kiểm tra end_time
            String endTimeStr = request.getParameter("end_time");
            Time end_time = null;
            if (endTimeStr != null && !endTimeStr.trim().isEmpty()) {
                String formattedEndTime = endTimeStr;
                if (endTimeStr.split(":").length == 2) {
                    formattedEndTime = endTimeStr + ":00";
                }
                end_time = Time.valueOf(formattedEndTime);
            } else {
                throw new IllegalArgumentException("Thời gian kết thúc không được để trống");
            }

            // Kiểm tra nếu end_time nhỏ hơn start_time (chỉ so sánh giờ và phút)
            String startTimeOnly = startTimeStr.split(":")[0] + ":" + startTimeStr.split(":")[1];
            String endTimeOnly = endTimeStr.split(":")[0] + ":" + endTimeStr.split(":")[1];
            Time startTimeForComparison = Time.valueOf(startTimeOnly + ":00");
            Time endTimeForComparison = Time.valueOf(endTimeOnly + ":00");
            if (endTimeForComparison.before(startTimeForComparison)) {
                throw new IllegalArgumentException("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
            }

            Schedule schedule = new Schedule(0, class_id, subject_id, day_of_week, start_time, end_time);
            scheduleService.save(schedule);
            response.sendRedirect("/schedules");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID lớp hoặc ID môn học không hợp lệ: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm lịch học: " + e.getMessage());
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
        Schedule schedule = scheduleService.findById(schedule_id);
        request.setAttribute("classes", classService.getAll());
        request.setAttribute("subjects", subjectService.getAllSubject());
        request.setAttribute("schedule", schedule);
        request.getRequestDispatcher("/view/schedule/update.jsp").forward(request, response);
    }

    private void updateSchedule(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        try {
            int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
            int class_id = Integer.parseInt(request.getParameter("class_id"));
            int subject_id = Integer.parseInt(request.getParameter("subject_id"));
            String day_of_week = request.getParameter("day_of_week");

            // Lấy và kiểm tra start_time
            String startTimeStr = request.getParameter("start_time");
            Time start_time = null;
            if (startTimeStr != null && !startTimeStr.trim().isEmpty()) {
                String formattedStartTime = startTimeStr;
                if (startTimeStr.split(":").length == 2) {
                    formattedStartTime = startTimeStr + ":00";
                }
                start_time = Time.valueOf(formattedStartTime);
            } else {
                throw new IllegalArgumentException("Thời gian bắt đầu không được để trống");
            }

            // Lấy và kiểm tra end_time
            String endTimeStr = request.getParameter("end_time");
            Time end_time = null;
            if (endTimeStr != null && !endTimeStr.trim().isEmpty()) {
                String formattedEndTime = endTimeStr;
                if (endTimeStr.split(":").length == 2) {
                    formattedEndTime = endTimeStr + ":00";
                }
                end_time = Time.valueOf(formattedEndTime);
            } else {
                throw new IllegalArgumentException("Thời gian kết thúc không được để trống");
            }

            // Kiểm tra nếu end_time nhỏ hơn start_time (chỉ so sánh giờ và phút)
            String startTimeOnly = startTimeStr.split(":")[0] + ":" + startTimeStr.split(":")[1];
            String endTimeOnly = endTimeStr.split(":")[0] + ":" + endTimeStr.split(":")[1];
            Time startTimeForComparison = Time.valueOf(startTimeOnly + ":00");
            Time endTimeForComparison = Time.valueOf(endTimeOnly + ":00");
            if (endTimeForComparison.before(startTimeForComparison)) {
                throw new IllegalArgumentException("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
            }

            Schedule updatedSchedule = new Schedule(schedule_id, class_id, subject_id, day_of_week, start_time, end_time);
            scheduleService.update(schedule_id, updatedSchedule);
            response.sendRedirect("/schedules");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID or Teacher ID format: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Update failed due to server error: " + e.getMessage());
        }
    }

    private void deleteSchedule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
        scheduleService.remove(schedule_id);
        response.sendRedirect("/schedules");
    }

    private void showScheduleDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
        Schedule schedule = scheduleService.findById(schedule_id);
        request.setAttribute("schedule", schedule);
        request.getRequestDispatcher("/view/schedule/details.jsp").forward(request, response);
    }
}