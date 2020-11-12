# README of mn101 project 1

This is the readme file of mn101 project 1 by Yunchen WANG.

## What is this project?

This project is a simulation of how cars behave when they reach a crossing in the Liberty City. (确信)

## Which files are contained in the source code of this project?

- car.m  
- drawroads.m  
- initiate.m  
- trafficlights.m  
- p1.m (the main script)

## How to run this project?

1. Under the directory that contain all the source codes, double-click on the file 'p1.m'.
2. A MATLAB session should start. On the toolbar, click 'Run'.
3. Enter all necessary parameters as the console prompts. 
4. The animation should start. Good luck!

## Known Bugs

I have conducted extensive tests and made strenous efforts to ensure that no bugs exist. However, there are something I want to mention before you begin running this project. 
1. **Do not set the numbers of total cars to be 1.** This has proven to make MATLAB return an error message.
2. **Set the time interval, at which traffic lights change color, to be greater than 0.1.** Because the FPS (Frames Per Second) of the animation in this project is set to be 10 fps, if you let traffic lights change color in less than 0.1 seconds, it is possible that the color of the lights remains unchanged after the time interval.
3. Sometimes cars may crash even if they do obey the traffic rules. This is because they are moving too slowly (1 unit per second) and they cannot adjust their speed.

## For God's sake, how does this thing work?
__The contents below contains information about some key algorithms in this project.__  
The most confusing part of the code is the part that decides how cars behave when they reach the crossing.  
The final version of the algorithm that does this contain a bunch of `for` loops and `if` statements, so it is quite confusing to read. Actually, I've spent days debugging on this thing.  
The code block below contain pseudo-codes that I have written to explain how this algorithm works.
```cpp
if the trafficlight is 'green' do:
    set all cars to be 'moving'.
else (the traffic light is red) do:
    set all cars that had already passed the crossing to 'have passed' and,
    for all cars:
        if they 'have passed' do:
            set them to be 'moving'.
        else (they haven't passed) do:
            if the whole 'chain of cars' that haven't passed aren't 'waiting' do:
                if the FIRST car of them hasn't reached the crossing do:
                    set them all to be 'moving'.
                else (the FIRST car is at the crossing) do:
                    if the FIRST car does obey the traffic rule (randomly) do:
                        'stop' it and,
                        set 'chain of cars' to be 'waiting'.
                    else (it jumps the red light and, also, randomly) do:
                        set it to be 'moving' and,
                        set it to 'have passed' the crossing and thus,
                        it had 'violated the traffic rules'.
                    end if
                end if
            else (the 'chain of cars' are 'waiting') do:
                again, set them to be 'stopped'.
            end if
        end if
    end for
end if                   
```
Each keyword inside quotation marks represent a variable that I use to describe the status of the car. Actually, I used a class called `car` to describe the behavior of all cars. That had already made my code easier to read and to maintain, but it is still confusing at some point, like the algorithm mentioned above.  

*This is the end of README*