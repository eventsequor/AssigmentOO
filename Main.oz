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