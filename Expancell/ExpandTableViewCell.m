//
//  ExpandTableViewCell.m
//  Expancell
//
//  Created by quy on 9/28/17.
//  Copyright © 2017 quy. All rights reserved.
//

#import "ExpandTableViewCell.h"

@implementation ExpandTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.testLabel.adjustsFontSizeToFitWidth = NO;
     self.testLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
-(void)setData:(NSString *)description{
   
    self.testLabel.numberOfLines=2;
  
    NSString *moreStr = @"...More";
    NSMutableAttributedString *tailStr = [[NSMutableAttributedString alloc] initWithString:moreStr attributes: @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16], NSUnderlineColorAttributeName:[UIColor grayColor]}];
    NSRange range = NSMakeRange(3, 4);
  
    [tailStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:range];
    
   
    self.testLabel.attributedTruncationToken = tailStr;
    UITapGestureRecognizer *readMoreGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(readMoreDidClickedGesture:)];
    
    readMoreGesture.numberOfTapsRequired = 1;
    [self.testLabel addGestureRecognizer:readMoreGesture];

}

-(void)readMoreDidClickedGesture:(UITapGestureRecognizer*)tap{
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self.testLabel.attributedText];
    
    // The storage class owns a layout manager
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    // Layout manager owns a container which basically
    // defines the bounds the text should be contained in
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:self.testLabel.frame.size];
    
    // For labels the fragment padding should be 0
    textContainer.lineFragmentPadding = 0;
    
    // Begin computation of actual frame
    // Glyph is the final display representation
    // Eg: Ligatures have 2 characters but only 1 glyph.
    NSRange glyphRange;
    
    // Extract the glyph range
    [layoutManager characterRangeForGlyphRange:NSMakeRange(0, 4) actualGlyphRange:&glyphRange];
    
    // Compute the rect of glyph in the text container
    CGRect glyphRect = [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
    
    // Final rect relative to the textLabel.
  
    
    // Now figure out if the touch point is inside our rect
    CGPoint touchPoint = [tap locationOfTouch:0 inView:self.testLabel];
    
    if( CGRectContainsPoint(glyphRect, touchPoint) ) {
        NSLog( @"User tapped on Read More. So show something more");
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
