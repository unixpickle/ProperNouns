//
//  WordDictionary.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NameChecker.h"

@interface WordDictionary : NSObject <NameChecker> {
    NSArray * words;
}

- (id)initWithFile:(NSString *)aFile;
- (BOOL)includesWord:(NSString *)aWord;

@end
