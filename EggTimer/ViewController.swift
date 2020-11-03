import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
   
    @IBOutlet weak var doneText: UILabel!
    @IBOutlet weak var startCounter: UIProgressView!
    
   
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
       
        totalTime = eggTimes[hardness]!
        startCounter.progress = 0.0
        secondsPassed = 0
        doneText.text = hardness
      
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            startCounter.progress = Float(secondsPassed) / Float(totalTime)
            
            
        }else {
            timer.invalidate()
            doneText.text = "DONE!"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }


   
   


}
