package javabasic.oop.art;

public class ArtMain {
	public static void main(String[] args) {

		IArt art = new Drawing("미술작품");
		
		IArt music = new Music("콘서트");
		
		IArt movie = new Movie("쿵푸팬더4");

		// 공통메소드
		art.appreciation();
		music.impressed();
		movie.Think();

		// 개별메소드(하위행변환)
//		((Drawing) art).fantasy();
//		((Music) music).Kongdak();
//		((Movie) movie).ajick();
		
		//개별메소드
		art.fantasy();
		music.Kongdak();
		movie.ajick();
		
		
	}

}
