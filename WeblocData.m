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
    //code from QLColorCode
    NSTask *task = [[NSTask alloc] init];
    [task setCurrentDirectoryPath:@"/tmp"];     /* XXX: Fix this */
    NSLog(@"%@", [[NSProcessInfo processInfo] environment]);
    [task setEnvironment:[[NSProcessInfo processInfo] environment]];
    [task setLaunchPath:@"/usr/bin/curl"];
    [task setArguments:[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", self.url], nil]];
    
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    [task setStandardError:pipe];
    
    NSFileHandle *file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    [task waitUntilExit];
    
    //*exitCode = [task terminationStatus];
    [task release];
    /* The docs claim this isn't needed, but we leak descriptors otherwise */
    [file closeFile];
    /*[pipe release];*/
    
    return data;
}

@end
