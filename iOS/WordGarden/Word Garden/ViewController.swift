//
//  ViewController.swift
//  Word Garden
//
//  Created by Varshith Reddy Bairy.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordsGuessedLabel: UILabel!
    
    @IBOutlet weak var wordsMissedLabel: UILabel!
    
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    
    @IBOutlet weak var totalWordsLabel: UILabel!
    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordsToGuess = [["SWIFT","A programming language"],
                        ["DOG","A animal"]]
    var hint = ""
    
    var wordToGuess = ""
    var wordToGuessIndex = 0
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    var wordsGuessedCount = 0
    var wordsMissedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordToGuess = wordsToGuess[wordToGuessIndex][0]
        hint = wordsToGuess[wordToGuessIndex][1]
        hintLabel.text = "HINT: " + hint
        
        totalWordsLabel.text = "Words in Game: \(wordsToGuess.count)"
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        
        playAgainButton.isHidden = true
    }

   
    
    func updateWordCountLabels(){
        
        wordsMissedLabel.text = "Words Missed: \(wordsMissedCount)"
        wordsGuessedLabel.text = "Words Guessed: \(wordsGuessedCount)"
        
        wordsRemainingLabel.text = "Words Remaining: \(wordsToGuess.count - (wordsGuessedCount + wordsMissedCount))"
    }
    
    func updateUIAfterGuess(){
        
        guessedLetterField.resignFirstResponder()
        
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1
        
        
        let currentLetterGuessed = guessedLetterField.text!
        
        if !wordToGuess.contains(currentLetterGuessed) {
            
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            
        }
        
        let revealedWord = userGuessLabel.text!
        
        if wrongGuessesRemaining == 0 {
            
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            
            guessCountLabel.text = "You're all out of guesses. Try again?"
            wordsMissedCount += 1
            updateWordCountLabels()
        } else if !revealedWord.contains("_") {
           
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
            wordsGuessedCount += 1
            updateWordCountLabels()
        } else {
            // Update our guess count
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You've Made \(guessCount) \(guess)"
        }
        
        if (wordsGuessedCount + wordsMissedCount) == wordsToGuess.count {
            guessCountLabel.text = "You've tried all of the words! Restart from the beginning?"
        }
    }
    
  
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        
        wordToGuessIndex += 1
        if wordToGuessIndex == wordsToGuess.count {
            wordToGuessIndex = 0
            wordsGuessedCount = 0
            wordsMissedCount = 0
            updateWordCountLabels()
        }
        wordToGuess = wordsToGuess[wordToGuessIndex][0]
        hint = wordsToGuess[wordToGuessIndex][1]
        hintLabel.text = "HINT: " + hint
        
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
}

