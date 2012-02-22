use "hw/hw3.3.sml";

assertEqual (mon_fact(0)) (1,2)		"zero";
assertEqual (mon_fact(1)) (1,8)		"one";
assertEqual (mon_fact(5)) (120,32)	"bigger number";
assertEqual (mon_fact(6)) (720,38)	"another bigger number";