package javabasic.oop;

public class Robot {
	
		static int objCount = 0; // static 은 초기화 해주는 것이 좋다

		String name;	// " "로 자동 초기화
		String color;	// " "로 자동 초기화
		int age;		// 0으로 자동 초기화
		
		
		static int getObjCount() {
			return objCount;
		}
		
		
		void say() {
			System.out.println(this.name + "가 대화한다");
			
		}
		void move() {
			System.out.println(this.name + "가 축구를 한다");
		}
		
		void cal() {
			System.out.println(this.name + "가 계산한다");
		}
		
		
	
}
