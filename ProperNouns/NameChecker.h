//
//  NameChecker.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NameChecker <NSObject>

- (BOOL)wordIsName:(NSString *)aName;

@end
