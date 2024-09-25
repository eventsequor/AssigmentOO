functor
import
      System(showInfo:Show print:Print) 

export
    Account MainTask

define
    local BankIdList = {NewCell nil} in
        class ATM
            attr bank account
    
            meth init(Bank Account)
                bank := Bank
                account := Account               
            end

            meth getBalance(ReturnBalance)                
                local CurrentBalance IdAccount in
                    {@account getBalance(CurrentBalance)}
                    ReturnBalance = CurrentBalance
                end
            end
    
            meth getBank(ReturnBank)
                ReturnBank = @bank
            end

            meth debitsOrPays(OriginAccount Amount Result)
                local ResultOperation in
                    {OriginAccount withdraw(Amount ResultOperation)}
                    if ResultOperation then
                        {@account add(Amount)}
                        Result = true
                    else 
                        Result = false
                    end
                end
            end
        end
    
        class Bank
            attr id
    
            meth init(Name)
                id := Name
                if @BankIdList == nil then
                    BankIdList := [@id]
                    {Show "Bank created with id: "#@id}
                else
                    local B in
                        {List.member @id @BankIdList ?B}
                        if B == false then
                            BankIdList :=  {Append @BankIdList [@id]} 
                            {Show "Bank created with id: "#@id}
                        else
                            {Show "The bank already exist: <"#@id#"> You only create an instance for this entity"}
                        end
                    end
                end
            end
    
            meth getId(ReturnId)
                ReturnId = @id
            end
        end
    
        fun {IntToFloat Number}
            local 
                IsNumber
                {Int.is Number ?IsNumber}
                OutPut
            in
                if IsNumber then {Int.toFloat Number ?OutPut} OutPut else Number end
            end
        end
    
        local Counter = {NewCell 0} in
            class Account
                attr bank balance idAccount
    
                meth init(Bank)
                    local TimeStamp BankId in
                        bank := Bank
                        balance := 0.0
                        % This force each cound will be generated with diferents accounts            
                        {Time.time TimeStamp}
                        Counter := @Counter + 1
                        idAccount := TimeStamp + @Counter
                        {@bank getId(BankId)}
                        {Show "\nNew Account Bank: "#BankId#" - account id: "#@idAccount#" - balance: "#@balance}
                    end
                end
    
                meth getBalance(ReturnBalance)
                    {Show "here"}
                    local BankId in
                        {@bank getId(BankId)}
                        {Show "\nBalance - Bank: "#BankId#" - account with id: "#@idAccount#" and balance: "#@balance}
                        ReturnBalance = @balance
                    end 
                end
    
                meth getBank(ReturnBank)
                    ReturnBank = @bank
                end

                meth getIdAccount(ReturnIdAccount)
                    ReturnIdAccount := @idAccount
                end
    
                meth withdraw(Amount StatusOperation)
                    local Amount_F = {IntToFloat Amount} BankId in
                        {@bank getId(BankId)}
                        if Amount_F < @balance then
                            balance := @balance - Amount_F                            
                            {Show "\nWithdraw successfull - Bank: "#BankId#" - account with id: "#@idAccount#" and balance: "#@balance}
                            StatusOperation = true
                        else
                            {Show "\nWithdraw failed insufficient balance - Bank: "#BankId#" - account with id: "#@idAccount#" and balance: "#@balance}
                            StatusOperation = false
                        end
                    end
                end
    
                meth add(Amount)
                    local Amount_F = {IntToFloat Amount} in
                        if Amount_F >= 0.0 then
                            balance := @balance + Amount_F
                        end
                    end
                end
            end
        end   
        
        proc {ShowBanks}
            {Show "\nList of banks:"}
            for P in @BankIdList do
                {Show P}
            end
        end
    end
    
    proc {MainTask}
        local Ban1 Ban2 ATM1 Account1 Account2
            NameBan1 = "Banco de colombia"
            NameBan2 = "Banco uniandes"
            CurrentB_1
        in
            Ban1 = {New Bank init(NameBan1)}
            Ban2 = {New Bank init("Banco uniandes")}

            Account1 = {New Account init(Ban1)}
            Account2 = {New Account init(Ban1)}
            {Account2 add(300)}
            
            ATM1 = {New ATM init(Ban1 Account1)}
            {ATM1 debitsOrPays(Account2 100 _)}
            {ATM1 getBalance(CurrentB_1)}
            {Show CurrentB_1}
        end
    end
    {MainTask}
end