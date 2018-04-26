
import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var eventLogLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var northButton: UIButton!
    @IBOutlet weak var southButton: UIButton!
    @IBOutlet weak var eastButton: UIButton!
    @IBOutlet weak var westButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var specialEventLabel: UILabel!
   
    @IBOutlet weak var restartBackground: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var southBorder: UIView!
    @IBOutlet weak var northBorder: UIView!
    @IBOutlet weak var westBorder: UIView!
    @IBOutlet weak var eastBorder: UIView!
    
    @IBOutlet weak var titleOuterBorder: UIView!
    @IBOutlet weak var titleInnerBorder: UIView!
    @IBOutlet weak var backgroundColorView: UIView!
    
    // TODO: Set up any properties needed
    let model = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveLabel.isHidden = true
        restartButton.isEnabled = false
        specialEventLabel.isHidden = true
        backgroundColorView.backgroundColor = UIColor.brown
        restartBackground.layer.cornerRadius = 10
        titleInnerBorder.layer.cornerRadius = 10
        titleOuterBorder.layer.cornerRadius = 10
        northBorder.layer.cornerRadius = 10
        southBorder.layer.cornerRadius = 10
        westBorder.layer.cornerRadius = 10
        eastBorder.layer.cornerRadius = 10
       

        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    // TODO: Connect IBActions
    
    @IBAction func northButtonTapped(_ sender: UIButton) {
        restartButton.isEnabled = true
        model.move(direction: .north)
        moveLabel.text = "Moved North"
        moveLabel.isHidden = false
        coordinatesLabel.text = "(x: \(model.currentLocation().x - 2),  y: \(model.currentLocation().y - 2))"
        updateAllowedDirections()
    }
    @IBAction func southButtonTapped(_ sender: UIButton) {
        restartButton.isEnabled = true
        model.move(direction: .south)
        moveLabel.text = "Moved South"
        moveLabel.isHidden = false
        coordinatesLabel.text = "(x: \(model.currentLocation().x - 2),  y: \(model.currentLocation().y - 2))"
        updateAllowedDirections()
    }
    @IBAction func eastButtonTapped(_ sender: UIButton) {
        restartButton.isEnabled = true
        model.move(direction: .east)
        moveLabel.text = "Moved East"
        moveLabel.isHidden = false
        coordinatesLabel.text = "(x: \(model.currentLocation().x - 2),  y: \(model.currentLocation().y - 2))"
        updateAllowedDirections()
    }
    @IBAction func westButtonTapped(_ sender: UIButton) {
        restartButton.isEnabled = true
        model.move(direction: .west)
        moveLabel.text = "Moved West"
        moveLabel.isHidden = false
        coordinatesLabel.text = "(x: \(model.currentLocation().x - 2),  y: \(model.currentLocation().y - 2))"
        updateAllowedDirections()
    }
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        restartButton.isEnabled = false
        moveLabel.isHidden = true
        model.restart()
        coordinatesLabel.text = "(x: \(model.currentLocation().x - 2),  y: \(model.currentLocation().y - 2))"
        northButton.isEnabled = true
        southButton.isEnabled = true
        eastButton.isEnabled = true
        westButton.isEnabled = true
        specialEventLabel.isHidden = true
        backgroundColorView.backgroundColor = UIColor.brown
        northBorder.alpha = 1
        southBorder.alpha = 1
        westBorder.alpha = 1
        eastBorder.alpha = 1
    }
    
    // TODO: If you have any other methods, write them below here
    private func updateAllowedDirections() {
        northButton.isEnabled = false
        southButton.isEnabled = false
        eastButton.isEnabled = false
        westButton.isEnabled = false
        specialEventLabel.isHidden = true
        backgroundColorView.backgroundColor = UIColor.brown
        northBorder.alpha = 0.30
        southBorder.alpha = 0.30
        westBorder.alpha = 0.30
        eastBorder.alpha = 0.30
        for direction in model.currentLocation().allowedDirections {
            if direction == .north {
                northButton.isEnabled = true
                northBorder.alpha = 1
            }
            if direction == .south {
                southButton.isEnabled = true
                southBorder.alpha = 1
            }
            if direction == .east {
                eastButton.isEnabled = true
                eastBorder.alpha = 1
            }
            if direction == .west {
                westButton.isEnabled = true
                westBorder.alpha = 1
                
            }
        }
        if let anEvent = model.currentLocation().event {
            specialEventLabel.text = anEvent
            backgroundColorView.backgroundColor = UIColor.red
            specialEventLabel.isHidden = false
            }



        
    }
    
}

