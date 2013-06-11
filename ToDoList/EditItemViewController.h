//
//  EditItemViewController.h
//  ToDoList
//
//  Created by Brian Lewis on 5/8/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditItemDelegate.h"

@interface EditItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSString *originalText;
@property (strong, nonatomic) id<EditItemDelegate> editItemDelegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

- (IBAction)editText:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id<EditItemDelegate>)delegate textToEdit:(NSString *)textToEdit indexPath:(NSIndexPath *)indexPath;

@end
