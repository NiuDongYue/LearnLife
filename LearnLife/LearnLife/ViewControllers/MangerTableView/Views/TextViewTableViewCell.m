//
//  TextViewTableViewCell.m
//  LearnLife
//
//  Created by 郑重 on 16/10/4.
//  Copyright © 2016年 ZZ. All rights reserved.
//

#import "TextViewTableViewCell.h"

@interface TextViewTableViewCell () <UITextViewDelegate>

@end

@implementation TextViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textView.delegate = self;
    // Initialization code
}

- (void)textViewDidChange:(UITextView *)textView {
    self.titleLabel.text = @"帅Z";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
