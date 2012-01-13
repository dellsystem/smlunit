(* No generic polymorphic print function possible, but this approximates it *)
(* See http://www.smlnj.org/doc/FAQ/faq.txt and http://stackoverflow.com/questions/3713948/sml-how-to-check-variable-type *)
(* datatype wrapper = Int of int | Real of real | String of string | Bool of bool; *)

(* To stop the polyEqual warnings as using polymorphic equality is intentional *)
Control.polyEqWarn := false;

fun roundish (x:real) = Real.realRound(x * 100000000000.0) / 100000000000.0;

fun assert expr1 expr2 (desc:string) function =
	(print ("*********** " ^ desc ^ " ***********\n" );
	(if function (expr1, expr2) then
		(print "OK\n";
		[])
	else
		(print "FAIL\n";
		[expr1, expr2]
		)
	));

fun assertEqual expr1 expr2 (desc:string) = assert expr1 expr2 desc (fn (x, y) => x = y);
fun assertRealEqual (expr1:real) (expr2:real) (desc:string) = assert expr1 expr2 desc (fn (x, y) => Real.== (roundish(x), roundish(y)));

fun assertTrue expr desc = (assertEqual expr true desc);
fun assertFalse expr desc = (assertEqual expr false desc);
