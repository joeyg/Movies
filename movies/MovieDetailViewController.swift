//
//  MovieDetailViewController.swift
//  movies
//
//  Created by Joe Gasiorek on 4/14/15.
//  Copyright (c) 2015 Joe Gasiorek. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: NSDictionary = NSDictionary()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!

    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(movie)
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.title = movie["title"] as? String
        self.titleLabel.text = movie["title"] as? String
        self.synopsisTextView.text = movie["synopsis"] as? String
        
        let criticsScore = movie.valueForKeyPath("ratings.critics_score") as? Int
        let audienceScore = movie.valueForKeyPath("ratings.audience_score") as? Int
        
        self.metadataLabel.text = "Critics Score \(criticsScore), Audience Score \(audienceScore)"
        
        var url = movie.valueForKeyPath("posters.detailed") as? String
        
        var range = url?.rangeOfString(".*cloudfront.net/", options: .RegularExpressionSearch)
        if let range = range {
            url = url?.stringByReplacingCharactersInRange(range, withString: "https://content6.flixster.com/")
        }
        
        posterImageView.setImageWithURL(NSURL(string:url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
