//
//  GameProgress.m
//  friHockey
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameProgress.h"

#import "Headers.TheRocket.h"

@implementation GameProgress

- (id) init
{
	self = [super init];
	if (self != nil) {
		// Unlock first opponent and level type.
	}
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self != nil) {

	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {

}

+ (GameProgress *) loadProgress {
	// Load game progress from file.
	GameProgress *progress = nil;
	
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];		
	progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	
	// If there is no progress file, create a fresh instance.
	if (!progress) {
		progress = [[GameProgress alloc] init];
	}
	
	return progress;
}

+ (void) deleteProgress {
	// Delete game progress file.
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
	NSError *error;
	[[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
}

- (void) saveProgress {
	// Save game progress to file.
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
	[NSKeyedArchiver archiveRootObject:self toFile:archivePath];
}


@end
