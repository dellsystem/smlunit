use "hw/hw2.sml";

(* Q3.1: zipWith *)
(* Can't use assertRegulars because that can only take one argument *)
assertEqual (zipWith (fn (x, y) => x + y) [1,2,3,4] [10,20,30,40]) [11, 22, 33, 44] "zipWith - sum";
assertEqual (zipWith (fn (x, y) => x ^ y) ["a1", "a2", "a3"] ["b1", "b2", "b3"]) ["a1b1", "a2b2", "a3b3"] "zipWith - concat";
assertEqual (zipWith (fn (x, y) => x + y) [] []) [] "zipWith - empty";
assertEqual (zipWith (fn (x, y) => 0) [1, 2, 3] [2, 3, 4]) [0, 0, 0] "zipWith - constant function";
assertEqual (zipWith (fn (x, y) => x + 5) [1, 2, 3] [2, 3, 4]) [6, 7, 8] "zipWith - linear function";
assertEqual (zipWith (fn (x, y) => x - y) [1, 2, 3] [0, 1]) [1, 1] "zipWith - unequal lengths";

(* Q3.2: ziprev *)
assertEqual (ziprev [1,2,3,4] [10,20,30,40]) [(1,40),(2,30),(3,20),(4,10)] "ziprev - sum";
assertEqual (ziprev ["a", "b", "c"] [4, 3, 2, 1]) [("a", 1), ("b", 2), ("c", 3)] "ziprev - unequal";


(* Q4.1 and 4.2 create and AlonzoToInt *)
val zero = create 0:int numeral;
val one = create 1:int numeral;
val cZero = Num (fn s => fn x => x):int numeral;
val cOne = Num (fn s => fn x => s(x)):int numeral;
val ninethousand = create 9000:int numeral;
assertEqual (AlonzoToInt(zero)) 0 "AlonzoToInt and create - zero";
assertEqual (AlonzoToInt(one)) 1 "AlonzoToInt and create - one";
assertEqual (AlonzoToInt(ninethousand)) 9000 "AlonzoToInt and create - large number";
assertEqual (AlonzoToInt(cZero)) 0 "AlonzoToInt with literal 0";
assertEqual (AlonzoToInt(cOne)) 1 "AlonzoToInt with literal 1";
(* Q4.3 SUC *)
assertEqual (AlonzoToInt(SUC(zero))) 1 "successor of zero";
assertEqual (AlonzoToInt(SUC(one))) 2 "successor of one";
assertEqual (AlonzoToInt(SUC(ninethousand))) 9001 "successor of a large number";
assertEqual (AlonzoToInt(SUC(SUC(SUC(ninethousand))))) 9003 "chaining successor of a large number";
(* ADD *)
assertEqual (AlonzoToInt(ADD(create 0, create 5))) 5 "zero and non zero";
assertEqual (AlonzoToInt(ADD(create 0, create 0))) 0 "zero and zero";
assertEqual (AlonzoToInt(ADD(create 4500, create 4501))) 9001 "non zero and non zero";
(* MULT *)
assertEqual (AlonzoToInt(MULT(create 5, create 11))) 55 "non zero and non zero";
assertEqual (AlonzoToInt(MULT(create 0, create 11))) 0 "zero and non zero";
assertEqual (AlonzoToInt(MULT(create 0, create 0))) 0 "zero and zero";