assertEqual 1 1 "Testing if 1 = 1";
assertTrue (1 > 0) "Testing if 1 > 0";
assertFalse (1 < 0) "Testing if 1 < 0";
assertEqual 1 2 "Should be fail";
assertEqual (2+2) 4 "2 + 2 = 4";
assertEqual [[1, 2], [2]] [[], []] "Should be false";
assertTrue (hd [true,false]) "head of a list";

assert 1 2 "lol" (fn (x, y) => x = y);
