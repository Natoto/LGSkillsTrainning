//
//  ResourceInfo.m
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "ResourceInfo.h"

@implementation ResourceInfo
@synthesize resourceid;
@synthesize resourcetitle;
@synthesize priview;


-(NSString *)description
{
    return [NSString stringWithFormat:@"resourceid=%@ resourcetitle=%@ priview=%@",resourceid,resourcetitle,priview];
}

-(void)dealloc
{
    [super dealloc];
    GVRelease(resourceid);
    GVRelease(resourcetitle);
    GVRelease(priview);
    
}
@end
