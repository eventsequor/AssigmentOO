functor
import
      System(showInfo:Show) 
      Application(exit:Exit)
      Task1
      Task2
define
   % CALL PROGRAM
   {Show "Main program execution:\n"}
   {Task1.mainTask}
   {Task2.mainTask}
   {Exit 0}
end