//
//  CellViewController.m
//  TableViewCellMenu
//
//  Created by Weixu on 16/5/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "CellViewController.h"
#import "TestTableViewCell.h"

@interface CellViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CellViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TestTableViewCell *cell = (TestTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:nil options:nil] firstObject];
        
        UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:cell action:@selector(cellLongPress:)];
        [cell addGestureRecognizer:longPressGesture];
    }
    
    cell.textLabel.text = @"test";
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
        if (action == @selector(copy:)) {
            return YES;
        }
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
