//
//  ResourceInfo.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceInfo : NSObject
{
    NSString *resourcetitle;
    NSString *priview;
    NSString *resourceid;
}
@property(nonatomic,retain)   NSString *resourcetitle;
@property(nonatomic,retain)   NSString *priview;
@property(nonatomic,retain)   NSString *resourceid;

@end
