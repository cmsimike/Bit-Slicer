/*
 * Copyright (c) 2015 Mayur Pawashe
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * Neither the name of the project's author nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ZGDeliverUserNotifications.h"

void ZGDeliverUserNotificationWithReplyOption(NSString *title, NSString *subtitle, NSString *informativeText, BOOL hasReplyButton, NSString *responsePlaceholder, NSDictionary<NSString *, id> *userInfo)
{
	NSUserNotification *userNotification = [[NSUserNotification alloc] init];
	userNotification.title = title;
	userNotification.subtitle = subtitle;
	userNotification.informativeText = informativeText;
	userNotification.userInfo = userInfo;
	if ([userNotification respondsToSelector:@selector(hasReplyButton)])
	{
		userNotification.hasReplyButton = hasReplyButton;
		
		if ([userNotification respondsToSelector:@selector(responsePlaceholder)])
		{
			userNotification.responsePlaceholder = responsePlaceholder;
		}
		
		if (hasReplyButton && [NSApp isActive])
		{
			userNotification.deliveryDate = [[NSDate date] dateByAddingTimeInterval:5.0];
		}
	}
	[[NSUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:userNotification];
}

void ZGDeliverUserNotificationWithReply(NSString *title, NSString *subtitle, NSString *informativeText, NSString *responsePlaceholder, NSDictionary<NSString *, id> *userInfo)
{
	ZGDeliverUserNotificationWithReplyOption(title, subtitle, informativeText, YES, responsePlaceholder, userInfo);
}

void ZGDeliverUserNotification(NSString *title, NSString *subtitle, NSString *informativeText, NSDictionary<NSString *, id> *userInfo)
{
	ZGDeliverUserNotificationWithReplyOption(title, subtitle, informativeText, NO, nil, userInfo);
}
