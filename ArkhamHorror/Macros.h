//
//  Macros.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/12/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_Macros_h
#define ArkhamHorror_Macros_h

#define logError(fmt, ...) NSLog((@"[ERROR]%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define logWarn(fmt, ...) NSLog((@"[WARN]%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define logInfo(fmt, ...) NSLog((@"[INFO]%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#ifdef DEBUG
#   define logDebug(fmt, ...) NSLog((@"[DEBUG]%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#   define logVerbose(fmt, ...) NSLog((@"[VERBOSE]%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else
#   define logDebug(...)
#   define logVerbose(...)
#endif

#endif
