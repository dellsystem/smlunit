assertEqual 1 1 "Should be OK";
assertTrue (1 > 0) "Should be OK";
assertFalse (1 < 0) "Should be OK";
assertEqual 1 2 "Should FAIL";
assertEqual (2+2) 4 "Should be OK";
assertEqual [[1, 2], [2]] [[], []] "Should FAIL";
assertTrue (hd [true,false]) "Should be OK";
assertRealEqual 123456.7890 123456.789 "Should be OK";
assertRealEqual 123456.7890 123456.7891 "Should FAIL";
assertEqual "actual" "expected" "Should FAIL";
fun addTwo x = x + 2;
assertRegulars addTwo [
	(1, 3,		"Should be OK"),
	(2, 4,		"Should be OK"),
	(0, 5,		"Should FAIL")
]								"assertRegulars";
fun addTwoReal (x:real) = x + 2.0;
assertReals addTwoReal [
	(1.0, 3.0,	"1.0 + 2.0 = 3.0"),
	(2.0, 4.0,	"2.0 + 2.0 = 4.0")
]								"Should be OK (assertReals)";
