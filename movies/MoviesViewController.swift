//
//  MoviesViewController.swift
//  movies
//
//  Created by Joe Gasiorek on 4/14/15.
//  Copyright (c) 2015 Joe Gasiorek. All rights reserved.
//

import Foundation
import UIKit

class MoviesViewController : ViewController, UITableViewDataSource, UITableViewDelegate {
    private var movies: NSArray = NSArray()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let YourApiKey = "dagqdghwaq3e3mxyrp7kmmj5" // Fill with the key you registered at http://developer.rottentomatoes.com
        let RottenTomatoesURLString = "http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=" + YourApiKey
        
        let url = NSURL(string:RottenTomatoesURLString)
        let request = NSMutableURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response, data, error) in
            var errorValue: NSError? = nil
            
            let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &errorValue) as! NSDictionary
            self.movies = dictionary["movies"] as! NSArray
//            if let self.movies = dictionary["movies"] {
//                // cool code
//            } else {
//                // error handling
//            }
            
//            let firstMovie = movies![0] as! NSDictionary
//            println(firstMovie)
            self.tableView.reloadData()
            
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCellTableViewCell
//        cell.textLabel!.text = "Row \(indexPath.row)"
        let movie = movies[indexPath.row] as! NSDictionary
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
    
        let url = movie.valueForKeyPath("posters.thumbnail") as! String
        cell.posterImageView.setImageWithURL(NSURL(string:url))
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailViewController = segue.destinationViewController as! MovieDetailViewController
        
        let cell = sender as! MovieCellTableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let movie = self.movies[indexPath!.row] as! NSDictionary
        
        detailViewController.movie = movie
    }
}