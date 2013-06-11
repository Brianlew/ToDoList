//
//  ViewController.m
//  ToDoList
//
//  Created by Brian Lewis on 5/8/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "ViewController.h"
#import "EditItemViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dataSource, sectionNames, textField, tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    dataSource = [[NSMutableArray alloc]initWithObjects:[NSMutableArray array], [NSMutableArray array],nil];
    sectionNames = [[NSMutableArray alloc]initWithObjects:@"To Do", @"Completed", nil];
    
    [textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addItem:(id)sender {
    
    [dataSource[0] addObject:textField.text];
    
    textField.text = @"";
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[dataSource[0] count]-1 inSection:0];
    
    [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"anIdentifier";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = dataSource[indexPath.section][indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionNames[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView beginUpdates];
    
    int oppositeSection = (indexPath.section+1)%2;
    
    NSString *item = dataSource[indexPath.section][indexPath.row];
    [dataSource[indexPath.section] removeObjectAtIndex:indexPath.row];
    [dataSource[oppositeSection] addObject:item];
    
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[dataSource[oppositeSection] count]-1 inSection:oppositeSection];
    
    [self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
    
    [self.tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    EditItemViewController *editItemViewController = [[EditItemViewController alloc]initWithNibName:nil bundle:nil delegate:self textToEdit:dataSource[indexPath.section][indexPath.row] indexPath:indexPath];
    
    [self.navigationController pushViewController:editItemViewController animated:YES];
}

-(void)changeTextTo:(NSString *)newText atIndexPath:(NSIndexPath *)indexPath
{
    dataSource[indexPath.section][indexPath.row] = newText;
    
    [tableView reloadData];
    
    [self.navigationController popToViewController:self animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self addItem:self.textField];
    
    return YES;
}

@end
