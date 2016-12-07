//
//  TableViewController.m
//  News
//
//  Created by Perets on 07.12.16.
//  Copyright © 2016 PeretsVictory. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@end


@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _feeds = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://atn.ua/kharkov.rss"];
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [_parser setDelegate:self];
    [_parser setShouldResolveExternalEntities:NO];
    [_parser parse];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _feeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[_feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    return cell;
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    _element = elementName;
    
    if ([elementName isEqualToString:@"item"]) {
        
        _item = [[NSMutableDictionary alloc]init];
        _feedsTitle = [[NSMutableString alloc]init];
        _link = [[NSMutableString alloc]init];
        
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [_item setObject:_feedsTitle forKey:@"title"];
        [_item setObject:_link forKey:@"link"];
        
        [_feeds addObject:[_item copy]];
    }
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([_element isEqualToString:@"title"]) {
        [_feedsTitle appendString:string];
    } else if ([_element isEqualToString:@"link"]) {
        [_link appendString:string];
    }
}


- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showWebView"] ) {
        NSIndexPath *indexPath = [self. tableViewNews indexPathForSelectedRow];
        NSString *string = [_feeds [indexPath.row] objectForKey:@"link"];
        [[segue destinationViewController] setUrl:string];
    }
}

@end
