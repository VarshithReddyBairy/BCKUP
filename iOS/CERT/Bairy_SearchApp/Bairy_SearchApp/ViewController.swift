//
//  ViewController.swift
//  Bairy_SearchApp
//
//  Created by student on 10/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var moreImages: UIButton!
    @IBOutlet weak var topicInfoText: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    
    var topic = 0
    var imageNumber = 0
    var arr = [
        ["plant1","plant2","plant3","plant4","plant5"],["animal1","animal2","animal3","animal4","animal5"],
        ["beer1","beer2","beer3","beer4","beer5"],
        ["car1","car2","car3","car4","car5"],
        ["apple1","apple2","apple3","apple4","apple5"]]
    var plants_keywords = ["plant","tree","flowers"]
    var animals_keywords = ["animal","wild","domestic"]
    var beer_keywords = ["beer","alchohol","booze"]
    var car_keywords = ["car","fast"]
    var apple_keywords = ["apple","costly","steve","rich"]
    override func viewDidLoad() {
        super.viewDidLoad()
        resultImage.image = UIImage(named: "search")
        moreImages.isHidden = true
        searchButton.isEnabled = false
        searchButton.alpha = 0.5
        resetButton.isHidden = true
    }
    
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        resetButton.isHidden = false
        let text = searchTextField.text!
        imageNumber = 0
        moreImages.isHidden = false
        moreImages.isEnabled =  true
        moreImages.alpha = 1.0
        topicInfoText.isHidden = false
        
        if plants_keywords.contains(text){
            topic = 1
            resultImage.image = UIImage(named: "\(arr[0][imageNumber])")
            searchTextField.text = ""
            topicInfoText.text = "Plants are one of six big groups kingdoms of living things. Plants include familiar types such as trees, herbs, bushes, grasses, vines, ferns, mosses, and green algae. The scientific study of plants, known as botany"
            topicInfoText.isScrollEnabled = true
            
            searchButton.isEnabled = false
            searchButton.alpha = 0.5
        }
        
       else if animals_keywords.contains(text){
            topic = 2
            resultImage.image = UIImage(named: "\(arr[1][imageNumber])")
            searchTextField.text = ""
            topicInfoText.text  = "Animals are multicellular, eukaryotic organisms in the biological kingdom Animalia. With few exceptions, animals consume organic material, breathe oxygen, are able to move, can reproduce sexually, and go through an ontogenetic stage in which their body consists of a hollow sphere of cells, the blastula, during embryonic development"
        topicInfoText.isScrollEnabled = true
            searchButton.isEnabled = false
            searchButton.alpha = 0.5
        }
       else if beer_keywords.contains(text){
        topic = 3
        resultImage.image = UIImage(named: "\(arr[2][imageNumber])")
        searchTextField.text = ""
        topicInfoText.text = "Beer is one of the oldest and most widely consumed alcoholic drinks in the world, and the third most popular drink overall after water and tea. It is produced by the brewing and fermentation of starches, mainly derived from cereal grains—most commonly from malted barley, though wheat, maize (corn), rice, and oats are also used. "

        topicInfoText.isScrollEnabled = true
        searchButton.isEnabled = false
        searchButton.alpha = 0.5
       }
       else if car_keywords.contains(text){
        topic = 4
        resultImage.image = UIImage(named: "\(arr[3][imageNumber])")
        searchTextField.text = ""
        topicInfoText.text = "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods.Cars came into global use during the 20th century, and developed economies depend on them."
        topicInfoText.isScrollEnabled = true
        
        searchButton.isEnabled = false
        searchButton.alpha = 0.5
       }
       else if apple_keywords.contains(text){
        topic = 5
        resultImage.image = UIImage(named: "\(arr[4][imageNumber])")
        searchTextField.text = ""
        topicInfoText.text = "Apple Inc. is an American multinational technology company that specializes in consumer electronics, computer software, and online services. Apple is the world's largest technology company by revenue (totaling $274.5 billion in 2020) and, since January 2021, the world's most valuable company."

        topicInfoText.isScrollEnabled = true
        searchButton.isEnabled = false
        searchButton.alpha = 0.5
       }
       else{
        resultImage.image = UIImage(named: "search")
        moreImages.isHidden = true
        searchButton.isEnabled = false
        searchButton.alpha = 0.5
       }
        topicInfoText.textColor = UIColor.green
    }
    @IBAction func showMoreImagesBtn(_ sender: UIButton) {
        
        if topic == 1{
            imageNumber += 1
            if imageNumber < arr[0].count{
                resultImage.image = UIImage(named: "\(arr[0][imageNumber])")
            }
            if imageNumber == arr[0][0].count - 2 {
                sender.isEnabled =  false
                moreImages.isEnabled = false
                moreImages.alpha = 0.5
            }
        }
        else if topic == 2{
            imageNumber += 1
            if imageNumber < arr[1].count{
                resultImage.image = UIImage(named: "\(arr[1][imageNumber])")
            }
            if imageNumber == arr[0][1].count - 2{
                moreImages.isEnabled = false
                moreImages.alpha = 0.5
            }
        }
        else if topic == 3{
            imageNumber += 1
            if imageNumber < arr[2].count{
                resultImage.image = UIImage(named: "\(arr[2][imageNumber])")
            }
            if imageNumber == arr[0][2].count - 2{
                moreImages.isEnabled = false
                moreImages.alpha = 0.5
            }
        }
        
        else if topic == 4{
            imageNumber += 1
            if imageNumber < arr[3].count{
                resultImage.image = UIImage(named: "\(arr[3][imageNumber])")
            }
            if imageNumber == arr[0][3].count - 2{
                moreImages.isEnabled = false
                moreImages.alpha = 0.5
            }
        }
        else if topic == 5{
            imageNumber += 1
            if imageNumber < arr[4].count{
                resultImage.image = UIImage(named: "\(arr[4][imageNumber])")
            }
            if imageNumber == arr[0][4].count - 2{
                moreImages.isEnabled = false
                moreImages.alpha = 0.5
            }
        }
    }
    @IBAction func enterTextChanged(_ sender: UITextField) {
        
        if searchTextField.text!.isEmpty{
            searchButton.isEnabled = false
            searchButton.alpha = 0.5
        }
        else{
            searchButton.isEnabled = true
            searchButton.alpha = 1.0
            
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        resultImage.image = UIImage(named: "search")
        searchButton.isEnabled = false
        moreImages.isHidden = true
        topicInfoText.isHidden = true
        imageNumber = 0
        searchButton.alpha = 0.5
        moreImages.alpha = 0.5
        resetButton.isHidden = true
    }
    
}

