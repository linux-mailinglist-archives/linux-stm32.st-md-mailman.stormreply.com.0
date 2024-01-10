Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D0829BEE
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 15:00:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 437C0C6A61D;
	Wed, 10 Jan 2024 14:00:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E67BC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 14:00:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E5CE2F4;
 Wed, 10 Jan 2024 06:01:41 -0800 (PST)
Received: from [10.57.46.83] (unknown [10.57.46.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 230AE3F5A1;
 Wed, 10 Jan 2024 06:00:54 -0800 (PST)
Message-ID: <4eef0b8d-3702-429b-bf9b-50e176498833@arm.com>
Date: Wed, 10 Jan 2024 14:00:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-9-james.clark@arm.com>
 <01c15dbe-57d3-4aa1-9d68-81a01ec2a3a7@arm.com>
 <ebdc7d87-c0c4-9ee3-83a9-6c93e6fcea78@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ebdc7d87-c0c4-9ee3-83a9-6c93e6fcea78@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 8/8] coresight: Remove unused stubs
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

On 09/01/2024 16:48, James Clark wrote:
> 
> 
> On 09/01/2024 10:38, Suzuki K Poulose wrote:
>> Hi James
>>
>> On 12/12/2023 15:54, James Clark wrote:
>>> These are a bit annoying to keep up to date when the function signatures
>>> change. But if CONFIG_CORESIGHT isn't enabled, then they're not used
>>> anyway so just delete them.
>>>
>>
>> Have you tried building an arm32 kernel with this change in ? Looks like
>> arch/arm/kernel/hw_breakpoint.c includes linux/coresight.h and a build
>> with CONFIG_CORSIGHT=n might break the build ? So is
> 
> arm32 and CONFIG_CORESIGHT=n works because hw_breakpoint.c doesn't use
> any of those symbols, only #defines that were outside the #if
> IS_ENABLED(CONFIG_CORESIGHT), specifically CORESIGHT_UNLOCK.
> 
>> drivers/accel/habanalabs/common/habanalabs.h. Now, I am not sure if they
> 
> habanalabs is interesting, it depends on X86_64, but CONFIG_CORESIGHT
> depends on ARM || ARM64, so I think we can assume it's also only looking
> for #defines and inlines, and not actual code.
> 
> Either way I can't find any build config that actually ever built this,
> meaning it's always been dead code. I would have expected some build
> robot to have flagged an error by now as I've seen that on other
> coresight patches.
> 
>> really need it (even if they do, we may be able to remove the dependency
>> on the header file.
>>
> 
> They do really need it, also for the CORESIGHT_UNLOCK definition, but
> not any functions.

Thanks for checking this.

Suzuki


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
