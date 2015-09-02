//
//  WeiBoRepostView.m
//  新浪微博
//
//  Created by apple on 15/8/31.
//  Copyright (c) 2015年 spoot. All rights reserved.
//

#import "WeiBoRepostView.h"
#import "WeiBoFrame.h"
#import "WeiBoData.h"
#import "user.h"
@interface WeiBoRepostView()
//@property(weak,nonatomic) UIImageView *imgRepost;
@property(weak,nonatomic) UILabel *lblReName;
@property(weak,nonatomic) UILabel *lblReContext;
@end
@implementation WeiBoRepostView
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.image=[UIImage resizableImageWithName:@"timeline_retweet_background"];
        
        UILabel *lblReName=[[UILabel alloc]init];
        lblReName.font=nameFont;
        lblReName.textColor=[UIColor brownColor];
        [self addSubview:lblReName];
        self.lblReName=lblReName;
        
        UILabel *lblReContext=[[UILabel alloc]init];
        lblReContext.font=contextFont;
        lblReContext.numberOfLines=0;
        [self  addSubview:lblReContext];
        self.lblReContext=lblReContext;
    }
    return self;
}

-(void)setCellFrame:(WeiBoFrame *)cellFrame
{
    _cellFrame=cellFrame;
    self.frame=self.cellFrame.reViewF;
    [self setupData];
    [self setupFrame];
}
-(void)setupFrame
{
    if(self.cellFrame.data.retweeted_status)
    {
        self.lblReName.frame=self.cellFrame.reNameF;
        self.lblReContext.frame=self.cellFrame.reContextF;
    }
}

-(void)setupData
{
    WeiBoData *data=self.cellFrame.data;
    
    if(data.retweeted_status)
    {
        self.hidden=NO;
        self.lblReName.text=data.retweeted_status.user.name;
        self.lblReContext.text=data.retweeted_status.text;
    }
    else{
        self.hidden=YES;
    }
}
@end
