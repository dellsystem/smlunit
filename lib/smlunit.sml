(* To stop the polyEqual warnings as using polymorphic equality is intentional *)
Control.polyEqWarn := false;

fun roundish (x:real) = Real.realRound(x * 100000000000.0) / 100000000000.0;

fun assert expr1 expr2 (desc:string) function =
	(print ("*********** " ^ desc ^ " ***********\n" );
	(if function (expr1, expr2) then
		print "OK\n"
	else
		print "FAIL\n"
	);
	[expr1, expr2]);

fun assertEqual expr1 expr2 (desc:string) = assert expr1 expr2 desc (fn (x, y) => x = y);
fun assertRealEqual (expr1:real) (expr2:real) (desc:string) = assert expr1 expr2 desc (fn (x, y) => Real.== (roundish(x), roundish(y)));

fun assertTrue expr desc = (assertEqual expr true desc);
fun assertFalse expr desc = (assertEqual expr false desc);

(* Functions for comparing a lot of things in one list *)
fun assertReals f [] (desc:string) = []
	| assertReals f ((input, output, expl)::t) (desc:string) =
	(assertRealEqual (f input) output (desc ^ ": " ^ expl)) @ (assertReals f t (desc));

fun assertRegulars f [] (desc:string) = []
	| assertRegulars f ((input, output, expl)::t) (desc:string) =
	(assertEqual (f input) output (desc ^ ": " ^ expl)) @ (assertRegulars f t (desc));
