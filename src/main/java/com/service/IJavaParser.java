//package com.service;
//
//
//import com.github.javaparser.JavaParser;
//import com.github.javaparser.ast.CompilationUnit;
//
//
//import java.io.FileInputStream;
//
//
//public class IJavaParser {
//    public static void main(String[] args)throws Exception {
//            FileInputStream in = new FileInputStream("C:\\Users\\wxd\\Desktop\\ShoppingSpider.java");
//      //  CompilationUnit unit = JavaParser.parse(new File("D:\\Atools\\sts-bundle\\stsWorkspace\\bootdo2\\src\\main\\java\\com\\bootdo\\jparser\\DetectedController.java"));
//            CompilationUnit unit = JavaParser.parse(in);
//            ClassUnit vc = new ClassUnit();
//          //在指定的树上进行搜索，然后根据遇到的节点的类型调用具体的回调
//            vc.visit(unit, null);
//          //  unit.accept(vc,null);
//
//
//    }
//}