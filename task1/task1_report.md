
---
## Task 1: Simple sinewave generator

### **Step 1:** Specifying a 256 x 8 bit ROM

- Created a new component *rom.sv* using lecture 4 slide 20. 

(screenshot of code - rom.sv)

- File *sinegen.py* generates 256 Hex values/samples of a cos function in *sinerom.mem*. 
    - Line 3 opens a new file *sinerom.mem*. 
    - Line 4 runs a loop for 256 times so a piece of data is stored in every cell of the ROM.
    - Line 5 calculates the data value to store/write in the new file.
        - The formula used is $\cos(2*π*x)$ which is 1 period of a cos function
        - Then x is divided by 256 samples
        - The amplitude is 1...-1 so multiplying by 127 changes it to 127...-127 
        - Then add 127 to translate the cos function to be above the x-axis, all data values will now be positive
    - Line 6 - 9 is just formatting the values being stored, so each line has 16 pieces of data and theres 16 lines giving 256 data pieces.
    - Line 10 writes the hex value calculated into the new file opened.

(sinegen.py screenshot)

- File *sinerom.mem* is just a file opened by *sinegen.py* and contains all the data values calculated and needed to be plotted to create a cos wave.

(sinerom.mem screenshot - annotated)


### **Step 2-3:** Creating the sinegen module and testbench

- 'Top-level' module *'sinegen.sv'* needs to be built using two different components: *counter.sv* and *rom.sv*.

(pic of the top level module)

- Tried to create a new testbench for sinegen using *counter_tb.cpp* as a template. 

(insert testbench screenshot)

- However after some issues with the code, the testbench already given with the solution was copied from the appendix. 

(appendix testbench screenshot)

- As its a continuous sinewave being created, a very large value of 1000000 simulation cycles can be used to show the wave being plotted, however this does mean an exit key is necessary to exit the loop at any instant. Therefore the code below was added. 

- Pressing the letter q on the keyboard will exit the loop and close the vbuddy. 

(specific code - q key)

- As the filenames have changed, the doit.sh file needs to be editied as shown before compiling and testing the signal generator.

(screenshot of the edited doit.sh)

(pics of the sine wave drawn)

### **Challenge** 

> **Modify your design so that you use vbdValue() function to change the frequency of the sinewave generated**

Incr[7:0] is used to control the address of the next piece of data being outputted from ROM. Previously incr[7:0] was set to 1, so the address keeps increasing by 1. Every single piece of data in all 256 cells of the ROM were plotted. However if incr[7:0] is set to 2, the address will change so that a cell of data is skipped and then the next cell's data is outputted. Here we can understand that incr[7:0] controls the number of cells skipped before the next address is outputted. This automatically becomes equivalent to the frequency of the plotted sine wave.

(insert screenshot of the vbdValue)

- For this task, incr[7:0] is set to be determined by vbdValue() which is the rotary encoder. This allows the frequency of the sinewave generate to be changed 

---