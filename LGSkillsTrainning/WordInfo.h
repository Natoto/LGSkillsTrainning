//
//  WordInfo.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-10-18.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordInfo : NSObject
{
    NSString * wordName;
    NSString * wordPronounceurl;
    NSString * wordSoundmark;
    NSString * wordMeaning;
}

@property(nonatomic,retain)    NSString * wordName;
@property(nonatomic,retain)    NSString * wordPronounceurl;
@property(nonatomic,retain)    NSString * wordSoundmark;
@property(nonatomic,retain)    NSString * wordMeaning;
@end
