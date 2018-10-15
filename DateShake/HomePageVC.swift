//
//  HomePageVC.swift
//  DateShake
//
//  Created by Manoj Muthireddy on 12/27/17.
//  Copyright © 2017 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import UserNotifications
import MessageUI

class HomePageVC: UIViewController, CLLocationManagerDelegate,MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var romanticButton: UIButton!
    @IBOutlet weak var friendlyButton: UIButton!
    @IBOutlet weak var sendText: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let urlCounterparts = [
        "http://www.rockbuilt.org/":"Rock Built"
    ]
    let url = URL(string: "http://www.rockbuilt.org/")
    
    let locationManager = CLLocationManager()
    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        gifImage.loadGif(name: "starLoop")
        
        friendlyButton.layer.borderColor = UIColor.white.cgColor
        friendlyButton.layer.borderWidth = 5.0
        friendlyButton.layer.cornerRadius = 40.0
        romanticButton.layer.borderColor = UIColor.white.cgColor
        romanticButton.layer.borderWidth = 5.0
        romanticButton.layer.cornerRadius = 40.0
        sendText.layer.borderColor = UIColor.white.cgColor
        sendText.layer.borderWidth = 2.0
        sendText.layer.cornerRadius = 20.0
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
            self.displayTags()
            self.findMyLocation()
        } else {
            print("First launch, setting UserDefault.")
            self.defaultAlert()
            self.romanticButton.isHidden = true
            self.friendlyButton.isHidden = true
            //self.urlLink.isHidden = true
        }
        
    }
    @IBAction func goToURL(_ sender: Any) {
        UIApplication.shared.open(url!)
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
    
    
    @IBAction func gotoDatePage(_ sender: Any) {
        performSegue(withIdentifier: "romanticSegue", sender: self)
    }
    
    @IBAction func gotoFriendPage(_ sender: Any) {
        performSegue(withIdentifier: "friendlySegue", sender: self)
    }
    
    func defaultAlert(){
        var accepted = false
        let alert = UIAlertController(title: "Welcome!", message: "Please review our terms & conditions and hit Accept to continue using this App", preferredStyle: .alert)
        
        //let backView = alert.view.subviews.last?.subviews.last
        //backView?.layer.cornerRadius = 10.0
        //backView?.backgroundColor = UIColor.gray
        
        let myString  = "Welcome!"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Arial", size: 24.0)!])
        //myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), range: NSRange(location:0,length:myString.count))
        alert.setValue(myMutableString, forKey: "attributedTitle")
        
        let message = "\nPlease review our terms & conditions and hit Accept to continue using this App"
        
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Arial", size: 20.0)!])
        //messageMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:message.count))
        alert.setValue(messageMutableString, forKey: "attributedMessage")
        
        
        let action1 = UIAlertAction(title: "Accept", style: .default) { (action) in
            accepted = true
            //self.acceptAlert()
            self.displayTags()
            self.findMyLocation()
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        action1.setValue(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), forKey: "titleTextColor")
        let action2 = UIAlertAction(title: "Decline", style: .cancel) { (action) in
            self.declineAlert()
        }
        action2.setValue(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), forKey: "titleTextColor")
        let action3 = UIAlertAction(title: "Review Terms & Conditions", style: .default) { (action) in
            self.termsAlert()
        }
        action3.setValue(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), forKey: "titleTextColor")
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true, completion: nil)
    }
    func displayTags(){
        //self.urlLabel.text = urlCounterparts["Rock Built"]
        self.romanticButton.isHidden = false
        self.friendlyButton.isHidden = false
        //self.romanticButton.frame = 
        //self.urlLink.setTitle("http://www.rockbuilt.org/", for: .normal)
    }
    
    func termsAlert(){
        //var reviewed = false
        let alert2 = UIAlertController(title: "Terms & Conditions", message: "This is testing message.", preferredStyle: .actionSheet)
        
        let myString  = "Terms & Conditions"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Arial", size: 24.0)!])
        myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.black, range: NSRange(location:0,length:myString.count))
        alert2.setValue(myMutableString, forKey: "attributedTitle")

        let message  = "1. Introduction: The Date Shake application is a fun dating app that brings old-school romance back to dating. Date Shake is available from the Apple App Store\n By accessing or downloading the App, you agree to be bound by these Terms of Use (“Terms”). If you do not agree with these Terms, you should stop using Date Shake immediately. \n 2. Eligibility: In order to use the Date Shake App you must (i) be 18 years old or older; "
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Arial", size: 20.0)!])
        messageMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.black, range: NSRange(location:0,length:message.count))
        alert2.setValue(messageMutableString, forKey: "attributedMessage")

        
        let action1 = UIAlertAction(title: "Accept", style: .default){ (action) in
            //self.defaultAlert()
            self.displayTags()
            self.findMyLocation()
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        //action1.setValue(UIColor.blue, forKey: "titleTextColor")
        let action2 = UIAlertAction(title: "Decline", style: .default){ (action) in
            self.declineAlert()
        }
        //action2.setValue(UIColor.blue, forKey: "titleTextColor")
        alert2.addAction(action1)
        alert2.addAction(action2)
        present(alert2, animated: true, completion: nil)
    }
    
    
    func declineAlert(){
        let alert3 = UIAlertController(title: "Are you Sure?", message: "\n Sorry!!!\n\n Declining will prevent us from allowing you access to the app. Select ‘Back’ to go to previous screen.", preferredStyle: .alert)
        
        let myString  = "Are you Sure?"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Arial", size: 24.0)!])
        myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:myString.count))
        alert3.setValue(myMutableString, forKey: "attributedTitle")
        
        let message  = "\n Sorry!!!\n\n Declining will prevent us from allowing you access to the app. Select ‘Back’ to go to previous screen."
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Arial", size: 20.0)!])
        messageMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:message.count))
        alert3.setValue(messageMutableString, forKey: "attributedMessage")
        
        let action1 = UIAlertAction(title: "Back to the welcome screen", style: .default){ (action) in
            self.defaultAlert()
        }
        alert3.addAction(action1)
        present(alert3, animated: true, completion: nil)
    }
    
    func findMyLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0]
                //self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            
            let alert = UIAlertController(title: "Welcome to "+locality!+"!", message: "", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
            
            // change to desired number of seconds (in this case 5 seconds)
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when){
                // your code with delay
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func acceptAlert(){
        let acceptalert = UIAlertController(title: "Location services", message: "To receive discounts from our participants, please select ‘Enable’ button to  enable location services", preferredStyle: .actionSheet)
        
        let enableAction = UIAlertAction(title: "Enable", style: .default) { (_) -> Void in
            
            //self.displayTags()
            //self.findMyLocation()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default){ (action) in
            self.cancelAlert()
        }
        acceptalert.addAction(enableAction)
        acceptalert.addAction(cancelAction)
        present(acceptalert, animated: true, completion: nil)
    }
    
    func cancelAlert(){
        let alert2 = UIAlertController(title: "Are you Sure", message: "We can serve you better by having location data", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Yes", style: .default){ (action) in
            self.displayTags()
        }
        let action2 = UIAlertAction(title: "No", style: .default){ (action) in
            self.acceptAlert()
        }
        alert2.addAction(action1)
        alert2.addAction(action2)
        present(alert2, animated: true, completion: nil)
    }
    
}
