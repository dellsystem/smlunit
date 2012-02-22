(* Save everything needed for Q1 in hw/hw3-1.sml to test it. Otherwise, weird problems
due to datatype redeclarations etc. The trie datatype and function declarations should
all be in hw/hw3-1.sml. *)
use "hw/hw3-1.sml";

(* Q1.1: insert *)
val t1 = insert ("b", []);
val t2 = insert ("be", []);
val t3 = insert ("boo", t2);
val t4 = insert ("boo", t3);
val t5 = insert ("book", t4);
val t6 = insert ("bool", t5);
val t7 = insert ("d", t1);

val Node (t1_c, t1_l) = !(hd t1);

val Node (t2_c, t2_l) = !(hd t2);
val Node (t2_1_c, t2_1_l) = !(hd t2_l);

val Node (t3_c, t3_l) = !(hd t3);
val Node (t3_1_c, t3_1_l) = !(hd t3_l);
val Node (t3_2_c, t3_2_l) = !(hd (tl t3_l));
val Node (t3_2_1_c, t3_2_1_l) = !(hd t3_2_l);

val Node (t4_c, t4_l) = !(hd t4);
val Node (t4_1_c, t4_1_l) = !(hd t4_l);
val Node (t4_2_c, t4_2_l) = !(hd (tl t4_l));
val Node (t4_2_1_c, t4_2_1_l) = !(hd t4_2_l);

val Node (t5_c, t5_l) = !(hd t5);
val Node (t5_1_c, t5_1_l) = !(hd t5_l);
val Node (t5_2_c, t5_2_l) = !(hd (tl t5_l));
val Node (t5_2_1_c, t5_2_1_l) = !(hd t5_2_l);
val Node (t5_2_1_3_c, t5_2_1_3_l) = !(hd (tl (tl t5_2_1_l)));

val Node (t6_c, t6_l) = !(hd t6);
val Node (t6_1_c, t6_1_l) = !(hd t6_l);
val Node (t6_2_c, t6_2_l) = !(List.last t6_l);
val Node (t6_2_1_c, t6_2_1_l) = !(hd t6_2_l);
val Node (t6_2_1_3_c, t6_2_1_3_l) = !(hd (tl (tl t6_2_1_l)));
val Node (t6_2_1_4_c, t6_2_1_4_l) = !(List.last t6_2_1_l);

val Node (t7_1_c, t7_1_l) = !(hd t7);
val Node (t7_2_c, t7_2_l) = !(List.last t7);

assertEqual t1_c #"b"							"first trie - b";
assertEqual (!(hd t1_l)) Empty					"first trie - b empty child";
assertEqual (tl t1_l) []						"first trie - no other children";

assertEqual t2_c #"b"							"second trie - b";
assertEqual t2_1_c #"e"							"second trie - b child e";
assertEqual (!(hd t2_1_l)) Empty				"second trie - b child e empty child";
assertEqual (tl t2_1_l) []						"second trie - b child e no other children";

assertEqual t3_c #"b"							"third trie - b";
assertEqual t3_1_c #"e"							"third trie - b child e";
assertEqual (!(hd t3_1_l)) Empty				"third trie - b child e empty child";
assertEqual (tl t3_1_l) []						"third trie - b child e no other children";
assertEqual t3_2_c #"o"							"third trie - b child o";
assertEqual t3_2_1_c #"o"						"third trie - b child o child o";
assertEqual (!(hd t3_2_1_l)) Empty				"third trie - b child o child o empty child";
assertEqual (tl t3_2_1_l) []					"third trie - b child o child o no other children";

assertEqual t4_c #"b"							"fourth trie - b";
assertEqual t4_1_c #"e"							"fourth trie - b child e";
assertEqual (!(hd t4_1_l)) Empty				"fourth trie - b child e empty child";
assertEqual (tl t4_1_l) []						"fourth trie - b child e no other children";
assertEqual t4_2_c #"o"							"fourth trie - b child o";
assertEqual t4_2_1_c #"o"						"fourth trie - b child o child o";
assertEqual (!(hd t4_2_1_l)) Empty				"fourth trie - b child o child o empty child";
val test = t4_2_1_l;
assertEqual (!(hd (tl t4_2_1_l))) Empty			"fourth trie - b child o child o another empty child";
assertEqual (tl (tl t4_2_1_l)) []				"fourth trie - b child o child o no other children";

assertEqual t5_c #"b"							"fifth trie - b";
assertEqual t5_1_c #"e"							"fifth trie - b child e";
assertEqual (!(hd t5_1_l)) Empty				"fifth trie - b child e empty child";
assertEqual (tl t5_1_l) []						"fifth trie - b child e no other children";
assertEqual t5_2_c #"o"							"fifth trie - b child o";
assertEqual t5_2_1_c #"o"						"fifth trie - b child o child o";
assertEqual (!(hd t5_2_1_l)) Empty				"fifth trie - b child o child o empty child";
assertEqual (!(hd (tl t5_2_1_l))) Empty			"fifth trie - b child o child o another empty child";
assertEqual t5_2_1_3_c #"k"						"fifth trie - b child o child o child k";
assertEqual (!(hd t5_2_1_3_l)) Empty			"fifth trie - b child o child o child k empty child";
assertEqual (tl t5_2_1_3_l) []					"fifth trie - b child o child o child k no other children";

assertEqual t6_c #"b"							"sixth trie - b";
assertEqual t6_1_c #"e"							"sixth trie - b child e";
assertEqual (!(hd t6_1_l)) Empty				"sixth trie - b child e empty child";
assertEqual (tl t6_1_l) []						"sixth trie - b child e no other children";
assertEqual t6_2_c #"o"							"sixth trie - b child o";
assertEqual t6_2_1_c #"o"						"sixth trie - b child o child o";
assertEqual (!(hd t6_2_1_l)) Empty				"sixth trie - b child o child o empty child";
assertEqual (!(hd (tl t6_2_1_l))) Empty			"sixth trie - b child o child o another empty child";
assertEqual t6_2_1_3_c #"k"						"sixth trie - b child o child o child k";
assertEqual (!(hd t6_2_1_3_l)) Empty			"sixth trie - b child o child o child k empty child";
assertEqual (tl t6_2_1_3_l) []					"sixth trie - b child o child o child k no other children";
assertEqual t6_2_1_4_c #"l"						"sixth trie - b child o child o child l";
assertEqual (!(hd t6_2_1_4_l)) Empty			"sixth trie - b child o child o child l empty child";
assertEqual (tl t6_2_1_4_l) []					"sixth trie - b child o child o child l no other children";

assertEqual t7_1_c #"b"							"seventh trie - b";
assertEqual (!(hd t7_1_l)) Empty				"seventh trie - b empty child";
assertEqual t7_2_c #"d"							"seventh trie - d";
assertEqual (!(List.last t7_2_l)) Empty			"seventh tree - d empty child";
