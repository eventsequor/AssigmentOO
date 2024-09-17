functor
import
      System(showInfo:Show print:Print) 
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

        %meth sum_colum(ColumNumber Return)
        %end

        meth mult_row(RowNumber Return)
            local Ys in
                try 
                    {List.nth @matrix RowNumber ?Ys}
                    {self mult(Ys Return)}
                catch X then Return = row_not_found end
            end
        end

        %meth mult_colum(ColumNumber Return)
        %end

        %meth sum_all(Return)
        %end

        %meth mult_all(Return)
        %end
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
    end

    Lists = [[7 2 6] [3 4 2]]
    Obj = {New Matrix init(Lists)}
    Return
    {Obj mult_row(1 Return)}
    {Print Return}
end