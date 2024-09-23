functor
import
      System(showInfo:Show print:Print) 

export
    MainTask
define
    class Matrix
        
        attr matrix

        meth init(ListOfList)
            matrix := ListOfList
        end

        meth sum_row(RowNumber Return)
            local Ys in
                try 
                    {List.nth @matrix RowNumber ?Ys}
                    {self sum(Ys Return)}
                catch X then Return = row_not_found end
            end
        end

        meth sum_colum(ColumNumber Return)
            local Acu={NewCell 0.0} in
                for RowInM in @matrix do
                    local Out Out2 in
                        {List.nth RowInM ColumNumber ?Out}
                        {self intToFloat(Out Out2)}
                        Acu := @Acu + Out2
                    end
                end
                Return = @Acu
            end
        end

        meth mult_row(RowNumber Return)
            local Ys in
                try 
                    {List.nth @matrix RowNumber ?Ys}
                    {self mult(Ys Return)}
                catch X then Return = row_not_found end
            end
        end

        meth mult_colum(ColumNumber Return)
            local Acu={NewCell 1.0} in
                for RowInM in @matrix do
                    local Out Out2 in
                        {List.nth RowInM ColumNumber ?Out}
                        {self intToFloat(Out Out2)}
                        Acu := @Acu * Out2
                    end
                end
                Return = @Acu
            end
        end

        meth sum_all(Return)
            local Acu={NewCell 0.0} in
                for RowInM in @matrix do
                    local Out in
                        {self sum(RowInM Out)}
                        Acu := @Acu + Out
                    end
                end
                Return = @Acu
            end
        end

        meth mult_all(Return)
            local Acu={NewCell 1.0} in
                for RowInM in @matrix do
                    local Out in
                        {self mult(RowInM Out)}
                        Acu := @Acu * Out
                    end
                end
                Return = @Acu
            end
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
        meth sum(ValuesList Result)
            local Acu={NewCell 0.0} P in
                for P in ValuesList do
                    local Out in
                        {self intToFloat(P Out)}
                        Acu := @Acu + Out
                    end
                end
                Result = @Acu
            end
        end

        meth mult(ValuesList Result)
            local Acu={NewCell 1.0} P in
                for P in ValuesList do
                    local Out in
                        {self intToFloat(P Out)}
                        Acu := @Acu * Out
                    end
                end
                Result = @Acu
            end
        end

        meth printMatrix
            for RowInM in @matrix do
                {Show {PrintList RowInM}}
            end
        end
    end

    fun {PrintList L}
        local R={NewCell "["} in
            for P in L do
                if @R == "[" then R := @R # P else R := @R # " " # P end
                 
            end
            R := @R # "]"
            @R
        end
    end

    proc {Test1}
        {Show "\n========== Test 1 =========="}
        {Show "Sum the elements into the row from the matrix"}
        local MatrixE Result Obj in
            MatrixE = [[7 2 6] [3 4 2] [9 5 1]]
            Obj = {New Matrix init(MatrixE)}
            {Show "The matrix is: "}
            {Obj printMatrix()}
            {Show "Sum the value in the row number 3 = [9 5 1], the expected result is: 15"}
            {Obj sum_row(3 Result)}
            {Show "Result: "#Result}
        end
    end

    proc {Test2}
        {Show "\n========== Test 2 =========="}
        {Show "Sum the elements into the colum from the matrix"}
        local MatrixE Result Obj in
            MatrixE = [[7 2 6] [3 4 2] [9 5 1]]
            Obj = {New Matrix init(MatrixE)}
            {Show "The matrix is: "}
            {Obj printMatrix()}
            {Show "Sum the value in the colum number 2 = [2 4 5], the expected result is: 11"}
            {Obj sum_colum(2 Result)}
            {Show "Result: "#Result}
        end
    end

    proc {Test3}
        {Show "\n========== Test 2 =========="}
        {Show "Sum all elements into the matrix"}
        local MatrixE Result Obj in
            MatrixE = [[7 2 6 5] [2 7 2 1] [9 5 1 3] [4 4 1 8]]
            Obj = {New Matrix init(MatrixE)}
            {Show "The matrix is: "}
            {Obj printMatrix()}
            {Show "Sum all values the expected result is: 67"}
            {Obj sum_all(Result)}
            {Show "Result: "#Result}
        end
    end

    proc {Test4}
        {Show "\n========== Test 2 =========="}
        {Show "Sum mult all elements into the matrix"}
        local MatrixE Result Obj in
            MatrixE = [[6 5] [2 1] [1 3] [1 8]]
            Obj = {New Matrix init(MatrixE)}
            {Show "The matrix is: "}
            {Obj printMatrix()}
            {Show "Multiplication of all values is -> expected result is: 1440"}
            {Obj mult_all(Result)}
            {Show "Result: "#Result}
        end
    end

    proc {MainTask}
        local Obj R Point IsIn in
            {Show "\n============================"}
            {Show "========== Task 2 =========="}
            {Show "============================\n"}
            {Test1}
            {Test2}
            {Test3}
            {Test4}
        end
    end    
end