# Log 01 - Making ViSMA 'classy'

I came across [AerospaceResearch.net](https://aerospaceresearch.net) when browsing through GSoC organizations. It offered projects both in my field of interests and academic domain. I had to make a hard choice between **DirectDemod** and **VisMa** and I finally chose **VisMa** as my project for GSoC.

![visma-banner](assets/banner.jpg)

This is my first GSoC dev log (more to come). Here I will be logging about what I learned, what I have done and what I will do. So following is the work I have done in VisMa. This log covers on what I have done in week#01-02.

## Done so far

I used the community bonding period to fix minor errors and get more familiar with the source. I restructured the code base so that new modules could be accommodated. Code duplication was reduced using proper imports between modules. New modules like calculus, transform, solvers, gui etc were initialized. A token IDing module was written to handle equations during calculus operations.

Till now VisMa processed input equations into 'tokens' which were formatted in the form of python dictionaries. Erm?! Tokens? Check [this](https://aerospaceresearch.net/?p=431) out.
The main aim during this two week period was to convert all the dictionaries to class-objects i.e. to follow the object-oriented style. Classes for the following function types were created:

- trigonometric
- hyperbolic
- exponential
- variable
- constant

While making these, class methods like 'differentiate' and 'inverse' were added to these function classes.

While everything worked perfectly with objects, the steps animator didn't comply. The animator used JSON serializer which would use only strings/dictionary format. Although the object properties could be converted to dictionary format, it would defeat the main purpose. So I decided to use TeX to render equations. The step animator was remolded to render the equations in TeX format using matplotlib's renderer.

An equation plotter was built with the help of matplotlib. The plotter supports plotting equations in one and two variables. While working on the GUI I learned a lot about PyQT4, a GUI library for python. I have updated the GUI so that the plotter and step-animator are embedded in the main window itself. Here is the new GUI in action.

![visma-demo](demos/01.gif)

## What I will be doing next

The above example is one of the test cases of the input equations. The animator and plotter have to be fixed to run all cases. Adding animations to the animator is one of the things. I will try to add support for a 3d graph as well(for equations in three variables).

The next thing to do will be integrating the token IDing module. The rules of calculus will be based on this IDing module. The code can be optimized by converting some functions to class methods. Also, some work relating to equation solvers will be initiated.

From now on I will be updating the log on a fortnightly basis (read on [AerospaceResearch.net](https://aerospaceresearch.net/?p=691)). The project progress can be viewed here. Link to next log. BTW I added a new VisMa logo.

<p align="center"><b>VisMa, now classy and sassy !!</b>

