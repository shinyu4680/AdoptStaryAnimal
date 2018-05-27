//
//  RecentTableTableViewController.swift
//  AdoptStaryAnimal
//
//  Created by kevin on 2018/5/26.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class RecentTableTableViewController: UITableViewController{

    struct PropertyKeys {
        static let recentCell = "recentCell"
    }
    var recentAnimal = [Animal]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let urlStr = "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx?$top=10"
        let url = URL(string: urlStr)
        
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            
            let decoder = JSONDecoder()
            
            if let data = data, let strayAnimals = try?
                decoder.decode([Animal].self, from: data){
                self.updateUI(recentAnimals: strayAnimals)
            }
        }
        task.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func updateUI(recentAnimals: [Animal]){
        DispatchQueue.main.async {
            self.recentAnimal = recentAnimals
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recentAnimal.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.recentCell, for: indexPath) as? RecentTableViewCell else{
            fatalError("Could not dequeue a cell")
        }

        // Configure the cell...
        let animal = recentAnimal[indexPath.row]
        cell.animal = animal
        cell.kindLabel?.text = "種類： \(animal.animal_kind)"
        cell.sexLabel?.text = "性別： \(translate(input: animal.animal_sex))"
        cell.bodyTypeLabel?.text = "體型： \(translate(input: animal.animal_bodytype))"
        cell.colorLabel?.text = "花色： \(animal.animal_colour)"
        cell.ageLabel?.text = "年齡： \(translate(input: animal.animal_age))"
        cell.placeLabel?.text = "所在地： \(animal.animal_place)"
        cell.shelterLabel?.text = "\(animal.shelter_name)"
        cell.pictureImageView?.image = UIImage(named: "notFound")
        cell.pictureImageView?.contentMode = UIViewContentMode.scaleAspectFill
        cell.pictureImageView?.clipsToBounds = true
        
        AnimalController.shared.fetchImage(url: animal.album_file){ (image) in
            guard let image = image else{
                return
            }
            DispatchQueue.main.async {
                if cell.animal?.animal_id == animal.animal_id {
                    cell.pictureImageView?.image = image
                    cell.pictureImageView?.contentMode = UIViewContentMode.scaleAspectFill
                    cell.pictureImageView?.clipsToBounds = true
                }
            }
        }
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        detailAnimal = recentAnimal[indexPath.row]
//        performSegue(withIdentifier: "detailSegue", sender: nil)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
     // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
        let controller = segue.destination as? DetailViewController
        
        if let row = tableView.indexPathForSelectedRow?.row{
            controller?.animal = recentAnimal[row]
        }
    }

}
