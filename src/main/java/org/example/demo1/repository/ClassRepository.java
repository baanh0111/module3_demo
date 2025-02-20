//package org.example.demo1.repository;
//
//import org.example.demo1.entity.Classes;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ClassRepository {
//    private List<Classes> classList = new ArrayList<>();
//
//    public List<Classes> getAllClasses() {  //
//        return classList;
//    }
//
//    public void addClass(Classes newClass) {  // s
//        classList.add(newClass);
//    }
//
//    public Classes getClassById(int classId) {
//        return classList.stream()
//                .filter(c -> c.getClassId() == classId)
//                .findFirst()
//                .orElse(null);
//    }
//
//    public void updateClass(Classes updatedClass) {  // ⚠️ Sử dụng Classes
//        for (int i = 0; i < classList.size(); i++) {
//            if (classList.get(i).getClassId() == updatedClass.getClassId()) {
//                classList.set(i, updatedClass);
//                return;
//            }
//        }
//    }
//
//    public void deleteClass(int classId) {
//        classList.removeIf(c -> c.getClassId() == classId);
//    }
//}
