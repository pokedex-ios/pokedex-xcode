//
//  ViewController.swift
//  Pokédex
//
//  Created by Chip Thrasher on 9/13/16.
//  Copyright © 2016 Chip Thrasher. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pokemonImage: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        // Do any additional setup after loading the view, typically from a nib.
        //
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOfPokemon.count
        
        //
        // Make a number of rows for each Pokemon
        //
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let pokemonID = indexPath.row + 1
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = ListOfPokemon[indexPath.row] + " #\(pokemonID)"
        return cell
        
        //
        // Change cell names to items in Pokemon list
        //
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("viewItem", sender: indexPath.row)
        //
        // When clicked on an item, do the segue
        //
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier {
        case "viewItem"?:
            let destination = segue.destinationViewController as! ItemViewController
            let row = sender! as! Int
            destination.pokemonID = row + 1
            destination.pokemonName = ListOfPokemon[row]
//            let imageURLString = "https://raw.githubusercontent.com/pokedex-ios/pokedex-artwork/master/images/\(destination.pokemonID!).png"
//            
//            NSLog(imageURLString)
            
            
            //
            // Code for generating the Pokédex entry!
            //
        default:
            return
        }
        
    }
    
}
