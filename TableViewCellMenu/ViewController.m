//
//  ViewController.m
//  TableViewCellMenu
//
//  Created by Weixu on 16/5/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cellMenuPress:(id)sender {
    
    CellViewController *cellViewController = [[CellViewController alloc] initWithNibName:@"CellViewController" bundle:nil];
    
    [self presentViewController:cellViewController animated:YES completion:nil];
}
@end
