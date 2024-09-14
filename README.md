# Homework Object orientation

## General Execution
This program has a main executor called Main.oz, however you can run the program throw the run.sh file, or you have to compile each *.oz file and the execute the **Main.ozf**, remmember to have the environment variables configurated.

The implementation was developed to run the program through a shell console.

**To compile a program**
``` oz
ozc -c YourOZFile.oz
``` 
**To execute the program**
``` oz
ozengine YourOZFile.ozf
```

**To execute everything from the run.sh**
You if you are in windows you have to setup the sh environment variable or execute this from a git shell
``` sh
sh run.sh
``` 
## Task1
This task talks about open intervals of numbers, the implementation is in the Task1.oz file, however, there is a Main.oz file that calls the function, if you want to run the program independently, you must create another *.oz file, compile it and run it, the code you must put in the file is the following.

In the other hand the Task1.oz has a group of function to test the requeriment and when you execute the program, you will see the results in the shell console, you also could check the code looking for procedures that starts with the name Test*

``` oz
functor
import
      System(showInfo:Show) 
      Application(exit:Exit)
      Task1
define
   % CALL PROGRAM
   {Show "Main program execution:\n"}
   {Task1.mainTask}
   {Exit 0}
end
``` 