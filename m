Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0692DFD60
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Dec 2020 16:19:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA271C56611;
	Mon, 21 Dec 2020 15:19:26 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D874C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Dec 2020 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HyXU+qqTigSSfTNKU247NVs2xrV4x4TwijL8KxJtCJE=; b=Q0cQhNK07CVmJlrps4f2k5T62O
 1vWcCXeQ+kbVSdqdONMPcWPdgbf8pMZG8NrlmR+Ukd02FXQq6K7BjnEsmsEtEI4cpqUvLsAtZmt0Q
 Bt8tUvd6QyID7n1Tw/eCRK1AYX+1pFP2kLrTBTk910cTTKkN4AQbjqT7vDk2+ND5wKUoRePYjZgNj
 hNKwAu2PUKoLAWKnH+nh/uTK5V2GDQECWJYcMO5eomWcgPBhK7lJXeuN/DoNEnEM2hLm+jGBATWCM
 zWREh8whhVMbXBLjG17ozE1pXyFlku3Dyotp2GkBZKwkcIKIxqjQbzftpIIAXp3V0wHpjx0tOwRVd
 o2LZqupA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51306 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1krMxz-00055Y-VB; Mon, 21 Dec 2020 10:19:20 -0500
To: William Breathitt Gray <vilhelm.gray@gmail.com>, David.Laight@ACULAB.COM
References: <cover.1606075915.git.vilhelm.gray@gmail.com>
 <6f0d78ae-9724-f67f-f133-a1148a5f1688@lechnology.com>
 <X9/Foc6wGl5dR1yK@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <b10c5ba6-e8c7-96d5-db9f-3828018330f6@lechnology.com>
Date: Mon, 21 Dec 2020 09:19:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9/Foc6wGl5dR1yK@shinobu>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 0/5] Introduce the Counter character
	device interface
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/20/20 3:44 PM, William Breathitt Gray wrote:
> On Sun, Dec 13, 2020 at 05:15:14PM -0600, David Lechner wrote:
>> On 11/22/20 2:29 PM, William Breathitt Gray wrote:
>>>
>>> 1. Should standard Counter component data types be defined as u8 or u32?
>>>
>>>      Many standard Counter component types such COUNTER_COMP_SIGNAL_LEVEL
>>>      have standard values defined (e.g. COUNTER_SIGNAL_LEVEL_LOW and
>>>      COUNTER_SIGNAL_LEVEL_HIGH). These values are currently handled by the
>>>      Counter subsystem code as u8 data types.
>>>
>>>      If u32 is used for these values instead, C enum structures could be
>>>      used by driver authors to implicitly cast these values via the driver
>>>      callback parameters.
>>>
>>>      This question is primarily addressed to David Lechner. I'm somewhat
>>>      confused about how this setup would look in device drivers. I've gone
>>>      ahead and refactored the code to support u32 enums, and pushed it to
>>>      a separate branch on my repository called counter_chrdev_v6_u32_enum:
>>>      https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v6_u32_enum
>>>
>>>      Please check it out and let me know what you think. Is this the
>>>      support you had in mind? I'm curious to see an example of how would
>>>      your driver callback functions would look in this case. If everything
>>>      works out fine, then I'll submit this branch as v7 of this patchset.
>>
>> I haven't had time to look at this in depth, but just superficially looking
>> at it, it is mostly there. The driver callback would just use the enum type
>> in place of u32. For example:
>>
>> static int ti_eqep_function_write(struct counter_device *counter,
>> 				  struct counter_count *count,
>> 				  enum counter_function function)
>>
>> and the COUNTER_FUNCTION_* constants would be defined as:
>>
>> enum counter_function {
>> 	COUNTER_FUNCTION_INCREASE,
>> 	...
>> };
>>
>> instead of using #define macros.
>>
>> One advantage I see to using u8, at least in the user API data structures,
>> is that it increases the number of events that fit in the kfifo buffer by
>> a significant factor.
>>
>> And that is not to say that we couldn't do both: have the user API structs
>> use u8 for enum values and still use u32/strong enum types internally in
>> the callback functions.
> 
> I'm including David Laight because he initially opposed enums in favor
> of fixed size types when we discussed this in an earlier revision:
> https://lkml.org/lkml/2020/5/3/159
> 
> However, there have been significant changes to this patchset so the
> context now is different than those earlier discussions (i.e. we're no
> longer discussing ioctl calls).
> 
> I think reimplementing these constants as enums as described could work.
> If we do so, should the enum constants be given specific values? For
> example:
> 
> enum counter_function {
> 	COUNTER_FUNCTION_INCREASE = 0,
> 	COUNTER_FUNCTION_DECREASE = 1,
> 	...
> };

I would say no on the explicit values since they don't have
any significant meaning.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
