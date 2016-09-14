//
//  ViewController.swift
//  Pokédex
//
//  Created by Chip Thrasher on 9/13/16.
//  Copyright © 2016 Chip Thrasher. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOfPokemon.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let pokemonID = indexPath.row + 1
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = ListOfPokemon[indexPath.row] + " #\(pokemonID)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("viewItem", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier {
        case "viewItem"?:
            let destination = segue.destinationViewController as! ItemViewController
            let row = sender! as! Int
            destination.pokemonID = row + 1
            destination.pokemonName = ListOfPokemon[row]
        default:
            return
        }
        
    }
    
}
