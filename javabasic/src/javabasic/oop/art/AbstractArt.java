package javabasic.oop.art;

public abstract class AbstractArt implements IArt {

	String name;

	@Override
	public void appreciation() {
		System.out.println(name + " 감상하다");
	}

	@Override
	public void impressed() {
		System.out.println(name + " 보러간다");

	}

	@Override
	public void Think() {
		System.out.println(name + " 생각하다");

	}

}
