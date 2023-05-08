//
//  WinnersTableViewController.swift
//  CampeoesDaCopa
//
//  Created by Wagner Rodrigues on 07/05/23.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    var worldCups: [WorldCup] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! WorldCupViewController
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        vc.worldCup = worldCup
    }
    
    func loadWorldCups(){
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)!
        let jsonData = try! Data(contentsOf: fileURL)
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        }catch{
            print(error.localizedDescription)
            
        }
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell
        let worldCup = worldCups[indexPath.row]
        
        cell.prepare(with: worldCup)
        
        return cell
    }
    

}
