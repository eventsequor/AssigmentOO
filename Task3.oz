functor
import
      System(showInfo:Show print:Print) 
export
    MainTask

define
    class QSort

        attr originalList

        meth init(ListToOrder)
            originalList := ListToOrder
        end
        meth getListQuickSort(Result)
            local Out in
                {self lQuicksort(@originalList Out)}
                Result = Out
            end
        end

        meth getOriginalList(Result)
            Result = @originalList
        end

        meth lQuicksort(L Result)
            case L of X|L2 then Left Right SL SR FinalOut in
                {self partition(L2 X Left Right)}
                {self lQuicksort(Left SL)}
                {self lQuicksort(Right SR)}
                {self lAppend(SL X|SR FinalOut)}
                Result = FinalOut
            [] nil then Result = nil
            end
        end

        meth lAppend(Xs Ys Result)
            case Xs of X|Xr then LOut in
                {self lAppend(Xr Ys LOut)}
                Result = X|LOut
            [] nil then Result = Ys
            end
        end

        meth partition(L2 X L R)
            case L2
            of Y|M2 then
                if Y<X then Ln in
                L=Y|Ln
                {self partition(M2 X Ln R)}
                else Rn in
                R=Y|Rn
                {self partition(M2 X L Rn)}
                end
            [] nil then L=nil R=nil
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

    proc {MainTask}        
        local 
            ListEder = [3 1 4 1 5 9 2 6 5 10 120 ~1 ~7 14 99 88]
            QSortObject
            Answer
        in
            {Show "\n============================"}
            {Show "========== Task 3 =========="}
            {Show "============================\n"}
            QSortObject = {New QSort init(ListEder)}

            {Show "Original list: "#{PrintList ListEder}} 
                      
            {QSortObject getListQuickSort(Answer)}
            {Show "New list sorted: "#{PrintList Answer}}
        end
    end 
end