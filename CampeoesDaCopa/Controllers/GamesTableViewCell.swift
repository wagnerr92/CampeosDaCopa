//
//  GamesTableViewCell.swift
//  CampeoesDaCopa
//
//  Created by Wagner Rodrigues on 08/05/23.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ivHome: UIImageView!
    @IBOutlet weak var ivAway: UIImageView!
    @IBOutlet weak var labelHome: UILabel!
    @IBOutlet weak var labelAway: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with game: Game){
        ivHome.image = UIImage(named: "\(game.home).png")
        ivAway.image = UIImage(named: "\(game.away).png")
        labelHome.text = game.home
        labelAway.text = game.away
        labelScore.text = game.score
    }

}
