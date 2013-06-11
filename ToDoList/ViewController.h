//
//  ViewController.h
//  ToDoList
//
//  Created by Brian Lewis on 5/8/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditItemDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EditItemDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property IBOutlet UITableView *tableView;

@property NSMutableArray *dataSource;
@property NSMutableArray *sectionNames;

- (IBAction)addItem:(id)sender;

@end
