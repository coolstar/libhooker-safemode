//
//  ViewController.m
//  SafeMode
//
//  Created by CoolStar on 5/14/20.
//  Copyright © 2020 coolstar. All rights reserved.
//

#import "ViewController.h"
#import <spawn.h>

extern char **environ;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.text = NSLocalizedStringFromTable(@"wd3-1g-ED6.text",@"Main", @"");
}

- (IBAction)respring:(id)sender {
    char *argv[] = {"sbreload", NULL};
    pid_t pid;
    int status = posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, argv, environ);
    if (status == 0){
        waitpid(pid, &status, 0);
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)){
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark){
            return UIStatusBarStyleLightContent;
        } else {
            return UIStatusBarStyleDarkContent;
        }
    }
    return UIStatusBarStyleLightContent;
}


@end
