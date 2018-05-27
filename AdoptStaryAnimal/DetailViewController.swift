//
//  DetailViewController.swift
//  AdoptStaryAnimal
//
//  Created by kevin on 2018/5/27.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailKindLabel: UILabel!
    @IBOutlet weak var detailSexLabel: UILabel!
    @IBOutlet weak var detailBodytypeLabel: UILabel!
    @IBOutlet weak var detailAgeLabel: UILabel!
    @IBOutlet weak var detailColourLabel: UILabel!
    @IBOutlet weak var detailPlaceLabel: UILabel!
    @IBOutlet weak var detailShelterLabel: UILabel!
    @IBOutlet weak var detailIDLabel: UILabel!
    @IBOutlet weak var detailSterLabel: UILabel!
    @IBOutlet weak var detailStatusLabel: UILabel!
    @IBOutlet weak var detailRemarkTextView: UITextView!
    @IBOutlet weak var detailShelterTelLabel: UILabel!
    @IBOutlet weak var detailOpenLabel: UILabel!
    @IBOutlet weak var detailShelAddressTextView: UITextView!
    
    var animal: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.detailKindLabel.text = "種類： \(animal?.animal_kind ?? "error")"
        self.detailSexLabel.text = "性別： \(translate(input: (animal?.animal_sex)!))"
        self.detailBodytypeLabel.text = "體型： \(translate(input: (animal?.animal_bodytype)!))"
        self.detailColourLabel.text = "花色： \(animal?.animal_colour ?? "error")"
        self.detailAgeLabel.text = "年齡： \(translate(input: (animal?.animal_age)!))"
        self.detailPlaceLabel.text = "所在地：\(animal?.animal_place ?? "error")"
        self.detailShelterLabel.text = "\(animal?.shelter_name ?? "error")"
        self.detailIDLabel.text = "ID: \(animal?.animal_id ?? "error")"
        self.detailSterLabel.text = "是否絕育： \(translateSter(input: (animal?.animal_sterilization)!))"
        self.detailRemarkTextView.text = "\(animal?.animal_remark ?? "error")"
        self.detailShelterTelLabel.text = "\(animal?.shelter_tel ?? "error")"
        self.detailShelAddressTextView.text = "\(animal?.shelter_address ?? "error")"
        self.detailStatusLabel.text = "狀態： \(translate(input: (animal?.animal_status)!))"
        self.detailOpenLabel.text = "\(animal?.animal_opendate ?? "not open yet")"
        self.detailImageView.image = UIImage(named: "notFound")
        self.detailImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.detailImageView.clipsToBounds = true
        
        AnimalController.shared.fetchImage(url: (animal?.album_file)!){ (image) in
            guard let image = image else{
                return
            }
            DispatchQueue.main.async {
                self.detailImageView.image = image
                self.detailImageView.contentMode = UIViewContentMode.scaleAspectFill
                self.detailImageView.clipsToBounds = true
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
