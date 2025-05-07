Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE62AAD55A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 07:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0807CC78F94;
	Wed,  7 May 2025 05:39:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2AE8C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 05:39:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 922062F;
 Tue,  6 May 2025 22:39:21 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949C13F673;
 Tue,  6 May 2025 22:39:27 -0700 (PDT)
Message-ID: <b6774c27-0628-46d8-a186-bfd378ee538f@arm.com>
Date: Wed, 7 May 2025 11:09:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-10-leo.yan@arm.com>
 <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
 <20250506101604.GD177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506101604.GD177796@e132581.arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 9/9] coresight: Refactor runtime PM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 5/6/25 15:46, Leo Yan wrote:
> On Fri, May 02, 2025 at 02:15:49PM +0530, Anshuman Khandual wrote:
>>
>> On 4/23/25 20:47, Leo Yan wrote:
>>> The validation for driver data pointers and clock pointers are redundant
>>> in the runtime PM callbacks.  After a driver's probing, its driver data
>>> and clocks have been initialized successfully, this ensures it is safe
>>> to access driver data and clocks in the runtime PM callbacks.  A corner
>>> case is a clock pointer is NULL, in this case, the clock core layer can
>>> handle it properly.  So remove these redundant checking.
>>>
>>> In runtime resume, respect values returned from clock function and add
>>> error handling.
>>
>> Although not checking drvdata and drvdata->apb_clk does make sense, but
>> why change the semantics on the resume paths as well, which now returns
>> stored error value from clk_prepare_enable().
> 
> Let us assume if a clock fails to enable during the resume flow, with
> current code, we miss a chance to detect issues in the first place.
> 
> I understand the clock enabling failures are rare, but propagating an
> error in the resume callbacks would help identify potential issues.
> 
> It seems to me that this patch does not change the semantics of the
> resume paths.  It enhances the resume flow for early error reporting.

Alright, fair enough.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
