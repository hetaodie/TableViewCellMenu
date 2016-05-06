//
//  TestTableViewCell.m
//  TableViewCellMenu
//
//  Created by Weixu on 16/5/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/*!
 *  是此cell成为可以第一相应着
 *
 *  @return 此处必须返回yes
 */
- (BOOL)canBecomeFirstResponder{
    return YES;
}


/**
 *  这个函数用来控制
 *
 *  @param action 返回所有的menu能相应的方法（包括自定义的和系统自己的）
 *  @param sender
 *
 *  @return 使想要显示的方法返回yes，不需要相应的方法返回no
 */
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(handleCopyCell:) || action == @selector(handleDeleteCell:) || action == @selector(handlePasteCell:) ) {
        return YES;
    }
    return NO;
}

/**
 *  此为长按手势调用的函数
 *
 *  @param recognizer 传入的相应手势
 */
- (void)cellLongPress:(UIGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        UIMenuItem *itCopy   = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(handleCopyCell:)];
        UIMenuItem *itDelete = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(handleDeleteCell:)];
        UIMenuItem *itPaste  = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(handlePasteCell:)];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        [menu setMenuItems:[NSArray arrayWithObjects:itCopy, itDelete,itPaste,  nil]];
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
        
    }
}


/**
 *  自定义的三个函数
 *
 *  @param sender <#sender description#>
 */
- (void)handleCopyCell:(id)sender{//复制cell
    NSLog(@"handle copy cell");
}

- (void)handleDeleteCell:(id)sender{//删除cell
    NSLog(@"handle delete cell");
}

- (void)handlePasteCell:(id)sender{//删除cell
    NSLog(@"handle Paste cell");
}


@end
