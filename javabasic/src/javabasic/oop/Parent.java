package javabasic.oop;

//Parent 는 GrandParent를 상속 받는다
//Parent 는 참조범위를 GrandParent의 메모리까지 확장(extends)한다
public class Parent extends GrandParent{ // extends 뒤에 있는 GrandParent의 것을 사용할 수 있다. 참조범위를 확장
										 // GrandParent가 메모리 자체는 크지만 참조범위는 Parent 가 더 크다

	String name;
	int age;
	String job;
	
	Parent(){
		
	}
	
	Parent(String name, int age, String job){
		this.name = name;
		this.age = age;
		this.job = job;
	
	}
	
	
	void say() { //오버라이딩
		System.out.println("아버님이 말씀하셨다");
	}
	
}