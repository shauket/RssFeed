//
//  MainViewController.swift
//  iLikesInsta
//
//  Created by Shauket Sheikh on 16/08/2016.
//  Copyright © 2016 Shauket Sheikh. All rights reserved.
//

import UIKit
import SVProgressHUD


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var feed: RSSFeed?

    
    @IBOutlet var rssListView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
                
               
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.rssListView.backgroundView = UIImageView(image: UIImage(named: "menu_background.jpg")!)
        self.rssListView.backgroundView?.alpha = 1
        self.rssListView.backgroundView?.opaque = true

        
        let request = NSURLRequest(URL: NSURL(string: "http://rss.cnn.com/rss/edition.rss")!)
        
        SVProgressHUD.show()
        RSSParser.parseFeedForRequest(request, callback: { (feed, error) -> Void in
            if let myFeed = feed
            {
                if let title = myFeed.title
                {
                    self.title = title
                }
                
                self.feed = feed
                SVProgressHUD.dismiss()
                
                self.rssListView.dataSource = self
                self.rssListView.delegate = self
                
                self.rssListView.reloadData()
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let feed = self.feed
        {
            return feed.items.count
        }
        
        return 0
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId: NSString = "songCell"
        var cell: SongCell! = rssListView.dequeueReusableCellWithIdentifier(cellId as String) as? SongCell
       
        if let feed = self.feed
        {
            if cell == nil {
                let array : NSArray = NSBundle.mainBundle().loadNibNamed("songCell", owner:self, options:nil)
                cell = array[0] as? SongCell
                cell!.accessoryType = UITableViewCellAccessoryType.None
            }
            cell.grayColorView.backgroundColor = UIColor.blackColor()
            cell.grayColorView.alpha = 0.7
            let obj: RSSItem = feed.items[indexPath.row] as RSSItem
            print(obj)
            cell.populateCellWithData(obj as! RSSItem, indexPath: indexPath)
            cell.backgroundColor = UIColor.clearColor()
          
            
            cell?.parentView.userInteractionEnabled = true
            cell.parentView.tag = indexPath.row
        }
        return cell;

    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.rssListView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 217
    }
    

    
    
}
