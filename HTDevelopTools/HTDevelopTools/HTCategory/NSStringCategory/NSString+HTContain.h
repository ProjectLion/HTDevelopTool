//
//  NSString+HTContain.h
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTContain)

/**
 是否包含中文
 */
- (BOOL)ht_isContainChinese;

/**
 是否包含空格

 @return YES包含 NO不包含
 */
- (BOOL)ht_isContainSpace;


/**
 将Unicode编码转成字符串

 @return 转换后的字符串
 */
- (NSString *)ht_makeUnicodeToString;

- (BOOL)ht_containsCharacterSet:(NSCharacterSet *)set;

/**
 是否包含此字符串

 @param string 是否包含的字符串
 @return YES包含 NO不包含
 */
- (BOOL)ht_containsaString:(NSString *)string;

/**
 获取字符数量

 @return 字符数量
 */
- (int)ht_wordsCount;


@end
