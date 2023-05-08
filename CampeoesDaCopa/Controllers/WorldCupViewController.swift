//
//  WorldCupViewController.swift
//  CampeoesDaCopa
//
//  Created by Wagner Rodrigues on 07/05/23.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    var worldCup: WorldCup!
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var labelWinner: UILabel!
    @IBOutlet weak var labelVice: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "World Cup \(worldCup.year)"
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        labelWinner.text = worldCup.winner
        labelVice.text = worldCup.vice
        labelScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
    }
    
}

extension WorldCupViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        
        cell.prepare(with: game)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
    
    
}

extension WorldCupViewController: UITableViewDelegate{
    
}
