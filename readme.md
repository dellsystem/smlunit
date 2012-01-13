smlunit
=======

Unit testing for the SML/NJ implementation of standard ML

Dependencies
------------

* Python 2.7+
* [SML/NJ](http://www.smlnj.org/)
* Not Windows

Usage notes
-----------

### Running the script

Set the `smlunit` file to executable (`chmod +x smlunit`). You can then run it from the command line as follows:

`smlunit hw-tests/hw1.sml`

replacing `hw-tests/hw1.sml` with the desired test.

You can also use the `lib/smlunit.sml` file directory by typing in

`use "lib/smlunit.sml";`

in an interactive session, it's just messier and doesn't provide you with any nice statistics.

Don't move any of the files around unless you know what you're doing. Deleting `tests.sml` is okay because it's pretty useless.

### Writing the tests

See `hw-tests/hw1.sml` for an example test file. The functions you can use are:

	assertEqual actual expected "Description of the test"
	assertRealEqual actual expected "Description of the test"
	assertTrue boolean "Description of the test"
	assertFalse boolean "Description of the test"

Remember to import the file defining the functions you want to test at the top, using `use`. The path should be relative to the root of the git repository (i.e. the directory containing the `smlunit` file). For `hw-tests/hw1.sml`, place the associated `hw1.sml` file in the `hw` directory.

Only use `assertRealEqual` to compare reals. The precision is about 11 decimal points - i.e., it should compare all the decimal points actually visible when you print out the variable. (I'm not completely sure if this works properly. But it seems to.)

Avoid passing parameters of inappropriate types. This is fairly straightforward.

Development notes
-----------------

* Because polymorphic printing is [apparently impossible](http://www.smlnj.org/doc/FAQ/faq.txt), the expected and actual values are printed out as a list. This is silly but it works.
* The lines `use "lib/smlunit.sml"; use "{filename}.sml";` are echoed into the interpreter and the output is then checked and processed by Python. This is also silly but it, too, works.

To do
-----

* Check if it works on the lab machines in Trottier
* Check for and report run-time and compile-time errors
* User-defined datatypes?
* Comparing lists of reals? (Currently not possible)
* Consider actually compiling things instead of this ridiculous echo/piping stuff
* Organising tests into sections or test cases. Like in QUnit?
* Make sure assertRealEqual does what it's supposed to do, and consider changing the name
