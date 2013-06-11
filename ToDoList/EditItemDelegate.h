//
//  EditItemDelegate.h
//  ToDoList
//
//  Created by Brian Lewis on 5/8/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EditItemDelegate <NSObject>

-(void)changeTextTo:(NSString *)newText atIndexPath:(NSIndexPath*)indexPath;

@end
