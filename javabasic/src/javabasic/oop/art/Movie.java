package javabasic.oop.art;

public class Movie extends AbstractArt {
	Movie(String name) {
		this.name = name;
	}

	void ajick() {
		System.out.println(name + " 아직 안봤다");
		
	}
	
}