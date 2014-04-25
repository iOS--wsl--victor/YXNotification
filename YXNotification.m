//
//  YXNotification.m
//
//  http://www.cnblogs.com/YouXianMing/
//
//  Created by wooboo on 14-4-25.
//  Copyright (c) 2014年 Y.X. All rights reserved.
//

#import "YXNotification.h"

static NSHashTable          *registerTable;
static NSMutableDictionary  *names;

@implementation YXNotification

#pragma mark - 初始化单例
+ (void)initialize
{
    if (self == [YXNotification class])
    {
        registerTable = [NSHashTable weakObjectsHashTable];
        names         = [[NSMutableDictionary alloc] init];
    }
}

#pragma mark - 标记目标对象并签订协议
+ (void)delegate:(id<YXNotificationProtrol>)target mark:(NSString *)mark
{
    // 将对象添加进weak集合(先进行判断)
    if ([registerTable containsObject:target] == NO)
    {
        // 添加对象进weak集合
        [registerTable addObject:target];
        
        // 用标签以及这个类名存储一个字典与该对象匹配
        [names setObject:[target class] forKey:mark];
    }
}

#pragma mark - 从原目标发送信息到多个目标,目标都有标识
+ (void)message:(id)msg from:(id<YXNotificationProtrol>)source toMarks:(NSArray *)marks
{
    // 如果marks以及source为空
    if (marks == nil || source == nil)
    {
        return;
    }
    
    for (NSString *mark in marks)
    {
        // 取出类名
        Class oneClass = [names objectForKey:mark];
        
        // 取出来了?
        if (oneClass != nil)
        {
            // 检索出所有的对象
            for (id obj in [registerTable allObjects])
            {
                // 匹配对象
                if ([obj isMemberOfClass:oneClass])
                {
                    // 发送类方法
                    [oneClass listenEvent:msg];
                }
            }
        }
    }
}

#pragma mark - 移除目标以及该目标的标识
+ (void)remove:(id<YXNotificationProtrol>)target mark:(NSString *)mark
{
    if (target == nil || mark == nil)
    {
        return;
    }
    
    [registerTable removeObject:target];
    [names removeObjectForKey:mark];
}

@end



