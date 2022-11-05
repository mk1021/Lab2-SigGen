
---
## Task 2: Sine and Cosine Dual Wave generation

### **Step 1:** 

- Copied over the main files from task1.
- Modified my testbench in task1 to generate TWO simultaneous sinusoid signals which have different phases therefore creating an offset which is determined by the rotary encoder on Vbuddy. 
- For this a dual-port ROM is needed, therefore we edited the *rom.sv* file to have two inputs and two outputs. *sinegen.sv* was also edited to include the extra input and output, and the offset. 

(insert screenshot of edits)

- The first ports addres *addr[7:0]* is from the counter and the second ports address *addr2[7:0]* includes the offset from the first address.
- The offset is determined by vbdValue() (rotary encoder). 
- There are now two graphs to be plotted therefore vbdPlot() is called twice, each with a different output. 

(insert pictures of the graphs)

---