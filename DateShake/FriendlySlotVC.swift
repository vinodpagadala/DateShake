//
//  FriendlySlotVC.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 1/13/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import MessageUI
import AVFoundation
import GoogleMobileAds

class FriendlySlotVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, MFMessageComposeViewControllerDelegate{
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var dateStrings = [String]()
    var payerStrings = [String]()
    
    let defaults = UserDefaults.standard
    var random1:Int!
    var random2:Int!
    var menuShowing = false
    var dateLocked = false
    var payerLocked = false
    var timer=Timer()
    var counter=0
    var mute = false
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var bannerView1: GADBannerView!
    
    @IBOutlet weak var payerLock: UIButton!
    @IBOutlet weak var dateLock: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var whatLabel: UILabel!
    @IBOutlet weak var howLabel: UILabel!
    @IBOutlet weak var payerLockView: UIView!
    @IBOutlet weak var dateLockView: UIView!
    @IBOutlet weak var dateOptions: UIPickerView!
    @IBOutlet weak var payerOptions: UIPickerView!
    
    @IBOutlet weak var slotContainerView: UIView!
    @IBOutlet weak var innerSlotContainer: UIView!
    
    @IBOutlet weak var shakeButton: UIButton!
    @IBOutlet weak var datePartnerButton: UIButton!
    @IBOutlet weak var premiumFunButton: UIButton!
    @IBOutlet weak var travelEscapeButton: UIButton!
    @IBOutlet weak var textAppButton: UIButton!
    
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bannerView1.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView1.rootViewController = self
        bannerView1.load(GADRequest())
    }
    
    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        gifImage.loadGif(name: "friendlyBG")
        
        viewTopConstraint.constant = -153
        dateOptions.delegate = self
        dateOptions.dataSource = self
        
        payerOptions.delegate = self
        payerOptions.dataSource = self
        
        dateStrings = friendlySlotOptions
        payerStrings = payerSlotOptions
        //self.shakeButton.layer.cornerRadius = 3
        //self.sendText.layer.cornerRadius = 3
        
        slotContainerView.layer.borderColor = UIColor.white.cgColor
        slotContainerView.layer.borderWidth = 3.0
        slotContainerView.layer.cornerRadius = 8.0
        innerSlotContainer.layer.borderColor = UIColor.white.cgColor
        innerSlotContainer.layer.borderWidth = 3.0
        innerSlotContainer.layer.cornerRadius = 8.0
        let origImage = UIImage(named: "padlock50")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        payerLock.setImage(tintedImage, for: .normal)
        payerLock.tintColor = .white
        
        dateLock.setImage(tintedImage, for: .normal)
        dateLock.tintColor = .white
        
        dateLockView.layer.borderColor = UIColor.white.cgColor
        dateLockView.layer.borderWidth = 2.0
        dateLockView.layer.cornerRadius = 8.0
        payerLockView.layer.borderColor = UIColor.white.cgColor
        payerLockView.layer.borderWidth = 2.0
        payerLockView.layer.cornerRadius = 8.0
        payerOptions.layer.borderColor = UIColor.white.cgColor
        payerOptions.layer.borderWidth = 2.0
        payerOptions.layer.cornerRadius = 2.0
        dateOptions.layer.borderColor = UIColor.white.cgColor
        dateOptions.layer.borderWidth = 2.0
        dateOptions.layer.cornerRadius = 2.0
        whatLabel.layer.borderColor = UIColor.white.cgColor
        whatLabel.layer.borderWidth = 2.0
        whatLabel.layer.cornerRadius = 2.0
        howLabel.layer.borderColor = UIColor.white.cgColor
        howLabel.layer.borderWidth = 2.0
        howLabel.layer.cornerRadius = 2.0
        
        shakeButton.layer.borderColor = UIColor.white.cgColor
        shakeButton.layer.borderWidth = 3.0
        shakeButton.layer.cornerRadius = 20.0
        datePartnerButton.layer.borderColor = UIColor.white.cgColor
        datePartnerButton.layer.borderWidth = 3.0
        datePartnerButton.layer.cornerRadius = 20.0
        premiumFunButton.layer.borderColor = UIColor.white.cgColor
        premiumFunButton.layer.borderWidth = 3.0
        premiumFunButton.layer.cornerRadius = 20.0
        travelEscapeButton.layer.borderColor = UIColor.white.cgColor
        travelEscapeButton.layer.borderWidth = 3.0
        travelEscapeButton.layer.cornerRadius = 20.0
        textAppButton.layer.borderColor = UIColor.white.cgColor
        textAppButton.layer.borderWidth = 2.0
        textAppButton.layer.cornerRadius = 20.0
        
        
        
        /*let origImage2 = UIImage(named: "lineMenu50")
        let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
        menuButton.setImage(tintedImage2, for: .normal)
        menuButton.tintColor = UIColor(red:1.00, green:0.67, blue:0.12, alpha:1.0)*/
        
        let slotSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "slotSounds", ofType: "mp3")!)
        
        audioPlayer = try! AVAudioPlayer(contentsOf: slotSound as URL)
        //audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
        audioPlayer.prepareToPlay()
    }
    
    @IBAction func lockDateAction(_ sender: Any) {
        let origImage = UIImage(named: "padlock50")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        let origImage1 = UIImage(named: "lock50")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        
        
        
        if(self.dateLocked == false){
            self.dateLocked = true
            
            dateLock.setImage(tintedImage1, for: .normal)
            dateLock.tintColor = .white
        }else{
            self.dateLocked = false
            
            dateLock.setImage(tintedImage, for: .normal)
            dateLock.tintColor = .white
        }
        
    }
    
    @IBAction func lockPayerAction(_ sender: Any) {
        
        let origImage = UIImage(named: "padlock50")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        let origImage1 = UIImage(named: "lock50")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        
        
        
        if(self.payerLocked == false){
            self.payerLocked = true
            
            payerLock.setImage(tintedImage1, for: .normal)
            payerLock.tintColor = .white
        }else{
            self.payerLocked = false
            
            payerLock.setImage(tintedImage, for: .normal)
            payerLock.tintColor = .white
        }
    }
    
    
    @IBAction func sendSMS(_ sender: Any) {
        if MFMessageComposeViewController.canSendText(){
            let composeVC = MFMessageComposeViewController()
            
            // Configure the fields of the interface.
            composeVC.recipients = ["4085551212"]
            composeVC.body = "Hello from California!"
            composeVC.messageComposeDelegate = self
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }
        else{
            print("Cannot Send Text")
        }
    }
    
    @IBAction func muteSoundMethod(_ sender: Any) {
        if (defaults.object(forKey: "muteSounds") as? Bool) != nil
        {
            defaults.set(true, forKey: "muteSounds")
        }
        else if (defaults.object(forKey: "muteSounds") as? Bool) == false{
            defaults.set(true, forKey: "muteSounds")
        }
        else{
            defaults.set(true, forKey: "muteSounds")
        }
        self.toggleOptions()
    }
    
    @IBAction func unmuteSoundMethod(_ sender: Any) {
        if (defaults.object(forKey: "muteSounds") as? Bool) != nil
        {
            defaults.set(false, forKey: "muteSounds")
        }
        else if (defaults.object(forKey: "muteSounds") as? Bool) == true{
            defaults.set(false, forKey: "muteSounds")
        }
        else{
            defaults.set(false, forKey: "muteSounds")
        }
        self.toggleOptions()
    }
    

    @IBAction func showOptions(_ sender: Any) {
        
        self.toggleOptions()
        
        /*if(menuShowing){
            viewTopConstraint.constant = -153
        }else{
            viewTopConstraint.constant = 53
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing*/
    }
    
    public func toggleOptions(){
        if(menuShowing){
            viewTopConstraint.constant = -153
        }else{
            viewTopConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dateOptions {
            return dateStrings.count
        } else if pickerView == payerOptions {
            return payerStrings.count
        }else{
            return 1
        }
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dateOptions {
            return dateStrings[row]
        } else if pickerView == payerOptions {
            return payerStrings[row]
        }
        else{
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //let myView = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width - 30, height: 60))
        
        //let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        let image = UIImage(named: "slot background")!
        
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.clear
        imageView.frame = CGRect(x:0, y:0, width:image.size.width, height:image.size.height)
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        //let hue = CGFloat(row)/CGFloat(dateStrings.count)
        //pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
        label.textColor = .white
            //UIColor(red:1.00, green:0.67, blue:0.12, alpha:1.0)
        label.textAlignment = .center
        label.font = UIFont(name: "Exo2-ExtraBold", size: 17)
        label.backgroundColor = UIColor(red:0.43, green:0.42, blue:0.42, alpha:0.5)
            //UIColor(hue: 0.1306, saturation: 0.9, brightness:1.0, alpha: 1.0)
        //UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
        
        if pickerView == dateOptions {
            label.text = dateStrings[row]
        } else if pickerView == payerOptions {
            label.text = payerStrings[row]
        }else{
            
        }
        
        /*UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0);
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imageWithText = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        myImageView.image = imageWithText
        myView.addSubview(myImageView)*/
        
        return label
    }
    
    func textToImage(drawText text: NSString, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font.rawValue: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as! [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    @IBAction func shakeButtonClick(_ sender: UIButton) {
        //self.shakeAction()
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: shakeButton.center.x - 10, y: shakeButton.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: shakeButton.center.x + 10, y: shakeButton.center.y))
        
        shakeButton.layer.add(animation, forKey: "position")
        let muteSounds = defaults.bool(forKey: "muteSounds")
        if(muteSounds == false){
            self.audioPlayer.play()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(FriendlySlotVC.updateRandom), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    @objc func updateRandom(){
        if(counter >= 1 && counter <= 800){
            self.shakeAction()
        }
        if(counter > 800){
            self.ReTime()
        }
        counter += 1
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake{
            //self.shakeAction()
            let muteSounds = defaults.bool(forKey: "muteSounds")
            if(muteSounds == false){
                self.audioPlayer.play()
            }
            
            timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(FriendlySlotVC.updateRandom), userInfo: nil, repeats: true)
        }
    }
    
    public func shakeAction(){
        let datepickerViewMiddle = dateStrings.count
        let payerpickerViewMiddle = payerStrings.count
        print ("Shake")
        print (datepickerViewMiddle)
        print (payerpickerViewMiddle)
        random1=Int(arc4random_uniform(UInt32(datepickerViewMiddle)+1))
        random2=Int(arc4random_uniform(UInt32(payerpickerViewMiddle)+1))
        //random1=Int(arc4random_uniform(UInt32(4)+1))
        dateOptions.selectRow(random1-1, inComponent: 0, animated: true)
        let when = DispatchTime.now() + 1.0 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            self.payerOptions.selectRow(self.random2-1, inComponent: 0, animated: true)
        }
        
        print(random1)
        print(random2)
        
        if (UserDefaults.standard.object(forKey: "ShakeCount") as? Int) != nil
        {
            var x = UserDefaults.standard.object(forKey: "ShakeCount") as? Int
            x = x!+1;
            UserDefaults.standard.set(x, forKey: "ShakeCount")
        }
        else{
            UserDefaults.standard.set(1, forKey: "ShakeCount")
        }
    }
    
    func ReTime()
    {
        timer.invalidate()
        counter=0
        
    }
}
/*extension UIButton {
    func shakeAnimation() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}*/
