# Changelog
All changes that had been made to project 1 will be documented in this file.
## Milestone 3, Project 1 - 2020.10.19
**This is the final version of project 1.**
### Added
Now the whole animation is complete. Sad to see that there are cars that did obey the traffic rules and eventually crashed.
### Modified
I have eventually gave up using a timer object to control the lights. It is too confusing to use it. Instead I tried calling the original timer function every time in the main loop and it worked well.  
Also, in order not to become subjected to any deductions, I rewrote the initialize() function using a recursive algorithm to generate the car plates.
## Milestone 2, Project 1 - 2020.10.6
### Added
What has been added to this edition are not that visible, or they're not that explicit. Actually, if you run the code, you will notice that you only need to enter more parameters. What will appear on screen remain unchanged.  
However, __a major addition was contained in the source code car.m.__ This file defines a class named car, which contain methods that describe how cars generate and move. You can state that this is somewhat like the core of this project.
### Modified
Now I abandoned the annoying ```while true``` in the code and replaced it with a timer object. This allows multiple tasks (eg. the flash of lights and the moving of cars) to be run in the same time in MATLAB.
## Milestone 1, Project 1 - 2020.10.1
### Added
Now, we can use the MATLAB to draw a crossing with respect to the width of the road, which the user may decide.  
Also, the lights at the crossing can automatically change their colors after some time, which the user may also decide. The changing of colors is non-stop unless we terminate the running script.