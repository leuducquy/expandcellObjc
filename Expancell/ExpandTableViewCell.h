//
//  ExpandTableViewCell.h
//  Expancell
//
//  Created by quy on 9/28/17.
//  Copyright © 2017 quy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "quyLabel.h"
@interface ExpandTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet quyLabel *testLabel;
-(void)setData:(NSString*)description;
@end
