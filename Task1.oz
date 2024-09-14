functor
import
    System(showInfo:Show)
    Utils(printList:PrintList)

export
    MainTask

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
    proc {Test1}
        {Show "\n========== Test 1 =========="}
        {Show "Returns the left endpoint of the interval"}
        local 
            Obj
            LefEndPoint = 2.0
            RightPoint = 8.0
            Output
        in
            Obj = {New Interval init(LefEndPoint RightPoint)}
            {Obj getLowerLimit(Output)}
            {Show "The interval is: ("#LefEndPoint#" - "#RightPoint#")"}
            {Show "The left endpoint is: "#Output}
        end
    end
    proc {Test2}
        {Show "\n========== Test 2 =========="}
        {Show "Returns the right endpoint of the interval"}
        local 
            Obj
            LefEndPoint = 3.0
            RightPoint = 7.0
            Output
        in
            Obj = {New Interval init(LefEndPoint RightPoint)}
            {Obj getUpperLimit(Output)}
            {Show "The interval is: ("#LefEndPoint#" - "#RightPoint#")"}
            {Show "The right endpoint is: "#Output}
        end
    end
    proc {Test3}
        {Show "\n========== Test 3 =========="}
        {Show "That receives a floating number and determines if the point is in the interval"}
        local 
            Obj
            LefEndPoint = 1.0
            RightPoint = 9.0

            Inside = 4.9
            InsideReturn

            Outside = 10
            OutsideReturn
            
            OutsideLeft = LefEndPoint
            OutsideLeftReturn

            OutsideRight = RightPoint
            OutsideRightReturn
        in
            {Show "Interval ("#LefEndPoint#" - "#RightPoint#")\n"}
            Obj = {New Interval init(LefEndPoint RightPoint)}

            {Obj isThePointInTheInterval(Inside InsideReturn)}
            if InsideReturn then
                {Show "The point <"#Inside#"> IS in the interval: "}
            else
                {Show "The point <"#Inside#"> IS NOT in the interval"}
            end

            {Obj isThePointInTheInterval(Outside OutsideReturn)}
            if OutsideReturn then
                {Show "The point <"#Outside#"> IS in the interval"}
            else
                {Show "The point <"#Outside#"> IS NOT in the interval"}
            end

            {Obj isThePointInTheInterval(OutsideLeft OutsideLeftReturn)}
            if OutsideLeftReturn then
                {Show "The point <"#OutsideLeft#"> IS in the interval"}
            else
                {Show "The point <"#OutsideLeft#"> IS NOT in the interval"}
            end

            {Obj isThePointInTheInterval(OutsideRight OutsideRightReturn)}
            if OutsideRightReturn then
                {Show "The point <"#OutsideRight#"> IS in the interval"}
            else
                {Show "The point <"#OutsideRight#"> IS NOT in the interval"}
            end
        end
    end
    proc {Test4}
        local 
            Obj
            LefEndPoint = 5.0
            RightPoint = 15.0

            IntervaOneLeft = 5.1
            IntervalOneRight = 14.9
            ResultOne

            IntervalTwoLeft = 7.0
            IntervalTwoRight = 16.0
            ResutlTwo

            IntervalThreeLeft = 2.0
            IntervalThreeRight = 13.0
            ResultThree

            IntervalFourLeft = 3.0
            IntervalFourRight = 20.0
            ResultFour
        in
            {Show "\n========== Test 4 =========="}
            {Show "that receive an interval an determines whether the interval is contained, left-contained"}
            {Show "(only the left endpoint of the parameter is in the interval), right-contained (only the"}
            {Show "right endpoint of the parameter is in the interval), disjoint, or contains the interval\n"}
            {Show "Original interval ("#LefEndPoint#" - "#RightPoint#")"}
            Obj = {New Interval init(LefEndPoint RightPoint)}
            
            {Obj isInTheInterval(IntervaOneLeft IntervalOneRight ResultOne)}
            {Show "\nInterval ("#IntervaOneLeft#" - "#IntervalOneRight#") is: "#ResultOne}
            
            {Obj isInTheInterval(IntervalTwoLeft IntervalTwoRight ResutlTwo)}
            {Show "\nInterval ("#IntervalTwoLeft#" - "#IntervalTwoRight#") is: "#ResutlTwo}
            
            {Obj isInTheInterval(IntervalTwoLeft IntervalTwoRight ResutlTwo)}
            {Show "\nInterval ("#IntervalTwoLeft#" - "#IntervalTwoRight#") is: "#ResutlTwo}

            {Obj isInTheInterval(IntervalThreeLeft IntervalThreeRight ResultThree)}
            {Show "\nInterval ("#IntervalThreeLeft#" - "#IntervalThreeRight#") is: "#ResultThree}

            {Obj isInTheInterval(IntervalFourLeft IntervalFourRight ResultFour)}
            {Show "\nInterval ("#IntervalFourLeft#" - "#IntervalFourRight#") is: "#ResultFour}
        end
    end
    proc {Test5}
        local
            Obj
            LefEndPoint = 10.0
            RightPoint = 20.0

            NewLeftPoint = 30.0
            NewRightPoint = 50.0

            OutsideLeft
            OutsideRight
        in
            {Show "\n========== Test 4 =========="}
            {Show "That receives two floating numbers and updates the left and right endpoints of the"}
            {Show "interval"}
            {Show "\nOriginal interval ("#LefEndPoint#" - "#RightPoint#")\n"}
            Obj = {New Interval init(LefEndPoint RightPoint)}
            {Obj init(NewLeftPoint NewRightPoint)}
            
            {Obj getLowerLimit(OutsideLeft)}
            {Obj getUpperLimit(OutsideRight)}

            {Show "The new interval is: ("#OutsideLeft#" - "#OutsideRight#")"}
        end
    end
    proc {MainTask}
        local Obj R Point IsIn in
            {Show "\n============================"}
            {Show "========== Task 1 =========="}
            {Show "============================\n"}
            {Test1}
            {Test2}
            {Test3}
            {Test4}
            {Test5}
        end
    end
end