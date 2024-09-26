functor
import
      System
      Application(exit:Exit)
      Task1
      Task2
      Task3
      Task4
define
   % CALL PROGRAM
   {System.showInfo "Main program execution:\n"}
   {Task1.mainTask}
   {Task2.mainTask}
   {Task3.mainTask}
   {Task4.mainTask}
   {Exit 0}
end