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
    
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: RateTableViewCellDelegate?
    
    static let reuseIndentifier = "RateTableViewCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configure(viewModel: RateDetailViewModel, appTheming: AppTheming, styles: RatesStyle) {        
        codeLabel.text = viewModel.code
        labelValue.text = String(viewModel.value)
        
        /// Styles
        styles.cellStyle(mainContainer)
        styles.cellTitle(codeLabel)
        styles.cellSubitle(labelValue)
        styles.favoriteButton(favoriteButton)
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        favoriteButton.isSelected = !favoriteButton.isSelected
        delegate?.favoriteButtonPressed()
    }
}
