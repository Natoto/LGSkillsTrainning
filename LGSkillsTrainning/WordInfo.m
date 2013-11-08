//
//  WordInfo.m
//  LGSkillsTrainning
//
//  Created by huangbo on 13-10-18.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "WordInfo.h"

@implementation WordInfo
@synthesize wordMeaning;
@synthesize wordName;
@synthesize wordPronounceurl;
@synthesize wordSoundmark;

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@",wordName,wordPronounceurl,wordSoundmark,wordMeaning];
}
-(void)dealloc
{
    [wordSoundmark release];
    [wordPronounceurl release];
    [wordName release];
    [wordMeaning release];
    [super dealloc];
}
@end
