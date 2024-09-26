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
## Task Execution
If the files *.ozf for each program you have to compile it

Each point of the task has a Task*.oz file, this file has the implementation, a group of functions to test the requirement and when you run the program, you will see the results in the shell console, you can also review the code looking for procedures that begin with the name Test*

This is a example to test only one task or point, then you have to compile and then execute you_file.ozf

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