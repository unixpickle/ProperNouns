//
//  WordDictionary.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WordDictionary.h"

@implementation WordDictionary

- (id)initWithFile:(NSString *)aFile {
    if ((self = [super init])) {
        char buffer[512];
        NSMutableArray * mWords = [[NSMutableArray alloc] init];
        
        FILE * fp = fopen([aFile UTF8String], "r");
        while (fgets(buffer, 512, fp)) {
            if (buffer[strlen(buffer) - 1] == '\n') {
                buffer[strlen(buffer) - 1] = 0;
            }
            NSString * word = [NSString stringWithUTF8String:buffer];
            [mWords addObject:word];
        }
        fclose(fp);
        
        [mWords sortUsingSelector:@selector(caseInsensitiveCompare:)];
        words = [mWords copy];
    }
    return self;
}

- (BOOL)includesWord:(NSString *)aWord {
    NSInteger minRange = 0;
    NSInteger maxRange = [words count];

    while (minRange < maxRange) {
        NSInteger checkIndex = minRange + ((maxRange - minRange) / 2);
        NSString * check = [words objectAtIndex:checkIndex];
        NSComparisonResult result = [check caseInsensitiveCompare:aWord];
        if (result == NSOrderedSame) {
            return YES;
        } else if (result == NSOrderedAscending) {
            minRange = checkIndex + 1;
        } else if (result == NSOrderedDescending) {
            maxRange = checkIndex;
        }
    }

    return NO;
}

- (BOOL)wordIsName:(NSString *)aName {
    return ![self includesWord:aName];
}

@end
