# Log 04 - Develop, Test, Repeat

This is GSoC log-04 (view log-03 [here](log-03). Here I will cover on what I have done in week 08-09 and a gist of what has been accomplished in Phase II coding period and what is to be done in the final coding period.

![visma-banner](banner.jpg)

## Done so far

- Added tests using pytest
- Code coverage using coverage.py through pytest
- Added variable substitution methods
- Created an equation solver in multi-variables
- Initialized work on matrices
- Ported source to Python3 and using PyQt5

Variable substitution and matrices will be used to solve multiple equations at once. The matrices will be used for solving multiple linear equations. The variable substitution will be used to solve the rest of the equation types.

Almost all test cases have been added to the tests module. Tests have been integrated to Travis CI. So any new commit/pull request by anyone will go through all test cases' check.
Checking code-coverage through tests has helped me to see clearly which parts of the code are unused. View [code-coverage](https://coveralls.io/github/8hantanu/visma).

Below is an example dump generated after running tests through pytest.

```bash
$ pytest
=============================== test session starts ================================
platform linux2 -- Python 3.6.5, pytest-3.5.1, py-1.5.3, pluggy-0.6.0
rootdir: /Projects/GitHub/visma, inifile: setup.cfg
plugins: pylama-7.4.3
collected 25 items

tests/test_calculus.py ..                                                    [  8%]
tests/test_functions.py ..                                                   [ 16%]
tests/test_io.py ....                                                        [ 32%]
tests/test_matrix.py .......                                                 [ 60%]
tests/test_simplify.py ...                                                   [ 72%]
tests/test_solvers.py ..                                                     [ 80%]
tests/test_transform.py ..                                                   [ 88%]
tests/test_utils.py ...                                                      [100%]

============================ 25 passed in 0.93 seconds =============================
```

## Phase - 2 deliverables

- **Modules created**
  - **Solver** - An equation solver
  - **Tests** - Added tests for all modules
  - **Matrix** - Support for functions in matrix
  - **Utils** - Simple universal methods
- **Enhancements**
  - Ported code base to python3 from python2
  - Moved to PyQt5 from PyQt4

## What I will be doing next

Most of the time of final period will be spent on working on the missing test cases and integrating the different kinds of solvers and matrices with the GUI. Also, calculus functionalities will be enhanced and support for more functions will be added.

GUI will be enhanced. Logger will be added and plotter will be modified to support equations in multiple variables. Here is a sneak peek of the dynamic simplifier I am working on.

![visma-demo4](demos/log-04.gif)

Link to [project source](https://github.com/aerospaceresearch/visma "visma") and [to-do board](https://github.com/aerospaceresearch/visma/projects/1 "Project Progress").

