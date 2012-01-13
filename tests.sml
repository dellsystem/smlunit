assertEqual 1 1 "Should be OK";
assertTrue (1 > 0) "Should be OK";
assertFalse (1 < 0) "Should be OK";
assertEqual 1 2 "Should FAIL";
assertEqual (2+2) 4 "Should be OK";
assertEqual [[1, 2], [2]] [[], []] "Should FAIL";
assertTrue (hd [true,false]) "Should be OK";
