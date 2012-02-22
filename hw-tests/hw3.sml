(* Save everything needed for Q1 in hw/hw3-1.sml to test it. Otherwise, weird problems
due to datatype redeclarations etc. The trie datatype and function declarations should
all be in hw/hw3-1.sml. *)
use "hw/hw3-1.sml";


(* Q1.1: insert *)
val t1 = insert ("b", []);

val Node (t1_c, t1_l) = !(hd t1);

assertEqual t1_c #"b"							"first trie - b";
assertEqual (!(hd t1_l)) Empty					"first trie - b, then empty";
assertEqual (tl t1_l) []						"first trie - b, no other children";



val t2 = insert ("be", []);

val Node (t2_c, t2_l) = !(hd t2);
val Node (t2_1_c, t2_1_l) = !(hd t2_l);

assertEqual t2_c #"b"							"second trie - b";
assertEqual t2_1_c #"e"							"second trie - be";
assertEqual (!(hd t2_1_l)) Empty				"second trie - be, then empty";
assertEqual (tl t2_1_l) []						"second trie - be, no other children";



val t3 = insert ("boo", t2);

val Node (t3_c, t3_l) = !(hd t3);
val Node (t3_1_c, t3_1_l) = !(hd t3_l);
val Node (t3_2_c, t3_2_l) = !(hd (tl t3_l));
val Node (t3_2_1_c, t3_2_1_l) = !(hd t3_2_l);

assertEqual t3_c #"b"							"third trie - b";
assertEqual t3_1_c #"e"							"third trie - be";
assertEqual (!(hd t3_1_l)) Empty				"third trie - be, then empty";
assertEqual (tl t3_1_l) []						"third trie - be, no other children";
assertEqual t3_2_c #"o"							"third trie - bo";
assertEqual t3_2_1_c #"o"						"third trie - boo";
assertEqual (!(hd t3_2_1_l)) Empty				"third trie - boo, then empty";
assertEqual (tl t3_2_1_l) []					"third trie - boo, no other children";



val t4 = insert ("boo", t3);

val Node (t4_c, t4_l) = !(hd t4);
val Node (t4_1_c, t4_1_l) = !(hd t4_l);
val Node (t4_2_c, t4_2_l) = !(hd (tl t4_l));
val Node (t4_2_1_c, t4_2_1_l) = !(hd t4_2_l);

assertEqual t4_c #"b"							"fourth trie - b";
assertEqual t4_1_c #"e"							"fourth trie - be";
assertEqual (!(hd t4_1_l)) Empty				"fourth trie - be, then empty";
assertEqual (tl t4_1_l) []						"fourth trie - be, no other children";
assertEqual t4_2_c #"o"							"fourth trie - bo";
assertEqual t4_2_1_c #"o"						"fourth trie - boo";
assertEqual (!(hd t4_2_1_l)) Empty				"fourth trie - boo, then empty";
assertEqual (!(hd (tl t4_2_1_l))) Empty			"fourth trie - boo, then another empty";
assertEqual (tl (tl t4_2_1_l)) []				"fourth trie - boo, no other children";



val t5 = insert ("book", t4);

val Node (t5_c, t5_l) = !(hd t5);
val Node (t5_1_c, t5_1_l) = !(hd t5_l);
val Node (t5_2_c, t5_2_l) = !(hd (tl t5_l));
val Node (t5_2_1_c, t5_2_1_l) = !(hd t5_2_l);
val Node (t5_2_1_3_c, t5_2_1_3_l) = !(hd (tl (tl t5_2_1_l)));

assertEqual t5_c #"b"							"fifth trie - b";
assertEqual t5_1_c #"e"							"fifth trie - be";
assertEqual (!(hd t5_1_l)) Empty				"fifth trie - be, then empty";
assertEqual (tl t5_1_l) []						"fifth trie - be, no other children";
assertEqual t5_2_c #"o"							"fifth trie - bo";
assertEqual t5_2_1_c #"o"						"fifth trie - boo";
assertEqual (!(hd t5_2_1_l)) Empty				"fifth trie - boo, then empty";
assertEqual (!(hd (tl t5_2_1_l))) Empty			"fifth trie - boo, then another empty";
assertEqual t5_2_1_3_c #"k"						"fifth trie - book";
assertEqual (!(hd t5_2_1_3_l)) Empty			"fifth trie - book, then empty";
assertEqual (tl t5_2_1_3_l) []					"fifth trie - book, no other children";



val t6 = insert ("bool", t5);

val Node (t6_c, t6_l) = !(hd t6);
val Node (t6_1_c, t6_1_l) = !(hd t6_l);
val Node (t6_2_c, t6_2_l) = !(List.last t6_l);
val Node (t6_2_1_c, t6_2_1_l) = !(hd t6_2_l);
val Node (t6_2_1_3_c, t6_2_1_3_l) = !(hd (tl (tl t6_2_1_l)));
val Node (t6_2_1_4_c, t6_2_1_4_l) = !(List.last t6_2_1_l);

assertEqual t6_c #"b"							"sixth trie - b";
assertEqual t6_1_c #"e"							"sixth trie - be";
assertEqual (!(hd t6_1_l)) Empty				"sixth trie - be, then empty";
assertEqual (tl t6_1_l) []						"sixth trie - be, no other children";
assertEqual t6_2_c #"o"							"sixth trie - bo";
assertEqual t6_2_1_c #"o"						"sixth trie - boo";
assertEqual (!(hd t6_2_1_l)) Empty				"sixth trie - boo, then empty";
assertEqual (!(hd (tl t6_2_1_l))) Empty			"sixth trie - boo, then another empty";
assertEqual t6_2_1_3_c #"k"						"sixth trie - book";
assertEqual (!(hd t6_2_1_3_l)) Empty			"sixth trie - book, then empty";
assertEqual (tl t6_2_1_3_l) []					"sixth trie - book, no other children";
assertEqual t6_2_1_4_c #"l"						"sixth trie - bool";
assertEqual (!(hd t6_2_1_4_l)) Empty			"sixth trie - bool, then empty";
assertEqual (tl t6_2_1_4_l) []					"sixth trie - bool, no other children";



