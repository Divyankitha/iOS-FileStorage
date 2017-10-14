//
//  ViewController.m
//  FileStorage
//
//  Created by Divyankitha Raghava Urs on 9/13/17.
//  Copyright © 2017 Divyankitha Raghava Urs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFileManager *filemgr;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    
    
    filemgr = [NSFileManager defaultManager];
    
    // Identify the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    
    NSLog(@"\ndocsDir %@\n", docsDir);
    
    
    // Build the path to the data file
    dataFile = [docsDir stringByAppendingPathComponent:
                @"datafile.txt"];
    
    NSLog(@"\ndataFile %@\n", dataFile);
    
    // Check if the file already exists
    if ([filemgr fileExistsAtPath: dataFile])
    {
        // Read file contents and display in textBox
        NSData *databuffer;
        databuffer = [filemgr contentsAtPath: dataFile];
        
        NSString *datastring = [[NSString alloc]
                                initWithData: databuffer
                                encoding:NSASCIIStringEncoding];
        
        _test1.text = datastring;
    }
    
    filemgr = [NSFileManager defaultManager];
    
    // Identify the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the data file
    _ArchiveFilePath = [[NSString alloc] initWithString: [docsDir
                                                       stringByAppendingPathComponent: @"data.archive"]];
    
    NSLog(@"_dataFilePath %@", _ArchiveFilePath);
    
    
    // Check if the file already exists
    if ([filemgr fileExistsAtPath: _ArchiveFilePath])
    {
        NSString *dataArray;
        
        dataArray = [NSKeyedUnarchiver
                     unarchiveObjectWithFile: _ArchiveFilePath];
        
        _archiveDisplay.text = dataArray;
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fileStorage:(id)sender
{
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *nameAuthor;
    NSString *str;
    
    filemgr = [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    dataFile = [docsDir
                stringByAppendingPathComponent: @"datafile.txt"];
    
    
    
    NSLog(@"dataFile %@", dataFile);
    
    nameAuthor = [_nameTextField.text stringByAppendingString : _authorTextField.text ];
    str = [ nameAuthor stringByAppendingString: _descriptionTextField.text];
    
    databuffer = [str dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile
                     contents: databuffer attributes:nil];
    
}



- (IBAction)archive:(id)sender
{
    NSString *details;
    NSString *nameAuthor;
    
    nameAuthor = [_nameTextField.text stringByAppendingString : _authorTextField.text ];
    details = [ nameAuthor stringByAppendingString: _descriptionTextField.text];
    
    [NSKeyedArchiver archiveRootObject:
     details toFile:_ArchiveFilePath];
}
@end
