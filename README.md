# Traffic-Signal-Controller
## Description
This is a simple traffic signal control system that controls signal for both Padestrains and vehicles. So there will be two outputs. *p_light* and *t_light*. 

The overview of the system is given in the diagram below. 

![System Overview]( https://github.com/sudipbarua/Traffic-Signal-Controller/blob/master/System%20Overview.JPG)

  Fig: System overview diagram.

To implement this system, a simple Finite State Machine is designed that contains 6 states show in the above diagram. The transition from one state to the other is illustrated in the following diagram.  
![FSM]( https://github.com/sudipbarua/Traffic-Signal-Controller/blob/master/FSM%20diagram.JPG)

  Fig: Finite State Machine. 

The clock signal is 20Hz. 
