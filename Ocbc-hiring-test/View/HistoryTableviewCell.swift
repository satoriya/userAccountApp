//
//  HistoryTableviewCell.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 18/02/22.
//

import Foundation
import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    var tableView = UITableView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    var accountModel: [AccountCellViewModel]?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func configureUI() {
         contentView.addSubview(tableView)
         tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 20, paddingBottom: 12, paddingRight: 20)
         tableView.delegate = self
         tableView.dataSource = self
         tableView.backgroundColor = .white
         tableView.layer.cornerRadius = 20
         tableView.register(HistoryDetailTableViewCell.self, forCellReuseIdentifier: "HistoryDetailTableViewCell")
         tableView.separatorColor = .clear
         tableView.isScrollEnabled = false
    }
    
}

extension HistoryTableViewCell: UITableViewDelegate {
    
}

extension HistoryTableViewCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return accountModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryDetailTableViewCell", for: indexPath) as? HistoryDetailTableViewCell else {return UITableViewCell()}
        let model = accountModel?[indexPath.row]
        cell.titleLabel.text = model?.name
        cell.currencyLabel.text = "\(model?.amount ?? 0)"
        cell.accountTitleLabel.text = model?.account
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return accountModel?[section].transactionDate
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