val t7 = insert ("d", t1);

val Node (t7_1_c, t7_1_l) = !(hd t7);
val Node (t7_2_c, t7_2_l) = !(List.last t7);

assertEqual t7_1_c #"b"							"seventh trie - b";
assertEqual (!(hd t7_1_l)) Empty				"seventh trie - b, then empty";
assertEqual t7_2_c #"d"							"seventh trie - d";
assertEqual (!(List.last t7_2_l)) Empty			"seventh tree - d, then empty";



(* Test case from the hw3.sml file (right above the section for qustion 1.3. Note that the diagram
in the assignment specs itself does NOT correspond to the tree produced by the test case in the code,
despite the fact that it says "For a representation of the tree above using the SML data structure, see
the file provided". The diagram in the PDF is produced by storing the words mentioned in the text next
to the diagram itself, and for whatever reason, these words are not the same nor in the same order as
those used in the test case.

The diagram for the tree produced by the test case in the code looks like this:

                               b
                              / \
                             e   r
                            / \   \
                           e   a   e
                          /|\   \  |\
                         r * f   r a e
                         |  / \  | | |
                         * *   y d d *
                               | | |
                               * * *

where the asterisks mean, of course, "empty". Note the slightly different ordering and the fact
that there is no "bear". *)
val t8 = insert ("beer", []);
val _  = (insert ("bread", t8); insert ("beard", t8); insert ("bee", t8); insert ("beef", t8); insert ("beefy", t8); insert ("bree", t8));

val Node (t8_c, t8_l) = !(hd t8);
val Node (t8_1_c, t8_1_l) = !(hd t8_l);
val Node (t8_1_1_c, t8_1_1_l) = !(hd t8_1_l);
val Node (t8_1_1_1_c, t8_1_1_1_l) = !(hd t8_1_1_l);
val Node (t8_1_1_3_c, t8_1_1_3_l) = !(List.last t8_1_1_l);
val Node (t8_1_1_3_2_c, t8_1_1_3_2_l) = !(List.last t8_1_1_3_l);
val Node (t8_1_2_c, t8_1_2_l) = !(List.last t8_1_l);
val Node (t8_1_2_1_c, t8_1_2_1_l) = !(hd t8_1_2_l);
val Node (t8_1_2_1_1_c, t8_1_2_1_1_l) = !(hd t8_1_2_1_l);
val Node (t8_2_c, t8_2_l) = !(List.last t8_l);
val Node (t8_2_1_c, t8_2_1_l) = !(hd t8_2_l);
val Node (t8_2_1_1_c, t8_2_1_1_l) = !(hd t8_2_1_l);
val Node (t8_2_1_1_1_c, t8_2_1_1_1_l) = !(hd t8_2_1_1_l);
val Node (t8_2_1_2_c, t8_2_1_2_l) = !(List.last t8_2_1_l);

assertEqual t8_c #"b"							"eighth tree - b";
assertEqual t8_1_c #"e"							"eighth tree - be";
assertEqual t8_1_1_c #"e"						"eighth tree - bee";
assertEqual t8_1_1_1_c #"r"						"eighth tree - beer";
assertEqual (!(hd t8_1_1_1_l)) Empty			"eighth tree - beer, then empty";
assertEqual (!(hd (tl t8_1_1_l))) Empty			"eighth tree - bee, then empty";
assertEqual t8_1_1_3_c #"f"						"eighth tree - beef";
assertEqual (!(hd t8_1_1_3_l)) Empty			"eighth tree - beef, then empty";
assertEqual t8_1_1_3_2_c #"y"					"eighth tree - beefy";
assertEqual (!(hd t8_1_1_3_2_l)) Empty			"eighth tree - beefy, then empty";
assertEqual t8_1_2_c #"a"						"eighth tree - bea";
assertEqual t8_1_2_1_c #"r"						"eighth tree - bear";
assertEqual t8_1_2_1_1_c #"d"					"eighth tree - beard";
assertEqual (!(hd t8_1_2_1_1_l)) Empty			"eighth tree - beard, then empty";
assertEqual t8_2_c #"r"							"eighth tree - br";
assertEqual t8_2_1_c #"e"						"eighth tree - bre";
assertEqual t8_2_1_1_c #"a"						"eighth tree - brea";
assertEqual t8_2_1_1_1_c #"d"					"eighth tree - bread";
assertEqual (!(hd t8_2_1_1_1_l)) Empty			"eighth tree - bread, then empty";
assertEqual t8_2_1_2_c #"e"						"eighth tree - bree";
assertEqual (!(hd t8_2_1_2_l)) Empty			"eighth tree - bree, then empty";



(* Q1.2: all_words*)

assertEqual (all_entries t1) ["b"]
assertEqual (all_entries t2) ["be","boo","boo","book","bool"]
assertEqual (all_entries t3) ["be","boo","boo","book","bool"]
assertEqual (all_entries t4) ["be","boo","boo","book","bool"]
assertEqual (all_entries t5) ["be","boo","boo","book","bool"]
assertEqual (all_entries t6) ["be","boo","boo","book","bool"]
assertEqual (all_entries t7) ["b","d"]
assertEqual (all_entries t8) ["beer","bee","beef","beefy","beard","bread","bree"]



