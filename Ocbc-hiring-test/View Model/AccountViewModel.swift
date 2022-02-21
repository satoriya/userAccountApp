//
//  AccountViewModel.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 19/02/22.
//

import Foundation
import UIKit

class AccountViewModel: NSObject {
    
    
    var reloadTableView: (() -> ())?

    var accountCellViewModels: Bindable<[AccountCellViewModel]?> = Bindable([AccountCellViewModel]()) {
        didSet {
            reloadTableView?()
        }
    }
    
    let error: Bindable<Error?> = Bindable(nil)
    var accountData: Bindable<AccountDatas?> = Bindable(nil)
    var errorType: Bindable<Int?> = Bindable(nil)

     func getDatas(completion: @escaping () -> () ) {
         AccountService().fetchTransactions { account, err, response  in
            
            if let _err = err, let resp = response {
                self.error.value = _err
                self.errorType.value = resp.statusCode
                
                completion()
            }
            
            if let _acc = account {
                self.fetchData(accountData: _acc.data)
                completion()
            }
            
        }
    }
    
    func fetchData(accountData: AccountDatas) {
        self.accountData.value = accountData
        var cms = [AccountCellViewModel]()
        for data in self.accountData.value ?? [] {
            cms.append(createServiceModel(data: data))
        }
        accountCellViewModels.value = cms
    }
    
    func createServiceModel(data: AccountData) -> AccountCellViewModel {
        let name = data.receipient?.accountHolder ?? ""
        let account = data.receipient?.accountNo ?? ""
        let amount = data.amount
        let transactionDate = data.transactionDate
        
        return AccountCellViewModel(account: account, name: name, transactionDate: transactionDate, amount: amount)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> AccountCellViewModel? {
        guard let data = accountCellViewModels.value?[indexPath.row] else {
            print("cannot get data ")
            return nil}
        return data
    }
    
}


struct AccountCellViewModel {
    var account, name, transactionDate : String
    var amount: Int
}
