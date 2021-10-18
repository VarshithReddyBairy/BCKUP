//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by student on 9/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var crsNumLabel: UILabel!
    
    
    @IBOutlet weak var crsTitleLabel: UILabel!
    
    @IBOutlet weak var crsSemLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var i = 0
    let courses = [["44455","Java","fall"],
    ["44456","iOS","fall"],
    ["43563","Patterns","spring"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        previousButton.isEnabled = false
        imageView.image = UIImage(named: "image 01")
        crsNumLabel.text = courses[0][0]
        crsTitleLabel.text = courses[0][1]
        crsSemLabel.text = courses[0][2]
    }

    @IBAction func PreviousButtonPressed(_ sender: Any) {
        nextButton.isEnabled = true
        if (i > 0){
            imageView.image = UIImage(named: "image 0\(i)")
            i -= 1
            crsNumLabel.text = courses[i][0]
            crsTitleLabel.text = courses[i][1]
            crsSemLabel.text = courses[i][2]
            
        }
        if (i == 0){
            previousButton.isEnabled = false
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if (i < courses.count-1){
            i += 1
            imageView.image = UIImage(named: "image 0\(i+1)")
            crsNumLabel.text = courses[i][0]
            crsTitleLabel.text = courses[i][1]
            crsSemLabel.text = courses[i][2]
            
        }
        if (i == courses.count-1){
            nextButton.isEnabled = false
        }
        previousButton.isEnabled = true
        
    }
}

