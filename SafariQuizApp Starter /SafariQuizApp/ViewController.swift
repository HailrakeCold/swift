import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    
    let question : [QuestionModel] = [
        QuestionModel(image: UIImage(named: "lion")!, correctAnswer: 2, answer1: "Mako", answer2: "lion", answer3: "MeowMeow"),
        QuestionModel(image: UIImage(named: "giraffe")!, correctAnswer: 1, answer1: "Giraffe", answer2: "lion", answer3: "MeowMeow"),
        QuestionModel(image: UIImage(named: "buffalo")!, correctAnswer: 3, answer1: "Giraffe", answer2: "lion", answer3: "Buffalo"),
        
    ]
    var score = 0
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScoreLabel()
        setupQuestion()
    }
    func updateScoreLabel() {
            scoreLabel.text = "Score: \(score)"
        }
    
    
    func setupQuestion(){
        let nextQuestion = question[currentQuestionIndex]
        questionImageView.image = nextQuestion.image
        answerOneButton.setTitle(nextQuestion.answer1, for: .normal)
        answerTwoButton.setTitle(nextQuestion.answer2, for: .normal)
        answerThreeButton.setTitle(nextQuestion.answer3, for: .normal)
    }
    
    func nextQuestion() {
            currentQuestionIndex += 1
            if currentQuestionIndex >= question.count {
                showAlert(title: "End of Quiz", message: "Your final score is \(score) out of \(question.count)", restart: true)
            } else {
                setupQuestion()
            }
        }
    
    func showAlert(title: String, message: String, restart: Bool = false) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: restart ? "Restart" : "Ok", style: .default) { _ in
                if restart {
                    self.score = 0
                    self.currentQuestionIndex = 0
                    self.updateScoreLabel()
                    self.setupQuestion()
                } else {
                    self.nextQuestion()
                }
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    
    func check(selectedAnswer answer: Int) {
         let currentQuestion = question[currentQuestionIndex]
         
         if currentQuestion.correctAnswer == answer {
             score += 1
             updateScoreLabel()
             showAlert(title: "Correct", message: "You are doing great!")
         } else {
             showAlert(title: "Wrong", message: "Try again!")
         }
     }
      
    
    
    @IBAction func answerOneButtonTapped(_ sender: Any) {
        check(selectedAnswer: 1)}
    @IBAction func answerTwoButtonTapped(_ sender: Any) {
        check(selectedAnswer: 2)}
    @IBAction func answerThreeButtontTapped(_ sender: Any) {
        check(selectedAnswer: 3)}
}

