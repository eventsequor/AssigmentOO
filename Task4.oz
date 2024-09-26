functor
import
      System(showInfo:Show print:Print) 

export
    MainTask

define
    local BankIdList = {NewCell nil} in
        class ATM
            attr bank account
    
            meth init(Bank Account)
                bank := Bank
                account := Account        
                {Show "New ATM"}       
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
                local 
                    ResultOperation Belong Debit NewAmount
                    {self accountBelongToBank(OriginAccount Belong)}
                in
                    if Belong then
                        Debit = Amount
                    else
                        {Show "Debing 5% aditional for be an external account"}                        
                        NewAmount = {IntToFloat Amount}
                        {Show "Please withdraw only: "#NewAmount}
                        Debit = NewAmount * 1.05
                    end
                    {OriginAccount withdraw(Debit ResultOperation)}
                    if ResultOperation then
                        {OriginAccount getBalance(_)}
                        Result = true
                    else 
                        Result = false
                    end
                end
            end

            meth getExternalAccountBalance(ExternalAccount ReturnBalance)
                {Show "\nGet External Account Balance"}
                local 
                    LocalIdBank Belong CurrentBalance
                    {self accountBelongToBank(ExternalAccount Belong)}
                in                    
                    if Belong then
                        {Show "Balance request accepted"}
                        {ExternalAccount getBalance(CurrentBalance)}
                        ReturnBalance = CurrentBalance
                    else
                        {@bank getId(LocalIdBank)}
                        {Show "Unknow balance the account does not belong to this bank: "#LocalIdBank}
                        ReturnBalance = 0.0
                    end
                end
            end

            meth accountBelongToBank(ExternalAccount Return)
                local 
                    BankIdExter 
                    {ExternalAccount getBank(BankIdExter)} 
                    IdExterBank
                    {BankIdExter getId(IdExterBank)}
                    LocalIdBank
                    {@bank getId(LocalIdBank)}
                    CurrentBalance
                in                    
                    if IdExterBank == LocalIdBank then
                        Return = true
                    else
                        Return = false
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
                        {Show "\nWithdrawing: "#Amount_F}
                        {@bank getId(BankId)}
                        if Amount_F < @balance then
                            balance := @balance - Amount_F 
                            {Show "\nWithdraw successfull - Bank: "#BankId#" - Account with id: "#@idAccount#" - New balance: "#@balance}
                            StatusOperation = true
                        else
                            {Show "\nFAILED withdraw, insufficient balance - Bank: "#BankId#" - Account with id: "#@idAccount#" - Current balance: "#@balance}
                            {Show "Amount to withdraw: "#Amount}
                            StatusOperation = false
                        end
                    end
                end
    
                meth add(Amount)
                    local Amount_F = {IntToFloat Amount} BankId in
                        {@bank getId(BankId)}
                        if Amount_F >= 0.0 then
                            balance := @balance + Amount_F
                            {Show "\nAccredit successfull - Bank: "#BankId#" - Account with id: "#@idAccount#" - New balance: "#@balance}
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
    

    %%%% Test of program
    proc {Test1}
        {Show "\n========== Test 1 =========="}
        {Show "Instance a bank and its id is their name"}
        local Ban1 NameBan1 = "Banco de colombia" in
            Ban1 = {New Bank init(NameBan1)}
        end
    end

    proc {Test2}
        {Show "\n========== Test 2 =========="}
        {Show "That returns the balance in the account\n"}
            local Ban1 NameBan1 = "Banco de colombia" CurrentB_1 Account1 in 
                Ban1 = {New Bank init(NameBan1)}
                Account1 = {New Account init(Ban1)}
                {Account1 getBalance(CurrentB_1)}
            end
    end

    proc {Test3}
        {Show "\n========== Test 3 =========="}
        {Show "That receives an amount and adds it to the account balance\n"}
            local Ban1 NameBan1 = "Banco de colombia" CurrentB_1 Account1 in 
                Ban1 = {New Bank init(NameBan1)}
                Account1 = {New Account init(Ban1)}
                {Account1 add(2000)}
                {Account1 getBalance(CurrentB_1)}
            end
    end

    proc {Test4}
        {Show "\n========== Test 4 =========="}
        {Show "That receives an amount to debit from the account and returns a boolean to state whether the operation was successful\n"}
            local Ban1 NameBan1 = "Banco de colombia" CurrentB_1 Account1 ResultWithdraw ResultWithdraw2 in 
                Ban1 = {New Bank init(NameBan1)}
                Account1 = {New Account init(Ban1)}
                {Account1 add(1000)}
                {Account1 withdraw(650 ResultWithdraw)}
                {Show "Result withdraw"}
                {Print ResultWithdraw}
                {Show ""}
                
                {Account1 withdraw(700 ResultWithdraw2)}
                {Show "Result withdraw"}
                {Print ResultWithdraw2}
                {Show ""}
            
                {Account1 getBalance(CurrentB_1)}
            end
    end

    proc {Test5}
        {Show "\n========== Test 5 =========="}
        {Show "The ATM contains its Bank and an Account. The ATM can:\n"}
            local Ban1 NameBan1 = "Banco de colombia" ATM1 Account1 in 
                {Show "Instance an ATM"}
                Ban1 = {New Bank init(NameBan1)}
                Account1 = {New Account init(Ban1)}
                ATM1 = {New ATM init(Ban1 Account1)}
            end
    end

    proc {Test6}
        {Show "\n========== Test 6 =========="}
        {Show "That returns the balance of the account\n"}
            local Ban1 NameBan1 = "Banco de colombia" ATM1 Account1 OutputBalance in 
                Ban1 = {New Bank init(NameBan1)}
                Account1 = {New Account init(Ban1)}
                {Account1 add(1500)}
                ATM1 = {New ATM init(Ban1 Account1)}
                {ATM1 getBalance(OutputBalance)}
            end
    end

    proc {Test7}
        {Show "\n========== Test 7 =========="}
        {Show "That receives and account and an amount, and pays (debits) the given amount from the account\n"}
            local Ban1 NameBan1 = "Banco de colombia" ATM1 Account1 OutputBalance in 
                Ban1 = {New Bank init(NameBan1)}
                Account1 = {New Account init(Ban1)}
                {Account1 add(1500)}
                ATM1 = {New ATM init(Ban1 Account1)}
                {ATM1 debitsOrPays(Account1 120 _)} %% Here the test of this point
            end
    end

    proc {Test8}
        {Show "\n========== Test 8 =========="}
        {Show "That receives an account and returns the balance of the account if the ATM has access to it. The ATM only has access to local accounts.\n"}
            local 
                Ban1 
                Ban2
                NameBan1 = "Banco de colombia" 
                NameBan2 = "Banco los andes"
                ATM1 
                Account1
                Account2 
                OutputBalance 
                OutputBalance2
            in 
                Ban1 = {New Bank init(NameBan1)}
                Ban2 = {New Bank init(NameBan2)}
                Account1 = {New Account init(Ban1)}
                Account2 = {New Account init(Ban2)}
                {Account1 add(1500)}
                {Account2 add(2500)}
                ATM1 = {New ATM init(Ban1 Account1)}
                {Show "============== LOCAL ACCOUNT =================="}
                {ATM1 getExternalAccountBalance(Account1 OutputBalance)} %% Here the test of this point
                {Show OutputBalance}

                {Show "\n============ EXTERNAL ACCOUNT ================="}
                {ATM1 getExternalAccountBalance(Account2 OutputBalance2)} %% Here the test of this point
                {Show OutputBalance2}
            end
    end

    proc {Test9}
        {Show "\n========== Test 9 =========="}
        {Show "In addition, you will need a ForeignAccount that behaves like an account with two differences. "}
        {Show "When paying cash from an ATM different from the account’s bank, the debit should have an additional "}
        {Show "fee, that corresponds to the 5% of the amount debited. When getting the account balance from an ATM"}
        {Show "from a bank different to the accounts bank, the ATM should not have access to the balance and an error"}
        {Show "message should be displayed.\n"}
            local 
                Ban1 
                Ban2
                NameBan1 = "Banco de colombia" 
                NameBan2 = "Banco los andes"
                ATM1 
                Account1
                Account2 
                OutputBalance 
                OutputBalance2
            in 
                Ban1 = {New Bank init(NameBan1)}
                Ban2 = {New Bank init(NameBan2)}
                Account1 = {New Account init(Ban1)}
                Account2 = {New Account init(Ban2)}
                {Account1 add(3000)}
                {Account2 add(3000)}
                ATM1 = {New ATM init(Ban1 Account1)}
                {Show "============== LOCAL ACCOUNT =================="}
                {Account1 getBalance(_)}
                {ATM1 debitsOrPays(Account1 500 OutputBalance)} %% Here the test of this point
                {Show "Withdraw succeess?: "}
                {Print OutputBalance}
                {Show ""}

                {Show "\n============ EXTERNAL ACCOUNT ================="}
                {Account2 getBalance(_)}
                {ATM1 debitsOrPays(Account2 500 OutputBalance2)} %% Here the test of this point
                {Show "Withdraw succeess?: "}
                {Print OutputBalance2}
                {Show ""}
            end
    end

    proc {MainTask}
        {Test1}
        {Test2}
        {Test3}
        {Test4}
        {Test5}
        {Test6}
        {Test7}
        {Test8}
        {Test9}
        
    end

    proc {Template}
        local Ban1 Ban2 ATM1 Account1 Account2
            NameBan1 = "Banco de colombia"
            NameBan2 = "Banco uniandes"
            CurrentB_1
            External
        in
            Ban1 = {New Bank init(NameBan1)}
            Ban2 = {New Bank init("Banco uniandes")}

            Account1 = {New Account init(Ban1)}
            Account2 = {New Account init(Ban1)}
            {Account2 add(300)}
            
            ATM1 = {New ATM init(Ban1 Account1)}
            {ATM1 getBalance(CurrentB_1)}
            {Show CurrentB_1}
            
            {ATM1 getExternalAccountBalance(Account2 External)}
        end
    end
    {MainTask}
end