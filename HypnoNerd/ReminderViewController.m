//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Ernald on 5/14/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "ReminderViewController.h"

@implementation ReminderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        self.tabBarItem.title = @"Reminder";
        
        UIImage *tabBarImage = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = tabBarImage;
    }
    
    return self;
}

- (IBAction)addReminder: (id) sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    
    //[note setTimeZone:[NSTimeZone defaultTimeZone]];
    
    //note.applicationIconBadgeNumber=1;
    
    [note setAlertAction:@"Open App"];
    note.soundName=UILocalNotificationDefaultSoundName;
    [note setHasAction:YES];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}
@end
