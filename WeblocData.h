//
//  WeblocData.h
//  QLWebloc
//
//  Created by David Keegan on 11/26/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WeblocData : NSObject {
    NSURL *url;
}

@property (nonatomic, copy) NSURL *url;

+ (NSURL *)getURLFromFile:(NSString *)file;
- (id)initWithFile:(NSString *)file;
- (NSData *)html;

@end
