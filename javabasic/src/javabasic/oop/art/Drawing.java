package javabasic.oop.art;

public class Drawing extends AbstractArt {

	Drawing(String name) {
		this.name = name;
	}

	void fantasy() {
		System.out.println(name + "을 보고 공상에 빠지다");
	}
}
