//
//  ItemViewController.swift
//  Pokédex
//
//  Created by Chip Thrasher on 9/14/16.
//  Copyright © 2016 Chip Thrasher. All rights reserved.
//

import UIKit

let apiURL = "https://pokeapi.co/api/v2/pokemon/"

class ItemViewController: UIViewController {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var pokemonID: Int?
    var pokemonName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        guard let pokemonID = pokemonID,
            let pokemonName = pokemonName else { return }
        
        self.navigationItem.title = "\(pokemonName) (#\(pokemonID))"
        
        let apiURLWithPokemon = "\(apiURL)\(pokemonID)/"
        let apiData = NSData(contentsOfURL: NSURL(string: apiURLWithPokemon)!)
        
        let imageURLString = "https://raw.githubusercontent.com/pokedex-ios/pokedex-artwork/master/images/\(pokemonID).png"
        
        NSLog(imageURLString)
        
        self.pokemonImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: imageURLString)!)!)
        
        // NSLog("\(apiData)")
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(apiData!, options: NSJSONReadingOptions(rawValue: 0))
            
            // NSLog("\(json)")
            
            let pokemon = json as! [String: AnyObject]
            // NSLog("\(pokemon)")

        } catch {
            NSLog("Blaaaaa")
        }
        
    }
    
}