use "hw/hw3.4.sml";
(* converts a finite stream to list, to test) *)
fun viewStream s = case force s of 	Empty 		=> nil |
									Cons(l,s) 	=> [l]@(viewStream s)
									
									
(* Q4.1 interleave *)
val nilList = viewStream (interleave 10 []);
val normalList = viewStream (interleave 10 [1,2,3]);

assertEqual nilList [[10]] 			"zero length list";
assertEqual normalList [[10,1,2,3],[1,10,2,3],[1,2,10,3],[1,2,3,10]] "normal list";

(* Q4.2 flattenS, this must work in order for permute to work *)

(* Q4.3 permute *)

val l = viewStream(permute [1,2,3]);
val onelength = viewStream(permute [1]);
assertEqual l [[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]] "liiiist";
assertEqual onelength [[1]]										"one length";