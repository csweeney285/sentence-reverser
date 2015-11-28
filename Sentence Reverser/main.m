//
//  main.m
//  Sentence Reverser
//
//  Created by Conor Sweeney on 11/27/15.
//  Copyright © 2015 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableString * reverseString(NSString *originalString)
{
    NSCharacterSet *punction = [NSCharacterSet punctuationCharacterSet];
    NSMutableDictionary *punctionDictionary = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < [originalString length]; i++) {
        unichar letter = [originalString characterAtIndex:i];
        if ([punction characterIsMember:letter]) {
            NSString *letterString = [NSString stringWithCharacters:&letter length:1];
            NSString *letterPosition = [NSString stringWithFormat:@"%d",i];
            [punctionDictionary setObject:letterString forKey:letterPosition];
        }
    }
    NSString *stringWithoutPunction = [[originalString componentsSeparatedByCharactersInSet:punction]componentsJoinedByString:@""];
    NSLog(@"Punction Dictionary-\n%@",punctionDictionary);
    NSLog(@"String without Punction-\n%@",stringWithoutPunction);
    NSArray *words = [stringWithoutPunction componentsSeparatedByString:@" "];
    NSLog(@"Word Array-\n%@",words);
    NSString *newStringWithoutPunction;
    NSMutableArray *backwardWordArray = [[NSMutableArray alloc]init];
    for (int i = (((int)[words count])-1); i >= 0; i--) {
        NSString *tempString = [words objectAtIndex:i];
        [backwardWordArray addObject:tempString];
    }
    NSLog(@"backward word array:\n%@",backwardWordArray);
    newStringWithoutPunction= [backwardWordArray componentsJoinedByString:@" "];
    NSLog(@"String without Punctuation- %@",newStringWithoutPunction);
    NSMutableString *newStringWithPunction = [[NSMutableString alloc]init ];
    [newStringWithPunction setString:newStringWithoutPunction];
    NSArray *values = [punctionDictionary allValues];
    NSArray *keys = [punctionDictionary allKeys];
    for (int i = 0; i < [values count]; i++) {
        NSString *tempString = [values objectAtIndex:i];
        NSUInteger x = [keys[i] integerValue];
        if (x>[newStringWithPunction length]) {
            [newStringWithPunction stringByAppendingString:tempString];
        }
        else
        {
            [newStringWithPunction insertString:tempString atIndex:x];
        }
    }
    NSLog(@"New String with Punction- %@",newStringWithPunction);
    return newStringWithPunction;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Hello, this is Conor's program.";
        NSMutableString *reversedString = reverseString(string);
        NSLog(@"\n%@\n%@\n",string,reversedString);
        
    }
    
    return 0;
}
