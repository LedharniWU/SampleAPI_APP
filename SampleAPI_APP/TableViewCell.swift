//
//  TableViewCell.swift
//  SampleAPI_APP
//
//  Created by guest on 2019/01/25.
//  Copyright © 2019年 Ledharni. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


  @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(text: String){
        label.text = text
    }
    
}
