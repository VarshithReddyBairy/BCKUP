//
//  ViewController.swift
//  Bairy_SearchApp
//
//  Created by student on 10/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var topicInfoText: UITextView!
    @IBOutlet weak var moreImages: UIButton!
    
    var topic = 0
    var imageNumber = 0
    var arr = [["plant1","plant2","plant3","plant4","plant5"],["animal1","animal2","animal3","animal4","animal5"]]
    var plants_keywords = ["plant","tree","flowers"]
    
    var animals_keywords = ["animal","wild","domestic"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreImages.isHidden = true
       
    }

    @IBAction func searchButtonAction(_ sender: Any) {
        let text = searchTextField.text!
        moreImages.isHidden = false
        topicInfoText.isHidden = false
        if plants_keywords.contains(text){
            topic = 1
            resultImage.image = UIImage(named: "\(arr[0][imageNumber])")
            
            moreImages.isEnabled = true
            topicInfoText.text = "Plants are one of six big groups kingdoms of living things. Plants include familiar types such as trees, herbs, bushes, grasses, vines, ferns, mosses, and green algae. The scientific study of plants, known as botany"
            searchTextField.text = ""
            
            
        }
        if animals_keywords.contains(text){
            topic = 2
            resultImage.image = UIImage(named: "\(arr[1][imageNumber])")
            moreImages.isEnabled = true
            topicInfoText.text = "Animals are multicellular, eukaryotic organisms in the biological kingdom Animalia. With few exceptions, animals consume organic material, breathe oxygen, are able to move, can reproduce sexually, and go through an ontogenetic stage in which their body consists of a hollow sphere of cells, the blastula, during embryonic development"
        }
        
    }
    @IBAction func showMoreImagesBtn(_ sender: Any) {
        if topic == 1{
            imageNumber += 1
            if imageNumber < arr[0].count{
                resultImage.image = UIImage(named: "\(arr[0][imageNumber])")
            }
            else{
                imageNumber = 0
                moreImages.isEnabled = false
            }
        }
        else if topic == 2{
            imageNumber += 1
            if imageNumber < arr[1].count{
                resultImage.image = UIImage(named: "\(arr[1][imageNumber])")
            }
            else{
                imageNumber = 0
                moreImages.isEnabled = false
            }
        }
    }
    
}

