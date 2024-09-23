functor
import
      System(showInfo:Show) 
      Application(exit:Exit)
      Task1
      Task2
      Task3
define
   % CALL PROGRAM
   {Show "Main program execution:\n"}
   {Task1.mainTask}
   {Task2.mainTask}
   {Task3.mainTask}
   {Exit 0}
end