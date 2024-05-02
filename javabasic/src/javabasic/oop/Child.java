package javabasic.oop;

public class Child extends Parent{

	String name;
	int age;
	String job;
	
	Child(String name, int age, String job){
		this.name = name;
		this.age = age;
		this.job = job;
	
	}
	
	@Override //오류를 바로 체크해준다. 실수를 줄여준다
	void say() { // 메소드 시그니쳐    // 오버라이딩
		System.out.println("내가 말했다");
	}
	
	
}
