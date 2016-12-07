//
//  TableViewController.h
//  News
//
//  Created by Perets on 07.12.16.
//  Copyright © 2016 PeretsVictory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewController : UITableViewController <NSXMLParserDelegate>
    
@property (strong, nonatomic) NSXMLParser *parser;
@property (strong, nonatomic) NSMutableArray *feeds;
@property (strong, nonatomic) NSMutableDictionary *item;
@property (copy, nonatomic) NSMutableString *feedsTitle;
@property (copy, nonatomic) NSMutableString *link;
@property (strong, nonatomic) NSString *element;

@property (strong, nonatomic) IBOutlet UITableView *tableViewNews;

@end
