use "hw/hw3-2.sml";

(* Q2: collect *)
(* doesn't check if you're implementing it with exceptions, just that you do it correctly *)
val evens = fn x => (x mod 2) = 0
val odds = fn x => (x mod 2) = 1
val two = fn x => x = 2
val smallerThanTen = fn x => x < 10

val L = Node (Node (Empty, 2, Empty), 5, Node (Empty, 6, Empty));
val R = Node (Empty, 12, Empty);
val T = Node (Node (L, 7, Node (Empty, 8, Empty)), 11, R);

assertEqual (collect(evens,T)) [2,6,8,12]				"evens";
assertEqual (collect(odds,T)) [5,7,11]					"odds";
assertEqual (collect(two,T)) [2]						"a single element";
assertEqual (collect(smallerThanTen,T)) [2,5,6,7,8]		"a subsection";
