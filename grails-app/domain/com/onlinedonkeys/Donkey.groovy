package com.onlinedonkeys

class Donkey {
	
	String name
	String color
	String kickPower
	String temper
	String intelligence
	Date dob
	

    static constraints = {
		name()
		dob(nullable : true)
		temper()
		intelligence(nullable : true)
		color()
		kickPower(nullable : true)
    }
}
