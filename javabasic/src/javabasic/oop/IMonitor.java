package javabasic.oop;

public interface IMonitor {		
	// 추상클래스
	
	public static final int INCH_TWENTY_FOUR = 24;
	public static final int INCH_THIRTY = 30;
	public static final int INCH_FOURTY = 40;
	
	public abstract void powerOn(); // 메소드 시그니쳐
	public abstract void powerOff(); // 메소드 시그니쳐
	public abstract void brightUp(); // 메소드 시그니쳐
	public abstract void brightDown(); // 메소드 시그니쳐
	
	
	

}
