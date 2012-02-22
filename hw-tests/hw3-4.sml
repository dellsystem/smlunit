use "hw/hw3-4.sml";
(* converts a finite stream to list, to test) *)
fun viewStream s = case force s of 	Empty 		=> nil |
									Cons(l,s) 	=> [l]@(viewStream s)


(* Q4.1 interleave *)
val nilList = viewStream (interleave 10 []);
val normalList = viewStream (interleave 10 [1,2,3]);

assertEqual nilList [[10]] 			"zero length list";
assertEqual normalList [[10,1,2,3],[1,10,2,3],[1,2,10,3],[1,2,3,10]] "normal list";

(* Q4.2 flattenS *)
val stream_of_streams = cons(interleave 10 [1, 2, 3], cons((interleave 9 [4,5,6]), empty));
val expected = [[10,1,2,3],[1,10,2,3],[1,2,10,3],[1,2,3,10],[9,4,5,6],[4,9,5,6],[4,5,9,6],[4,5,6,9]];
assertEqual (viewStream (flattenS stream_of_streams)) expected 		 "flattenS (uses interleave)";

(* Q4.3 permute *)

val l = viewStream(permute [1,2,3]);
val onelength = viewStream(permute [1]);
assertEqual l [[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]] "liiiist";
assertEqual onelength [[1]]	
