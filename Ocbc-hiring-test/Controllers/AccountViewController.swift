//
//  AccountTableViewController.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 18/02/22.
//

import UIKit

enum Datatype: Int {
    case history = 0
    case transaction
}

class AccountViewController: UIViewController {

    var tableView = UITableView()
    lazy var vm = {
        AccountViewModel()
    }()
    var accountModel:AccountModel?
    lazy var bgView = UIView()
    
    var count = 0
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        return lb
    }()
    lazy var currencyLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    lazy var accountTitleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 10)
        return lb
    }()
    lazy var accountNumLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        return lb
    }()
    lazy var holderTitleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 10)
        return lb
    }()
    lazy var holderNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        return lb
    }()
    
    lazy var transferBtn: UIButton = {
        let btn = UIButton()
        btn.setSubmitBtn(with: "Make Transfer", bgColor: .black, fontColor: .white)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUi()
        initViewModel()
        
    }
    
    func initViewModel() {
        vm.getDatas {
            self.tableView.reloadData()
        }
        vm.reloadTableView = {
            
        }
        vm.errorType.bind { response in
            switch response {
            case 401:
                self.navigationController?.popViewController(animated: false)
            default:
                break
            }
        }
    }
    
    

}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var counts = 0
        vm.accountCellViewModels.bind { model in
            counts = model?.count ?? 0
        }
        
        return counts
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var xPlus = CGFloat()
        
        vm.accountCellViewModels.bind { model in
            xPlus = CGFloat(model?.count ?? 0 * 50)
        }
        
        
        let me = tableView.frame.size.height / 5
        return CGFloat(me + xPlus)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        vm.accountCellViewModels.bind { data in
            cell.accountModel = data
        }
        cell.selectionStyle = .none
        return cell
    }


}

extension AccountViewController {
    private func configUi() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = .clear
        
        view.addSubview(tableView)
        view.addSubview(bgView)
        view.addSubview(transferBtn)
        
        
        view.backgroundColor = UIColor.color(hex: "#F8F7F3")
        
        bgView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 0)
        bgView.layer.cornerRadius = 20
         bgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
         bgView.setDimensions(height: 150, width: view.frame.size.width / 1.5)
        bgView.backgroundColor = .white
        transferBtn
            .centerX(inView: view)
        transferBtn
            .anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,  right: view.rightAnchor, paddingLeft: 13, paddingBottom: 13, paddingRight: 13)
        
        tableView.anchor(top: bgView.bottomAnchor, left: view.leftAnchor, bottom: transferBtn.topAnchor, right: view.rightAnchor, paddingTop: 50)
    
    }
}
