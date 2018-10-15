//
//  ViewController.swift
//  DateShake
//
//  Created by Manoj Muthireddy on 11/25/17.
//  Copyright © 2017 Manoj Muthireddy. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications
import MessageUI
import GoogleMobileAds

var slotOptions = [String]()
let payerSlotOptions = ["Corporate Card",
    "Dutch (Split It)",
    "Garage Sales Proceeds",
    "Get a Sponsor",
    "He Pays",
    "She Pays",
    "Flip A Coin",
    "Rock Paper Scissors",
    "Have Parents Pay"]
class ViewController: UIViewController, CLLocationManagerDelegate, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    var menuShowing = false
    let defaults = UserDefaults.standard
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    @IBOutlet weak var bannerView2: GADBannerView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var dining: UIButton!
    @IBOutlet weak var activities: UIButton!
    @IBOutlet weak var cultural: UIButton!
    @IBOutlet weak var surprise: UIButton!
    @IBOutlet weak var sendText: UIButton!
    @IBOutlet weak var textButton: UIButton!
    
    let urlCounterparts = [
        "http://www.rockbuilt.org/":"Rock Built"
    ]
    let url = URL(string: "http://www.rockbuilt.org/")
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        bannerView2.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView2.rootViewController = self
        bannerView2.load(GADRequest())
    }
    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        gifImage.loadGif(name: "romanceBG2")
        viewTopConstraint.constant = -163
        textButton.layer.borderColor = UIColor.white
            .cgColor
        textButton.layer.borderWidth = 2.0
        textButton.layer.cornerRadius = 20.0
        
        dining.layer.borderColor = UIColor.white.cgColor
        dining.layer.borderWidth = 4.0
        dining.layer.cornerRadius = 28.0
        activities.layer.borderColor = UIColor.white.cgColor
        activities.layer.borderWidth = 4.0
        activities.layer.cornerRadius = 28.0
        cultural.layer.borderColor = UIColor.white.cgColor
        cultural.layer.borderWidth = 4.0
        cultural.layer.cornerRadius = 28.0
        surprise.layer.borderColor = UIColor.white.cgColor
        surprise.layer.borderWidth = 4.0
        surprise.layer.cornerRadius = 28.0
        let gradientLayer = CAGradientLayer.init()
        
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor]
        gradientLayer.frame = CGRect.init(
            x: textButton.frame.minX - 40,
            y: textButton.frame.minY - 40,
            width: textButton.frame.width + 80,
            height: textButton.frame.height + 80)
        gradientLayer.masksToBounds = true
        
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        
        let shadowLayer = CALayer.init()
        shadowLayer.frame = gradientLayer.bounds
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.08
        shadowLayer.shadowRadius = 20
        shadowLayer.shadowPath = CGPath.init(rect: shadowLayer.bounds, transform: nil)
        gradientLayer.mask = shadowLayer
        //textButton.layer.insertSublayer(gradientLayer, below: textButton.layer)
       
        //textButton.layer.backgroundColor
        /*let origImage2 = UIImage(named: "lineMenu50")
        let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
        menuButton.setImage(tintedImage2, for: .normal)
        menuButton.tintColor = .white*/
            //UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
            self.displayTags()
            self.findMyLocation()
        } else {
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        
    }
    
    @IBAction func showOptions(_ sender: Any) {
        self.toggleOptions()
        /*if(menuShowing){
            viewTopConstraint.constant = -163
        }else{
            viewTopConstraint.constant = 63
            
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
    
    func displayTags(){
        //self.Label1.text = "1. Pick your category\n"
        //self.Label2.text = "2. Shake your device or Tap the 'Shake' button\n"
        //self.Label3.text = "3. Enjoy your Date\n"

        //self.urlLink.setTitle("http://www.rockbuilt.org/", for: .normal)
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
    
    @IBAction func DiningAction(_ sender: Any) {
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
        
        slotOptions = diningOptions
        performSegue(withIdentifier: "diningSegue", sender: self)
    }
    
    @IBAction func ActivitiesAction(_ sender: Any) {
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
            "Pole Dancing",
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
            "Dancing",
            "Water Skiing",
            "Target Shooting",
            "Indoor Rock Climbing",
            "Skateboarding",
            "Learn Tango Dancing",
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
            "Learn Salsa Dancing",
            "Paintball",
            "Kick A Field Goal"]
        
        slotOptions = activityOptions
        performSegue(withIdentifier: "activitiesSegue", sender: self)
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
            "Dancing",
            "Look at Family Albums",
            "Drive-In Movie",
            "Attend Fund Raiser",
            "Country Bar",
            "Blues Bar",
            "Vegas",
            "Horse Riding",
            "Visit a Park",
            "Burlesque Club",
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
        
        slotOptions = culturalOptions
        performSegue(withIdentifier: "culturalSegue", sender: self)
    }
    
    @IBAction func SurpriseAction(_ sender: Any) {
        let surpriseOptions = ["Cigar Bar",
                               "Escape Experience",
                               "Charades Event",
            "Visit a Park",
            "Darts",
            "Race Car Driving",
            "Learn Salsa Dancing",
            "Baggo Game",
            "Worship Together",
            "Ballroom Dancing",
            "Wax A Body Part",
            "Shuffleboard",
            "Charity Event",
            "Skinny Dipping",
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
            "Kiss",
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
            "Hold Hands",
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
            "Learn Tango Dancing",
            "Ski Ball",
            "Strip Poker",
            "Arcade",
            "Pray Together",
            "Virtual Reality Game",
            "Drink Expensive Wine",
            "Bonfire",
            "Antiquing",
            "Boating",
            "Hot Air Balloon Ride",
            "Hug",
            "Massage"
]
        slotOptions = surpriseOptions
        performSegue(withIdentifier: "surpriseSegue", sender: self)
    }
    
    
}


/*func getLocation() {
 locationManger.startUpdatingLocation()
 
 CLGeocoder().reverseGeocodeLocation(location1){ (placemark, error) in
 if error != nil{
 print("there's an error")
 }
 else{
 if let place = placemark?[0]
 {
 //self.password.text = "\(String(describing: place.subThoroughfare))"
 }
 }
 
 }
 }*/

