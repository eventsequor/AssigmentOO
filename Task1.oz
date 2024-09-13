functor
import
    System(showInfo:Show)
    Utils(printList:PrintList)

define
    class Interval
        attr upperLimit lowerLimit

        meth init(LowerLimit UpperLimit)
            if( UpperLimit >= LowerLimit) 
            then
                upperLimit := UpperLimit
                lowerLimit := LowerLimit
            else 
                upperLimit := LowerLimit
                lowerLimit := UpperLimit
            end
            local A B in 
                {self intToFloat(@upperLimit A)}
                upperLimit := A 
                {self intToFloat(@lowerLimit B)}
                lowerLimit := B
            end
        end

        meth getUpperLimit(Return)
            Return = @upperLimit
        end
        meth getLowerLimit(Return)
            Return = @lowerLimit
        end
        meth setUpperLimit(UpperLimit)
            upperLimit := UpperLimit
        end
        meth setLowerLimit(LowerLimit)
            lowerLimit := LowerLimit
        end
        meth intToFloat(Number Return)
            local 
                IsNumber
                {Int.is Number ?IsNumber}
                OutPut
            in
                if IsNumber then 
                    {Int.toFloat Number ?OutPut}  
                    Return = OutPut 
                else 
                    Return = Number 
                end
            end
        end
        meth isThePointInTheInterval(Point Result)
            local LocalPoint in
                {self intToFloat(Point LocalPoint)}
                if LocalPoint > @lowerLimit andthen LocalPoint < @upperLimit then
                    Result = true
                else
                    Result = false
                end
            end
        end
        meth isInTheInterval(LeftPoint RightPoint Result)
            local IsLeftPointIn IsRightPoint in
                {self isThePointInTheInterval(LeftPoint IsLeftPointIn)}
                {self isThePointInTheInterval(RightPoint IsRightPoint)}
                if IsLeftPointIn andthen IsRightPoint then
                    Result = is_contained
                end
                if IsLeftPointIn andthen IsRightPoint == false then
                    Result = left_contained
                end
                if IsLeftPointIn == false andthen IsRightPoint then
                    Result = right_contained
                end
                if IsLeftPointIn == false andthen IsRightPoint == false then
                    Result = not_contained
                end
            end
        end
    end
    
    proc {MainTask}
        local Obj Z R Point IsIn in
            {Show "\n============================"}
            {Show "========== Task 1 =========="}
            {Show "============================\n"}
            Obj = {New Interval init(2 8)}
            {Obj getUpperLimit(Z)}
            {Show Z}
            Point = 7.999
            {Obj isThePointInTheInterval(Point R)}
            if R then
                {Show "The point <"#Point#"> IS in the interval"}
            else
                {Show "The point <"#Point#"> IS NOT in the interval"}
            end
            {Obj isInTheInterval(1.0 8.9 IsIn)}
            {Show IsIn}
        end
    end
    {MainTask}
end