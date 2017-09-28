//
//  ViewController.m
//  Expancell
//
//  Created by quy on 9/28/17.
//  Copyright © 2017 quy. All rights reserved.
//

#import "ViewController.h"
#import "ExpandTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,TTTAttributedLabelDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
NSString  * const cellIdentifier  = @"ExpandTableViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    self.tableView.estimatedRowHeight = 75;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
   
    // Do any additional setup after loading the view, typically from a nib.
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExpandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
    cell = [[ExpandTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.testLabel.userInteractionEnabled = YES;
    
  
    [cell setData:@""];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithTextCheckingResult:(NSTextCheckingResult *)result{
    
}
-(void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url{
    
}
-(void)attributedLabel:(TTTAttributedLabel *)label didLongPressLinkWithURL:(NSURL *)url atPoint:(CGPoint)point{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
