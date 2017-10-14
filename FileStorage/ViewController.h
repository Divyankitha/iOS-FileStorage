//
//  ViewController.h
//  FileStorage
//
//  Created by Divyankitha Raghava Urs on 9/13/17.
//  Copyright © 2017 Divyankitha Raghava Urs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (weak, nonatomic) IBOutlet UILabel *test1;

@property (weak, nonatomic) IBOutlet UILabel *test2;

@property (weak, nonatomic) IBOutlet UILabel *test3;
@property (weak, nonatomic) IBOutlet UILabel *archiveDisplay;

@property (strong, nonatomic) NSString *ArchiveFilePath;

- (IBAction)fileStorage:(id)sender;
- (IBAction)archive:(id)sender;

@end

