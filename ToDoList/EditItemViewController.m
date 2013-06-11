//
//  EditItemViewController.m
//  ToDoList
//
//  Created by Brian Lewis on 5/8/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "EditItemViewController.h"

@interface EditItemViewController ()

@end

@implementation EditItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id<EditItemDelegate>)delegate textToEdit:(NSString *)textToEdit indexPath:(NSIndexPath *)indexPath
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.editItemDelegate = delegate;
        self.originalText = textToEdit;
        self.indexPath = indexPath;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.textField.text = self.originalText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editText:(id)sender {
    
    [self.editItemDelegate changeTextTo:self.textField.text atIndexPath:self.indexPath];
    
}
@end
