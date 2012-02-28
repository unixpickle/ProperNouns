//
//  ANAppDelegate.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANAppDelegate.h"

@implementation ANAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSString * file = [[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"txt"];
    WordDictionary * dictionary = [[WordDictionary alloc] initWithFile:file];
    
    ANParagraph * p = [[ANParagraph alloc] initWithString:@"Gregory is my beautiful gray Persian cat. He walks with pride and grace, performing a dance of disdain as he slowly lifts and lowers each paw with the delicacy of a ballet dancer. His pride, however, does not extend to his appearance, for he spends most of his time indoors watching television and growing fat. He enjoys TV commercials, especially those for Meow Mix and 9 Lives. His familiarity with cat food commercials has led him to reject generic brands of cat food in favor of only the most expensive brands. Gregory is as finicky about visitors as he is about what he eats, befriending some and repelling others. He may snuggle up against your ankle, begging to be petted, or he may imitate a skunk and stain your favorite trousers. Gregory does not do this to establish his territory, as many cat experts think, but to humiliate me because he is jealous of my friends. After my guests have fled, I look at the old fleabag snoozing and smiling to himself in front of the television set, and I have to forgive him for his obnoxious, but endearing, habits."];
    
    ANParagraph * p2 = [p paragraphWithProperNouns:dictionary];
    NSLog(@"%@", [p2 stringValue]);
}

@end
