//
//  TableCustomCell.swift
//  SPBGo
//
//  Created by Andrey on 11.11.2022.
//

import UIKit

class TableCustomCell: UITableViewCell {
    
    @IBOutlet var img : UIImageView!;
    @IBOutlet var title:UILabel!;
    @IBOutlet var price:UILabel!;
    @IBOutlet var date:UILabel!;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
