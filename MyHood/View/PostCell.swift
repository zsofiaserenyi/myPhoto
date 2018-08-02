//
//  PostCell.swift
//  MyHood
//
//  Created by Serényi  Zsófia on 2018. 08. 01..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //Outlets
    
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = 15
    }
    
    func configureCell(_ post: Post) {
        titleLabel.text = post.title
        descriptionLabel.text = post.postDesc
        
        postImg.image = DataService.instance.imageForPath(path: post.imagePath)
    }

}
