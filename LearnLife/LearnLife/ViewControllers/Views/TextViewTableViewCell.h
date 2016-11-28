//
//  TextViewTableViewCell.h
//  LearnLife
//
//  Created by 郑重 on 16/10/4.
//  Copyright © 2016年 ZZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
