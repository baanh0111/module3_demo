//package org.example.demo1.service.impl;
//
//import org.example.demo1.entity.Classes;
//import org.example.demo1.repository.ClassRepository;
//
//import java.util.List;
//
//public class ClassService {
//    private ClassRepository classRepository;
//
//    public ClassService() {
//        this.classRepository = new ClassRepository();
//    }
//
//    // Lấy danh sách tất cả lớp
//    public List<Classes> getAllClasses() {  // ⚠️ Đổi từ List<Class> → List<Classes>
//        return classRepository.getAllClasses();
//    }
//
//    // Thêm lớp mới
//    public boolean addClass(String className, int teacherId) {
//        if (className == null || className.isEmpty() || teacherId <= 0) {
//            return false;
//        }
//        Classes newClass = new Classes(0, className, teacherId);
//        classRepository.addClass(newClass);
//        return true;
//    }
//
//    // Lấy thông tin lớp theo ID
//    public Classes getClassById(int classId) { // ⚠️ Đổi từ Class → Classes
//        return classRepository.getClassById(classId);
//    }
//
//    // Cập nhật lớp
//    public boolean updateClass(int classId, String className, int teacherId) {
//        if (classId <= 0 || className == null || className.isEmpty() || teacherId <= 0) {
//            return false;
//        }
//        Classes updatedClass = new Classes(classId, className, teacherId); // ⚠️ Đổi từ Class → Classes
//        classRepository.updateClass(updatedClass);
//        return true;
//    }
//
//    // Xóa lớp
//    public boolean deleteClass(int classId) {
//        if (classId <= 0) {
//            return false;
//        }
//        classRepository.deleteClass(classId);
//        return true;
//    }
//}
