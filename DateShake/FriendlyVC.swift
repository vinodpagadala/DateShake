//
//  FriendlyVC.swift
//  DateShake
//
//  Created by Manoj Muthireddy on 12/27/17.
//  Copyright © 2017 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import MessageUI
import GoogleMobileAds


var friendlySlotOptions = [String]()
class FriendlyVC: UIViewController, MFMessageComposeViewControllerDelegate{
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    
    
    @IBOutlet weak var eatsButton: UIButton!
    @IBOutlet weak var physicalButton: UIButton!
    @IBOutlet weak var culturalButton: UIButton!
    @IBOutlet weak var mysteryButton: UIButton!
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    let defaults = UserDefaults.standard
    var menuShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        gifImage.loadGif(name: "friendlyBG")
        viewTopConstraint.constant = -165
        textButton.layer.borderColor = UIColor.white
            .cgColor
        textButton.layer.borderWidth = 2.0
        textButton.layer.cornerRadius = 20.0
        
        eatsButton.layer.borderColor = UIColor.white.cgColor
        eatsButton.layer.borderWidth = 4.0
        eatsButton.layer.cornerRadius = 28.0
        physicalButton.layer.borderColor = UIColor.white.cgColor
        physicalButton.layer.borderWidth = 4.0
        physicalButton.layer.cornerRadius = 28.0
        culturalButton.layer.borderColor = UIColor.white.cgColor
        culturalButton.layer.borderWidth = 4.0
        culturalButton.layer.cornerRadius = 28.0
        mysteryButton.layer.borderColor = UIColor.white.cgColor
        mysteryButton.layer.borderWidth = 4.0
        mysteryButton.layer.cornerRadius = 28.0
        
