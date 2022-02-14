//
//  RateTableViewCell.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import UIKit

protocol RateTableViewCellDelegate: AnyObject {
    func favoriteButtonPressed()
}

class RateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: RateTableViewCellDelegate?
    
    static let reuseIndentifier = "RateTableViewCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configure(viewModel: RateDetailViewModel) {
        codeLabel.text = viewModel.code
        labelValue.text = String(viewModel.value)
        
        favoriteButton.setImage(UIImage(named: "star"), for: .normal)
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        delegate?.favoriteButtonPressed()
    }
}
