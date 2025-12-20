# log 06 - packing up

This is GSoC'18 log 06. Here I will cover on what I have done in week 12-13. Link to the [previous log](log-05). The work in these two weeks involved packaging and documenting the code.

![visma-banner](assets/banner.jpg)

## done so far

Deciding which packaging style to choose was a difficult task. Though there were a number of options available for packaging python apps I couldn't find one which makes it simple for packaging it for windows. I managed to convert the source into a single executable file using **pyinstaller** but the performance was compromised.

Finally I went with **PyPI**. A simple _setup.py_ was created which contained information about the dependencies to be installed. Installing **visma** is quite simple now. To install just type:

```bash
$ pip3 install VISualMAth
```

And to launch type:

```bash
$ visma
```

I also modified the _run_ script which can be used by future developers to install, test and package **visma**. Below are the available options in the new _run_ script.

```bash
$ ./run
Enter command arguments with run
    ./run install - Install all dependencies for visma
    ./run visma - Open visma GUI
    ./run test - Run all the tests and generates coverage report
    ./run test path/to/test_file.py - Runs all tests and shows coverage for given file
    ./run test syntax - Run syntax test using pylama
    ./run test modules - Run tests using pytest for all modules
    ./run test coverage - After running all the tests, open coverage report
    ./run pack - Generate builds for visma package
    ./run pack upload - Generate builds and then upload to test.pypi.org
    ./run pack final - Generate builds and upload final build to pypi.org
    ./run clean - Clean all cache, reports and builds
```

The _plotter_ has been divided into two separate tabs i.e. 2D plot and 3D plot. The appropriate tab will be focused while plotting a given input. Also I have embedded the settings menu into the UI instead of creating a pop-up one. The settings contain options to enable/disable UI elements, change font sizes, change plot's axis ranges and mesh density etc.

Plotting an equation in different axis ranges helps in visualizing it in a better way. The below demo justifies the previous statement.

![visma-demo6](demos/log-06.gif)

## what i will be doing next

The github wiki is yet to be updated. It will contain the user and developer manual. Some more inline comments and docstrings can be added.

Though the GSoC period is coming to an end, there are still a lot of new things I want to implement in **visma**. I am thinking of making **visma** accessible from the terminal itself. A webapp is also on my mind (will implement after adding some more useful features).
