//
//  WeblocData.m
//  QLWebloc
//
//  Created by David Keegan on 11/26/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//

#import "WeblocData.h"

@implementation WeblocData

@synthesize url;

- (id)initWithFile:(NSString *)file{
    self = [super init];
    if (self != nil) {
        self.url = [self getURLFromFile:file];
    }
    return self;
}

- (NSURL *)getURLFromFile:(NSString *)file{
    NSDictionary *plist = [[[NSDictionary alloc] initWithContentsOfFile:file] autorelease];
    return [NSURL URLWithString:[plist objectForKey:@"URL"]];
}

- (NSData *)html{
    return [NSData dataWithContentsOfURL:self.url];
}

@end
