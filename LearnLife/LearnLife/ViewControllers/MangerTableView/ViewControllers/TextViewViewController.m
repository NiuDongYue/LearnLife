//
//  TextViewViewController.m
//  LearnLife
//
//  Created by 郑重 on 16/10/4.
//  Copyright © 2016年 ZZ. All rights reserved.
//

#import "TextViewViewController.h"
#import "TextViewTableViewCell.h"
#import "UIViewController+KNSemiModal.h"

@interface TextViewViewController () <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

@property (nonatomic, strong) UILabel *myLabel;

@end

@implementation TextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        UIViewController *parent = [self.view containingViewController];
        [parent dismissSemiModalView];
    }];
    [self.view addGestureRecognizer:tap];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 200;
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TextViewTableViewCell" owner:self options:nil] firstObject];
    }
    
    if (indexPath.row == 1) {
        self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
        [cell addSubview:self.myLabel];
        
        cell.textView.delegate = self;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.myLabel.text = textView.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
