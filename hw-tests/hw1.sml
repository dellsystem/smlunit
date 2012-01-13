use "hw/hw1.sml";

(* average *)
assertRealEqual (average [1, 5, 2, 7]) 3.75 				"average test 1";
assertRealEqual (average [13, 25, 22, 27]) 21.75 			"average test 2";
assertRealEqual (average []) 0.0 							"average of the empty list";
assertRealEqual (average [100, 100]) 100.0					"average of two equal numbers";
assertRealEqual (average [~2, 2]) 0.0						"average including a negative number";
assertRealEqual (average [~5, ~6, ~7]) ~6.0					"average all negative numbers";

(* standard deviation *)
assertRealEqual (stDev [1, 5, 2, 7]) 2.38484800354			"stDev test 1";
assertRealEqual (stDev [13, 25, 22, 27]) 5.35607132141 		"stDev test 2";
assertRealEqual (stDev []) 0.0								"stDev empty list";
assertRealEqual (stDev [100, 100]) 0.0						"stDev uniform list";
assertRealEqual (stDev [~2, 2]) 2.0							"stDev including a negative number";
assertRealEqual (stDev [~5, ~6, ~7]) 0.816496580928			"stDev all negative numbers";

(* partial sums *)
assertEqual (psum [1, 1, 1, 1, 1]) [1, 2, 3, 4, 5]			"psum test 1";
assertEqual (psum [1, 2, 3, 4]) [1, 3, 6, 10]				"psum test 2";
assertEqual (psum []) []									"psum empty";
assertEqual (psum [9]) [9]									"psum singleton";
assertEqual (psum [~2, 2]) [~2, 0]							"psum including a negative number";
assertEqual (psum [~5, ~6, ~7]) [~5, ~11, ~18]				"psum all negative numbers";
