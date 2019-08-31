//package com.service;
//
//import com.github.javaparser.ast.ImportDeclaration;
//import com.github.javaparser.ast.NodeList;
//import com.github.javaparser.ast.PackageDeclaration;
//import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
//import com.github.javaparser.ast.body.MethodDeclaration;
//import com.github.javaparser.ast.comments.JavadocComment;
//import com.github.javaparser.ast.expr.AnnotationExpr;
//import com.github.javaparser.ast.expr.VariableDeclarationExpr;
//import com.github.javaparser.ast.visitor.VoidVisitorAdapter;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
///**
// * @author ：信1605-1 HJJ
// * @date ：Created in 2019/5/11/011 0:06
// * @description： QQ479287006
// * @modified By：
// * @version: 1.0.1
// */
//public class ClassUnit extends VoidVisitorAdapter<Object> {
//    Logger log  = LoggerFactory.getLogger(ClassUnit.class);
//    Pattern pattern1 = Pattern.compile("[a-z]*");
//	Pattern pattern2 = Pattern.compile("[A-Z]*");
///**
// * 包名
// */
//    @Override
//    public void visit(PackageDeclaration n, Object arg) {
//        System.out.print("package---------"+n.getName());
//        Matcher matcher = pattern1.matcher(n.getName().toString());
//        if(matcher.matches()==false)
//        {
//        	 System.out.println("---------"+n.getName().toString().toLowerCase());
//        }
//        else
//        {
//        	 System.out.println();
//        }
//        super.visit(n, arg);
//    }
//
///**
// * 支持包
// */
//    @Override
//    public void visit(ImportDeclaration n, Object arg) {
//        System.out.print("ImportDeclaration---------"+n.getName());
//        boolean flag=true;
//        int x=n.getName().toString() .lastIndexOf(".");
//		String result=n.getName().toString().substring(x+1);
//		Matcher matcher = pattern1.matcher(result.substring(1));
//		if(result.charAt(0) >= 97 && result.charAt(0) <= 122)
//		{
//
//		}
//		else
//		{
//			    char c=Character.toUpperCase(result.charAt(0));//将类名的第一个字符转换为大写
//				String shengyu=	result.substring(1);
//				result=String.valueOf(c)+shengyu;
//				flag=false;
//		}
////		String baoName=n.getName().toString().substring(0, x+1);
////		Matcher matcher2=pattern2.matcher(baoName);
////		if(matcher2.matches()==true)//如果包名中含有大写字符
////		{
////			baoName=baoName.toLowerCase();//全部转换为小写字母
////			System.out.println("---------"+baoName.toLowerCase());
////			flag=false;
////		}
////		if(flag==false)
////		{
////			System.out.println("---------"+baoName+result);
////		}
//        super.visit(n, arg);
//    }
//
//
//    /**
//     * 类
//     */
//
//    @Override
//    public void visit(ClassOrInterfaceDeclaration n, Object arg) {
//        log.info("arg-----------"+arg);//null
//        //log.info("n.toString()--------"+n.toString());//整个类的内容,不包括package和import
//        log.info("n.getNameAsString()---------"+n.getNameAsString());//类名
//
//        //获取类的注解
//        NodeList<AnnotationExpr> annotations = n.getAnnotations();
//        //判断是否有注解
//        if(annotations.size()>0)
//        {
//        	for (AnnotationExpr annotation : annotations)
//        	{
//        		log.info(annotation.toString());
//        	}
//        }
//        //获取类的注释
//        Optional<JavadocComment> javadocComment = n.getJavadocComment();
//        log.info(javadocComment.toString());
//        System.out.print("类名---------"+n.getNameAsString());
//        String result=n.getNameAsString();
//        Matcher matcher = pattern1.matcher(result.substring(1));
//		if((result.charAt(0) >= 97 && result.charAt(0) <= 122)&&(matcher.matches()==true))
//		{
//			System.out.println();
//		}
//		else
//		{
//			    char c=Character.toUpperCase(result.charAt(0));//将类名的第一个字符转换为大写
//				String shengyu=	result.substring(1);
//				result=String.valueOf(c)+shengyu;
//				System.out.println("---------"+result);
//		}
//
//        super.visit(n, arg);
//    }
//
//    /**
//     * 变量
//     */
//    @Override
//    public void visit(VariableDeclarationExpr n, Object arg) {
//        log.info("VariableDeclarator--------"+n.toString());
//        System.out.println("变量名---------"+n.toString());
//        super.visit(n, arg);
//    }
//
///**
// * 成员方法
// */
//    @Override
//    public void visit(MethodDeclaration n, Object arg) {
//        log.info("n.getNameAsString()---------"+n.getNameAsString());//方法名
//        log.info("n.getParameters()---------"+n.getParameters());//所有参数
//        System.out.print("成员方法名---------"+n.getNameAsString());
//        String result=n.getNameAsString();
//        Matcher matcher = pattern1.matcher(result.substring(1));
//		if((result.charAt(0) >= 97 && result.charAt(0) <= 122)&&(matcher.matches()==true))
//		{
//			System.out.println();
//		}
//		else
//		{
//			    char c=Character.toLowerCase(result.charAt(0));
//				String shengyu=	result.substring(1);
//				result=String.valueOf(c)+shengyu;
//				System.out.println("---------"+result);
//		}
//        System.out.println("成员方法参数---------"+n.getParameters());
//        super.visit(n, arg);
//    }
//
//}
