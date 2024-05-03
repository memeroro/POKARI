package javabasic.oop;

public class IMonitorMain {
	// 추상클래스
	public static void main(String[] args) {
		
		IMonitor imonitor = new IMonitorImpl();
		imonitor.powerOn();
		imonitor.powerOff();
		imonitor.brightDown();
		imonitor.brightUp();
		
		
		
	}

}
