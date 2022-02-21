//
//  HistoryDetailTableViewCell.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 18/02/22.
//

import UIKit

class HistoryDetailTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "John"
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        return lb
    }()
    lazy var currencyLabel: UILabel = {
        let lb = UILabel()
        lb.text = "5000"
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        return lb
    }()
    lazy var accountTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "123-123-5435-461-2"
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {

        
        contentView.addSubview(titleLabel)
        contentView.addSubview(currencyLabel)
        contentView.addSubview(accountTitleLabel)
    
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 18)
        accountTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 30, paddingLeft: 18)
            
        currencyLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 8)
            
        
   }

}
