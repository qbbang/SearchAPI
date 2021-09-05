//
//  SearchResultTableViewCell.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/06.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var startCntLabel: UILabel!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var licenseImage: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        licenseImage.layer.cornerRadius = licenseImage.bounds.width / 2
        licenseImage.clipsToBounds = true
    }
    
    func bind(model: Item) {
        titleLabel.text = model.fullName
        descriptionLabel.text = model.description
        
        if model.stargazersCount == 0 {
            startView.isHidden = true
        } else {
            startCntLabel.text = model.stargazersCount?.formatStargazersCount()
        }
        
        if model.language == nil {
            languageView.isHidden = true
        } else {
            languageLabel.text = model.language ?? ""
        }
        
        if model.license?.spdxId == nil {
            licenseLabel.isHidden = true
        } else {
            licenseLabel.text = "\(model.license?.spdxId ?? "") license"
        }
        
        if model.updatedAt == nil {
            updatedLabel.isHidden = true
        } else {
            updatedLabel.text = model.updatedAt?.formatUpdateAt()
        }
    }
}
