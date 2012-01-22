use "hw/hw1.sml";

(* Q1.1: average *)
assertReals average [
	([1, 5, 2, 7], 3.75, "test 1"),
	([13, 25, 22, 27], 21.75, "test 2"),
	([], 0.0, "empty list"),
	([100, 100], 100.0, "two equal numbers"),
	([~2, 2], 0.0, "additive inverses"),
	([~5, ~6, ~7], ~6.0, "all negative numbers")
]															"average";

(* Q1.2: stDev *)
assertReals stDev [
	([1, 5, 2, 7], 2.38484800354, "test 1"),
	([13, 25, 22, 27], 5.35607132141, "test 2"),
	([], 0.0, "empty list"),
	([100, 100], 0.0, "uniform list"),
	([~2, 2], 2.0, "2 and -2"),
	([~5, ~6, ~7], 0.816496580928, "all negative numbers")
]															"stDev (standard deviation)";

(* Q2: psum *)
assertRegulars psum [
	([1, 1, 1, 1, 1], [1, 2, 3, 4, 5], "test 1"),
	([1, 2, 3, 4], [1, 3, 6, 10], "test 2"),
	([], [], "empty"),
	([9], [9], "singleton"),
	([~2, 2], [~2, 0], "one negative number"),
	([~5, ~6, ~7], [~5, ~11, ~18], "all negative numbers")
]															"psum (partial sum I think)";

(* Q3.1: balanced *)
let
	val t1 = Node ((7,"a"), Node ((3,"b"), Empty, Empty), Node ((9,"c"), Empty, Empty));
	val t2 = Node ((3, "lol"), Node ((2, "lol2"), Empty, Empty), Empty);
	val t3 = Node ((2, "f"), Empty, t1);
	val t4 = Node ((3, "lol"), Empty, Empty)
in
	(
	assertTrue (balanced Empty)								"An empty tree";
	assertTrue (balanced t1)								"A balanced tree";
	assertTrue (balanced t2)								"A balanced tree (diff of 1)";
	assertFalse (balanced t3)								"An unbalanced tree";
	assertTrue (balanced t4)								"A balanced tree (only one node)"
	)
end;

(* Q3.2, first part: rotLeft, rotLeftRight, rotRight, rotRightLeft *)
let
	val t1 = Node((5, "a"), Node((1, "b"), Node((4, "lol"), Empty, Empty), Empty), Empty);
	val t1_correct = Node((1, "b"), Node((4, "lol"), Empty, Empty), Node((5, "a"), Empty, Empty));
	val t2 = Node((5, "ash"), Node((3, "lol"), Empty, Node((4, "z"), Empty, Empty)), Empty);
	val t2_correct = Node((4, "z"), Node((3, "lol"), Empty, Empty), Node((5, "ash"), Empty, Empty));
	val t3 = Node((6, "mudkip"), Empty, Node((8, "oak"), Node((7, "boo"), Empty, Empty), Node((9, "9"), Empty, Empty)));
	val t3_correct = Node((8, "oak"), Node((6, "mudkip"), Empty, Node((7, "boo"), Empty, Empty)), Node((9, "9"), Empty, Empty));
	val t4 = Node((6, "atari"), Node((4, "pong"), Empty, Empty), Node((9, "c++"), Node((7, "et"), Empty, Node((8, "orange"), Empty, Empty)), Node((10, "truck"), Empty, Empty)));
	val t4_correct = Node((7, "et"), Node((6, "atari"), Node((4, "pong"), Empty, Empty), Empty), Node((9, "c++"), Node((8, "orange"), Empty, Empty), Node((10, "truck"), Empty, Empty)))
in
	assertEqual (rotLeft t1) t1_correct						"rotLeft (left rotation)";
	assertEqual (rotLeftRight t2) t2_correct				"rotLeftRight (left-right rotation)";
	assertEqual (rotRight t3) t3_correct					"rotRight (right rotation)";
	assertEqual (rotRightLeft t4) t4_correct				"rotRightLeft (right-left rotation)";
	(* Q3.2, second part: rebalance *)
	assertRegulars rebalance [
		(t1, t1_correct, "with rotLeft"),
		(t2, t2_correct, "with rotLeftRight"),
		(t3, t3_correct, "with rotRight"),
		(t4, t4_correct, "with rotRightLeft")
	]														"rebalance"
end;

(* Q3.3: insert *)
let
	val t1 = Node((3, "foo"), Empty, Empty);
	val t2 = Node((3, "foo"), Node((2, "soo"), Empty, Empty), Empty);
	val t3 = Node((2, "soo"), Node((1, "too"), Empty, Empty), Node((3, "foo"), Empty, Empty));
	val t4 = Node((2, "soo"), Node((1, "too"), Empty, Empty), Node((3, "foo"), Empty, Node((9, "sob"), Empty, Empty)));
	val t5 = Node((2, "soo"), Node((1, "too"), Empty, Empty), Node((5, "bob"), Node((3, "foo"), Empty, Empty), Node((9, "sob"), Empty, Empty)));
	val t6 = Node((5, "bob"), Node((2, "soo"), Node((1, "too"), Empty, Empty), Node((3, "foo"), Empty, Empty)), Node((9, "sob"), Node((6, "top"), Empty, Empty), Empty));
	val t7 = Node((5, "bob"), Node((2, "soo"), Node((1, "too"), Empty, Empty), Node((3, "foo"), Empty, Empty)), Node((7, "beeb"), Node((6, "top"), Empty, Empty), Node((9, "sob"), Empty, Empty)));
	val t8 = Node((5, "bob"), Node((2, "soo"), Node((1, "too"), Empty, Empty), Node((3, "foo"), Empty, Empty)), Node((7, "beeb"), Node((6, "top"), Empty, Empty), Node((9, "sob"), Empty, Node((11, "biib"), Empty, Empty))))
in
	assertRegulars insert [
		(((3, "foo"), Empty), t1, "with an empty tree"),
		(((2, "soo"), t1), t2, "with a non-empty tree"),
		(((1, "too"), t2), t3, "more"),
		(((9, "sob"), t3), t4, "greater key"),
		(((5, "bob"), t4), t5, "greater than the root but not the greatest"),
		(((6, "top"), t5), t6, "same as above pretty much"),
		(((7, "beeb"), t6), t7, "again"),
		(((11, "biib"), t7), t8, "to the very right of a full balanced tree")
	] "insert"
end;
