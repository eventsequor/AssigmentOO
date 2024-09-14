functor
import
      System(showInfo:Show) 
define
    class Matrix
        attr matrix
        meth init(ListOfList)
            matrix := ListOfList
        end
    end

    List = [[1 2] [3 4]]
    Obj = {New Matrix init(List)}
end