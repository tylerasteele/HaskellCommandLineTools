# Functional Programming Midterm

For this midterm, you will be implementing a number of common command line
utilities as Haskell programs. Look in the `midterm.cabal` file for the list of
programs you will be writing. They are listed in order of increasingly
complexity, so it is recommended to implement the programs in the order they are
listed. Start with `echo`, then `cat`, then `head`, etc.

## Grading

This repository has a number of automated tests that will run every time you
push your code. Each test has a number of points associated with it. Passing all
tests will result in a grade of 100%.

Important to note that we are **not implementing all of the features** included
in the actual versions of these tools. We are not handling any flags, and we are
not taking any data directly from standard input besides file names/urls. Look
at what the tests are testing, and implement the tools based on that
specification. We will also spend some time in class covering how each of these
tools should function.

You can push your code to run the tests and check your grade as many times as
you want before the assignment deadline. At the deadline, your repository will
be frozen and graded as is.

You can test your code locally by running the exact commands ran in the tests
(found in the `.github/classroom/autograding.json` file).

## Rules

This midterm is a solo programming project. By solo, I mean you must limit your
collaboration with others taking this midterm to discussion only. Do not review
or compare each others' code under any circumstances without the instructor's
permission. Do not publish the code you write anywhere besides this private
repository until the assignment deadline has passed.

Other than those restricted by the guidelines above, you are free to use any
resource at all. The instructor, internet, textbooks, open-source repositories,
etc. are all fair game and you are encouraged to use them.

In completing this assignment, you should only edit the `Main.hs` files included
in each of the directories. Everything else should remain unchanged.