        /*let origImage2 = UIImage(named: "lineMenu50")
        let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
        menuButton.setImage(tintedImage2, for: .normal)
        menuButton.tintColor = UIColor(red:1.00, green:0.67, blue:0.12, alpha:1.0)*/
            //UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
        
    }
    
    @IBAction func showOptions(_ sender: Any) {
        self.toggleOptions()
        /*if(menuShowing){
            viewTopConstraint.constant = -165
        }else{
            viewTopConstraint.constant = 65
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing*/
    }
    
    public func toggleOptions(){
        if(menuShowing){
            viewTopConstraint.constant = -165
        }else{
            viewTopConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
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
    
    @IBAction func EatsAction(_ sender: Any) {
        let diningOptions = ["Tasty Fried Chicken",
                             "Bar-B-Que",
                             "Make A Pizza",
                             "Healthy Kitchen",
                             "Snack Attack",
                             "Savory Seafood",
                             "Make A Dinner",
                             "Bakery Treats",
                             "Anytime Asian",
                             "Make Cookies",
                             "Take-Out",
                             "Purge The Pantry",
                             "Grecian Creations",
                             "Go Pho",
                             "Just Get Groceries",
                             "We Scream For Ice Cream",
                             "Make A Pie or Cake",
                             "Prime Time Steak",
                             "Ethiopian Cuisine",
                             "Gas Station Food",
                             "Bueno Italiano",
                             "Guilty Pleasure (Anything!)",
                             "Dessert",
                             "Lunch Break",
                             "Gelato",
                             "Deli Delight",
                             "Classy Café",
                             "Do A Cultural Cuisine",
                             "Fresh Sushi",
                             "Chocolatier",
                             "Frozen Yogurt",
                             "Make Something New",
                             "Make A Family Recipe",
                             "Dynamite Diner",
                             "Brunch Crunch",
                             "Wine Will Be Fine",
                             "Picnic",
                             "Brazilian Bounty",
                             "Local Pub",
                             "Drive-In",
                             "Ragin Cajun",
                             "Mexican Cuisine",
                             "Order-In",
                             "Fast Food Fun",
                             "Breakfast Anytime",
                             "Lebanese Love",
                             "Java Joint",
                             "Boba Tea",
                             "Sweet Sandwich",
                             "Craft Kabobs",
                             "Pizza Power",
                             "Doughnuts & Bagels",
                             "Try A New Restaurant",
                             "French Oui Oui",
                             "Binge",
                             "Grilled Cheese Challenge",
                             "Best Burger",
                             "Plan a Dinner Party",
                             "Chili Contest",
                             "Food Truck",
                             "Magical Mediterranean",
                             "Burmese For Me’s",
                             "Share 1 Meal",
                             "Freeing Korean",
                             "Middle Eastern",
                             "Bake Cupcakes",
                             "Southern Goodness",
                             "Wings & Things",
                             "Say Cheese (and Wine!)",
                             "Supersonic Salads",
                             "Protein / Energy Shake",
                             "Tantalizing Tacos",
                             "Happy Hour",
                             "Premier Bar Cuisine"]
        
        friendlySlotOptions = diningOptions
        performSegue(withIdentifier: "eatsSegue", sender: self)
    }
    
    @IBAction func PhysicalAction(_ sender: Any) {
        let activityOptions = ["Bowling",
                               "Frisbee Golf",
                               "Water Aerobics",
                               "Self Defense",
                               "Horse Riding",
                               "Row Boating",
                               "Workout",
                               "3K Or 5K Run",
                               "Snow Skiing",
                               "Go For A Run",
                               "Roller Skate",
                               "Archery",
                               "Arm Wrestling",
                               "Bike Ride",
                               "Game of Horse",
                               "Martial Arts",
                               "White Water Rafting",
                               "Jumping Rope",
                               "Take a Walk",
                               "Yoga",
                               "Trail Running",
                               "Ice Skating",
                               "Boxing",
                               "Zumba",
                               "Hot Yoga",
                               "Table Tennis",
                               "Cross Train",
                               "Sailing",
                               "Ballet",
                               "Fencing",
                               "Foot Race",
                               "Plant A Tree",
                               "Paddle Boarding",
                               "Punt, Pass & Kick",
                               "Air Hockey",
                               "Cryo Experience",
                               "Power Lifting",
                               "BMX Biking",
                               "Cycling",
                               "Diving",
                               "Wrestling",
                               "Mud Run",
                               "Golfing",
                               "Laser Tag",
                               "Super Marathon",
                               "Double Dutch",
                               "Hiking",
                               "Golf Range",
                               "Gymnastics",
                               "Basketball Game",
                               "Jet Skis",
                               "Badminton",
                               "Nature Walk",
                               "Kayaking",
                               "Tennis",
                               "Snowboard",
                               "Tubbing",
                               "Camping",
                               "Helicopter Ride",
                               "Paddle Boat",
                               "Marathon",
                               "Water Skiing",
                               "Target Shooting",
                               "Indoor Rock Climbing",
                               "Skateboarding",
                               "Triathlon",
                               "Baseball Game",
                               "Volleyball",
                               "Soccer Game",
                               "Jai Alai",
                               "Kickboxing",
                               "Scuba",
                               "Trampoline Park",
                               "Cricket",
                               "Pogo Stick Contest",
                               "Half Marathon",
                               "Hockey Game",
                               "Football Game",
                               "Ride Go Karts",
                               "Tai Chi",
                               "Fishing",
                               "Kung-Fu",
                               "Pool Party",
                               "Roller Rink",
                               "Water Park",
                               "Surfboarding",
                               "Sky Diving",
                               "Horse Shoes",
                               "Swimming",
                               "Canoeing",
                               "Visit a Park",
                               "Paintball",
                               "Kick A Field Goal"]
        
        friendlySlotOptions = activityOptions
        performSegue(withIdentifier: "activitySegue", sender: self)
    }
    
    @IBAction func CulturalAction(_ sender: Any) {
        let culturalOptions = ["Historical Site",
                               "Magic Show",
                               "Open Mic Event",
                               "Attend A Polo Match",
                               "Theater",
                               "Jazz Club",
                               "Opera",
                               "National Park",
                               "See a Band",
                               "Trivial Pursuit",
                               "Arboretum",
                               "Movies (Or Movie Grill)",
                               "Resale Shop",
                               "Renaissance Fair",
                               "Aquarium",
                               "Board Game",
                               "Auto Show",
                               "Nature Walk",
                               "NASCAR Event",
                               "Get Tattoo",
                               "Concert",
                               "Horse Carriage Ride",
                               "Shopping",
                               "Art Showing",
                               "Cigar Bar",
                               "Charity Event",
                               "Theme Park",
                               "Go To Painting Studio",
                               "Worship Together",
                               "Presidential Museum",
                               "Fortune Teller",
                               "Karaoke",
                               "Look at Family Albums",
                               "Drive-In Movie",
                               "Attend Fund Raiser",
                               "Country Bar",
                               "Blues Bar",
                               "Vegas",
                               "Horse Riding",
                               "Visit a Park",
                               "Holiday Event",
                               "Get Piercing",
                               "Ballet",
                               "Miniature Golf",
                               "Comedy Show",
                               "Sporting Event",
                               "Festival",
                               "Street Festival",
                               "Poker Tournament",
                               "Poolside",
                               "Wax Museum",
                               "Boat Show",
                               "Casino / Gaming",
                               "Pray Together",
                               "Plant Flowers",
                               "Hookah Bar",
                               "Museum",
                               "Plan a Party"
        ]
        
        friendlySlotOptions = culturalOptions
        print(friendlySlotOptions[2])
        performSegue(withIdentifier: "cultureSegue", sender: self)
    }
    
    @IBAction func SurpriseAction(_ sender: Any) {
        let surpriseOptions = ["Cigar Bar",
                               "Escape Experience",
                               "Charades Event",
                               "Visit a Park",
                               "Darts",
                               "Race Car Driving",
                               "Baggo Game",
                               "Worship Together",
                               "Shuffleboard",
                               "Charity Event",
                               "Haunted House Tour",
                               "Facial Mask",
                               "Bowling",
                               "Teeth Whitening",
                               "Wash Car",
                               "Zoo",
                               "Champagne Toast",
                               "Laser Tag",
                               "Spa Treatment",
                               "Make A Funny Video",
                               "Buy Outfits",
                               "Share A Secret",
                               "Game of Washers",
                               "Shooting Range",
                               "Plan A Vacation",
                               "Sky Diving",
                               "Dress Like It's the 70’s",
                               "Horse Shoes",
                               "Billiards",
                               "Make Beer",
                               "Scavenger Hunt Event",
                               "Under-Water Swimming",
                               "Haircut / Salon",
                               "Charades",
                               "Play Twister",
                               "Go Karts",
                               "Drink 3 Shots (Each)",
                               "Play Jenga",
                               "Rent A Limousine",
                               "Plant A Garden",
                               "Get Tattoo",
                               "Fishing",
                               "Arcade Golf",
                               "Get a Glass of Louis XIII",
                               "Target Shooting",
                               "Video Games At Home",
                               "Chip & Putt Golf Shots",
                               "Be Brutally Honest",
                               "Facial",
                               "Punt, Pass & Kick",
                               "Art Showing",
                               "Create A Youtube Video",
                               "Hula Hoop",
                               "Table Tennis",
                               "Botox Treatment",
                               "Bocce Ball",
                               "Game of Horse",
                               "Ping Pong",
                               "Swap $1-$5 Gift",
                               "Out Of Town Event",
                               "Foosball",
                               "Rent Motorcycles",
                               "Mani / Pedi",
                               "Golf Range",
                               "Pet Store",
                               "Rent A Super Car",
                               "Bed & Breakfast",
                               "Horse Races",
                               "Make A Weekend Trip",
                               "Pictionary Event",
                               "Get Piercing",
                               "Write A Song",
                               "Play Cards",
                               "Ski Ball",
                               "Arcade",
                               "Pray Together",
                               "Virtual Reality Game",
                               "Drink Expensive Wine",
                               "Bonfire",
                               "Antiquing",
                               "Boating",
                               "Hot Air Balloon Ride",
                               "Massage"
        ]
        friendlySlotOptions = surpriseOptions
        performSegue(withIdentifier: "mysterySegue", sender: self)
    }
}
