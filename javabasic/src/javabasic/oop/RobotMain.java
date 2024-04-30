package javabasic.oop;

public class RobotMain {
	public static void main(String[] args) {
		
		// Robot 타입 객체 3개 생성
		Robot robot1 = new Robot();
		Robot.objCount ++;
		Robot robot2 = new Robot();
		Robot.objCount ++;
		Robot robot3 = new Robot();
		Robot.objCount ++;
		
		
		//객체 데이터 설정
		robot1.name = "시리";
		robot1.color = "노랑";
		robot1.age = 54;
		
		robot2.name = "지피";
		robot2.color = "파랑";
		robot2.age = 302;
		
		robot3.name = "지니";
		robot3.color = "검정";
		robot3.age = 8752;
		
		
		//객체 데이터 출력
		System.out.println(robot1.name+"의 색깔은 " + robot1.color + "이고 " + "나이는 " 
					+ robot1.age + "입니다");
		System.out.println(robot2.name+"의 색깔은 " + robot2.color + "이고 " + "나이는 " 
					+ robot2.age + "입니다");
		System.out.println(robot3.name+"의 색깔은 " + robot3.color + "이고 " + "나이는 " 
					+ robot3.age + "입니다");
		
		// 객체 메소드 호출
		robot1.say();
		robot2.move();
		robot3.cal();
		
		
		
		// 생성된 객체 수
		System.out.println("총 " + Robot.objCount + "개의 객체 생성됨");
		System.out.println("총 " + Robot.getObjCount() + "개의 객체 생성됨");
	
		
		
	}
}
