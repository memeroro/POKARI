package javabasic;

import java.util.Scanner;

public class Condition {
	public static void main(String[] args) {
		
		int i = 15;
		
		if(i<10) {
			System.out.println("i가 10보다 작습니다");			
		} else if(i==15) {
			System.out.println("i가 15입니다");
		} else {
			System.out.println("i가 10보다 작지 않고 15도 아닙니다");
		}
			
		
		int j = 1;
		
		switch(j) {
			case 1:
				System.out.println("남성입니다");
				break;
			case 2: 
				System.out.println("여성입니다");
				break;
			default :
				System.out.println("남성도 여성도 아닙니다");
		}
		
		
		int p = 3;
		
		if(p==1) {
			System.out.println("남성입니다");
		}else if(p==2) {
			System.out.println("여성입니다");
		}else if(p==3){
			System.out.println("괴물입니다");
		}else {
			System.out.println("남성도 여성도 아닙니다");
		}
		
		// 실습 1)
		// 두 개의 int 변수를 만들어 각각 5와 10의 값을 대입하고
		// 두 변수의 합을 sum이라는 byte변수에 저장한 후
		// 값이 10보다 큰지 비교하여 출력
		
		int a = 5;
		int b = 10;
		byte sum = (byte)(a + b);
		
		if(sum>10) {
			System.out.println("값이 10보다 큽니다");
		}else {
			System.out.println("값이 10보다 크지 않습니다");
		}
		
		// 실습 2)
		// num3이라는 int변수에는 5를 대입하고
		// num4이라는 int변수에는 10을 대입하고
		// sum2라는 int변수에는 두 변수의 합을 대입하고
		// mul라는 int변수에는  두 변수의 곱을 대입하고
		// 두 변수의 곱에서 두 변수의 합을 뺀 값을 result라는 short변수에 저장
		// result가 0~10사이에 있는지, 11~20사이에 있는지, 21~30 사이에 있는지
		// 31~40사이에 있는지 출력
		
		int num3 = 5;
		int num4 = 10;
		
		int sum2 = num3 + num4;
		int mul = num3 * num4;
		
		short result = (short)(mul - sum2);
		
		if(result<=10) {
			System.out.println("0~10사이 입니다");
		}else if(result<=20){
			System.out.println("11~20사이 입니다");
		}else if(result<=30){
			System.out.println("21~30사이 입니다");
		}else if(result<=40){
			System.out.println("31~40사이 입니다");
		}else {
			System.out.println("숫자가 너무 작거나 큽니다");
		}
		
		
		// 실습 3)
		// 키보드에서 숫자를 하나 입력 받아서 입력받은 숫자를 5로 나눈 나머지를 출력
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자를 입력 >>> ");
		int yy = sc.nextInt();
		
		int y = yy / 5;
		System.out.printf("5로 나눈 값은 %d입니다\n", y);
		
		
		// 실습 4)
		// 키보드에서 숫자를 두 개 입력받아서 입력받은 두 수의 합을 출력
		System.out.print("숫자 한 개 입력 >>> ");
		int susu = sc.nextInt();
		
		System.out.print("숫자 두 개 입력 >>> ");
		int nunu = sc.nextInt();
		
		int popo = susu + nunu;
		
		System.out.print("두 수의 합은" + popo + "입니다\n");
		
		// 실습 5)
		// 키보드에서 0~6까지의 숫자를 입력받아서 0이면 일요일, 1이면 월요일... 출력
		
		System.out.print("0부터 6까지의 숫자를 입력하시오 >>> ");
		int q = sc.nextInt();
		
		switch(q) {
		
		case 0 : System.out.print("월요일"); break;
		case 1 : System.out.print("화요일"); break;
		case 2 : System.out.print("수요일"); break;
		case 3 : System.out.print("목요일"); break;
		case 4 : System.out.print("금요일"); break;
		case 5 : System.out.print("토요일"); break;
		case 6 : System.out.print("일요일"); break;
		default :System.out.print("0부터 6까지의 숫자를 입력하시오");
		
		}

		
//		if(q==0){
//			System.out.print("월요일 입니다");
//		}else if(q==1) {
//			System.out.print("화요일 입니다");
//		}else if(q==2) {
//			System.out.print("수요일 입니다");
//		}else if(q==3) {
//			System.out.print("목요일 입니다");
//		}else if(q==4) {
//			System.out.print("금요일 입니다");
//		}else if(q==5) {
//			System.out.print("토요일 입니다");
//		}else if(q==6) {
//			System.out.print("일요일 입니다");
//		}else {
//			System.out.print("0부터 6까지의 숫자를 입력해주세요");
//		}
		
		
		
		
		
		
		
	} // main

} // class
