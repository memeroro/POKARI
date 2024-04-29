package javabasic;

public class LoofExer {
	public static void main(String[] args) {
		
		// 별찍기 1
		// *
		// **
		// ***
		// ****
		// *****
		
//		for (int i=0; i<5; i++) {
//			for (int j=0; j<=i; j++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
		
		// 별찍기 2
		//		 *
		//		**
		//	   ***
		//	  ****
		//	 *****

//		for (int i=0; i<5; i++) {
//			for (int k=0; k<4-i; k++) {
//				System.out.print("O");
//			}
//			for(int j=0; j<=i; j++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
				
		
		// 별찍기 3
		// *****
		// ****
		// ***
		// **
		// *
		
//		for (int i=5; i>0; i--) {
//			for (int j=0; j<i; j++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
		
		// 별찍기 4
		// *****
		// *   *
		// *   *
		// *   *
		// *****
		
//		for (int i=0; i<=4; i++) {
//			for (int j=0; j<5; j++) {
//				if(i%4==0) {
//					System.out.print("*");
//				}else if(j%4==0){
//					System.out.print("*");
//				}else
//					System.out.print(" ");
//			}
//			System.out.println();
//		}
		
		// 별찍기 5
		// *****
		// ** **
		// * * *
		// ** **
		// *****
		
//		for (int i=0; i<4+1; i++) {  //for 문 시작. i 가 0으로 시작해서 5보다 작으면 다음 for 문으로 넘어가고 5보다 크면 for 문 종료
//			for(int j=0; j<4+1; j++) {
//				if(i%4==0 || j%4==0 || i==j || i*j==3) {
//					System.out.print("*");
//				}else {
//					System.out.print(" ");
//				}
//			}
//			System.out.println();
//		}
		
		// 별찍기 6 (Z)
		// *****
		//    * 
		//   * 
		//  *   
		// *****
		// j%keynum==0
		// int keynum = 12;
//		for (int i=0; i<5; i++) {
//			for (int j=0; j<5; j++) {
//				if(i%4==0 || i+j==4) {
//					System.out.print("*");
//				}else {
//					System.out.print("O");
//				}
//			}
//			System.out.println();
//		}
		
		// 별찍기 7 (H)
		// *   *
		// *   *
		// *****
		// *   *
		// *   *
		
//		int key1 = 10;
//		for(int i=0; i<key1+1; i++) {
//			for(int j=0; j<key1+1; j++) {
//				if(j==0 || j==10 || i==5) {
//					System.out.print("*");
//				}else {
//					System.out.print(" ");
//				}
//			}
//			System.out.println();
//		}	
		
//		int key2 = 10;
//		for (int i=0; i<key2+1; i++) {
//			for(int j=0; j<key2+1; j++) {
//				if(j%key2==0 || i==key2/2) {				
//					System.out.print("*");
//				}else {
//					System.out.print(" ");
//				}
//			}
//			System.out.println();
//		}
		
		
		// 별찍기 8
		//   *  
		//  ***
		// *****
		//  ***
		//   *
		
		int key3 = 6;
		for (int i=0; i<key3+1 ; i++) {
			for(int j=0; j<key3+1; j++) {
				if(key3/2==j || key3/2==i) {				
					System.out.print("*");
				}else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}
		
		
	} //main
} // class
