Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586BAAD58B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 07:55:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 416FBC78F94;
	Wed,  7 May 2025 05:55:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4839BC78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 05:55:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72D9A2F;
 Tue,  6 May 2025 22:55:40 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4983F5A1;
 Tue,  6 May 2025 22:55:45 -0700 (PDT)
Message-ID: <eee538cf-d1ce-4444-97f4-450e4604f1ff@arm.com>
Date: Wed, 7 May 2025 11:25:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-7-leo.yan@arm.com>
 <063577a4-1530-4658-9838-934b0606e8e0@arm.com>
 <20250506091841.GA177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506091841.GA177796@e132581.arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 6/9] coresight: Avoid enable
 programming clock duplicately
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

On 5/6/25 14:48, Leo Yan wrote:
> Hi Anshuman,
> 
> On Fri, May 02, 2025 at 12:08:55PM +0530, Anshuman Khandual wrote:
>> On 4/23/25 20:47, Leo Yan wrote:
>>> The programming clock is enabled by AMBA bus driver before a dynamic
>>> probe.  As a result, a CoreSight driver may redundantly enable the same
>>> clock.
>>
>> Are you sure AMBA bus driver always enables such clocks in all scenarios ?
> 
> Yes.  I confirmed that AMBA bus driver enables the programming clock
> prior to calling CoreSight device's probes (see amba_probe()).
> 
> I checked other AMBA device drivers (e.g., drivers/dma/amba-pl08x.c)
> never touch APB programming clock and the clock by default is covered
> by AMAB bus driver.

Alright.

> 
>> Even if that is true - why cannot coresight_get_enable_apb_pclk() ensured
>> to be called only for the platform drivers cases via code re-organization,
>> rather than changing the coresight_get_enable_apb_pclk() helper itself.
> 
> The purpose is to unify the clock enabling for both static probe and
> dynamic (AMBA) probe.
> 
> Let us take funnel driver as an example.  With the change in this patch,
> the clock operations will be consolidated in a central place
> (e.g., funnel_probe()).  Therefore, we can avoid to spread the drvdata
> allocation and clock operations into dynamic probe and static (platform)
> probe separately.
> 
>   funnel_probe()
>   {
>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> 
>       drvdata->pclk = coresight_get_enable_apb_pclk();
>   }
> 
>   dynamic_funnel_probe()
>   {
>       funnel_probe();
>   }
> 
>   funnel_platform_probe()
>   {
>       funnel_probe();
>   }

Makes sense.

> 
> Thanks,
> Leo
> 
>>> To avoid this, add a check for device type and skip enabling the
>>> programming clock for AMBA devices.  The returned NULL pointer will be
>>> tolerated by the drivers.
>>>
>>> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>  include/linux/coresight.h | 11 +++++++----
>>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>> index b888f6ed59b2..26eb4a61b992 100644
>>> --- a/include/linux/coresight.h
>>> +++ b/include/linux/coresight.h
>>> @@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
>>>   * Returns:
>>>   *
>>>   * clk   - Clock is found and enabled
>>> + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
>>>   * ERROR - Clock is found but failed to enable
>>>   */
>>>  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>>>  {
>>> -	struct clk *pclk;
>>> +	struct clk *pclk = NULL;
>>>  
>>> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> -	if (IS_ERR(pclk))
>>> -		pclk = devm_clk_get_enabled(dev, "apb");
>>> +	if (!dev_is_amba(dev)) {
>>> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> +		if (IS_ERR(pclk))
>>> +			pclk = devm_clk_get_enabled(dev, "apb");
>>> +	}
>>>  
>>>  	return pclk;
>>>  }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
