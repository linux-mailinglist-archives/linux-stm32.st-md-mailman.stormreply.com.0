Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 668ACA654FB
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 16:05:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00306C78F80;
	Mon, 17 Mar 2025 15:05:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2A50CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 15:05:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso18758125e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742223944; x=1742828744;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtoKs4muQfIKjK2pfrzqLfYPjRO+KKfEwCIPoXdaWIE=;
 b=dzd2s/Qnva90MEkltN4mQa1UzFoh1FkHWRU5Qt5Fur5ITGLr+ChmKlZnAERQb/+rbb
 FJmqxUBvKLecr1MARC2F9RGxS/buO2BMsJJ5fu/r66RQGGrtpsfZVwds+l0IAH3kYSoy
 OYh7zztd/GkgyE0/FYumX93Ax1YZUnrfC+zOn2disKnYWmn111s/NsPMTM3cYHNk6yvq
 kqYKVbhhkoNwhFcrkqhCXjfg9xwWJMdy4EX6nBUwDedDcp+0VzaVtwlyhp6Y3hBSenVk
 eckTLoVlvng2rJ/dxovrE1sfAqvMq0Oc0SNShPeM5MJQh462FspbNcb75bSz4IJ+BK1T
 0Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742223944; x=1742828744;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VtoKs4muQfIKjK2pfrzqLfYPjRO+KKfEwCIPoXdaWIE=;
 b=fStzXr4RQ3LTqbPtnAwkuIjz/2jeqr0vNn8mz3kOCjuVAI6TrdoqBU+fsdnMmulkTz
 JMnXDNIkD13znFo5Hs8gMW4tf+LC90JybD63s3lRLBRx1aGAx57aCjvu+0aJJyi+X3xd
 rwrx1HnijLFaB6KUYsCUvkpB7GCW/EHc/tVOgRAZWBlLU5oY30oAL27MVDxr1zK2rB+Q
 56i/QU+6elp2C0F/mm8DqhEKrxfOq2IXwtuizGdRTyeRzLiE1RrJHxO4qyV1Hj8wxNmJ
 OHQVHo2JEiDu4d8PjOrcewzxuzfew5O64Oc+0+an6aQACdfiaAiRVYI2O5289dcCSew+
 YPNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSWD2TOuZc5lryYAUORvk8c2RqLpbEwbyOqYni5aWpaQd9Q6Jpjr2xmApIcGrFDgRA8CoIsu93wcgkwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YySXlSSXQPlWwtrky7SkILCkIrHK9UqkHEU4rt4ApPK0ea2Lv53
 5tsKtfN7LNHSuSITRcE1Rq/QTWhTiLG8lUOvzD1pZf6PN2Ie72pgF8IxyIsMi3U=
X-Gm-Gg: ASbGncvLc3Z2rs0lU9IyIR2o69MEsrKmDg3mjRMuTDmfgaNHTej0t5kiLlpl7HBd488
 /MHZu5hKII6U1b2uo65IcpBs6HmCn29PNxVPE90zvQzAb5OHwYHgrAFEkKyrQHLpvQb3zOyQRQz
 bsucCEoWU8m+VqCDxE2kuf/pHD6QZ1xZL40v3HBiNJzwbutZASPJtKrveyzX7dGl5Lof3qqT8Mm
 LexmerQJefiQFuZz09M/6iMqRd0P7jvSAT8c3Zkrit+TSWALTaAv1kVIMkhE9OWViAIbpNNUYax
 H+Y7bbF9YXdmUd2D8WVpPE/7eGaCwndSExDXmX6bApSqHkFYlPm26w==
X-Google-Smtp-Source: AGHT+IFr4VZWBjzWUJMxKCB2olOOjvXpHwk1/Fc+c0jvMCr6/FceLLDOg2yCTQ+piJ+So3TuCF5r+w==
X-Received: by 2002:a05:600c:1547:b0:43d:300f:fa1d with SMTP id
 5b1f17b1804b1-43d38a0da56mr1480995e9.31.1742223943934; 
 Mon, 17 Mar 2025 08:05:43 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb626esm107164485e9.8.2025.03.17.08.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:05:43 -0700 (PDT)
Message-ID: <6be400e2-a464-4714-acf4-328dade883a9@linaro.org>
Date: Mon, 17 Mar 2025 15:05:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-6-james.clark@linaro.org>
 <20250313160409.GS9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313160409.GS9682@e132581.arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/7] coresight: Clear self hosted claim
	tag on probe
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



On 13/03/2025 4:04 pm, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:41AM +0000, James Clark wrote:
>>
>> This can be left behind from a crashed kernel after a kexec so clear it
>> when probing each device. Similarly to
>> coresight_disclaim_device_unlocked(), only clear it if it's already set
>> to avoid races with an external debugger.
>>
>> We need a csdev_access struct in etm_init_arch_data() so just replace
>> the iomem pointer with a full csdev_access struct. This means all usages
>> need to be updated to go through csa->base.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c  |  1 +
>>   drivers/hwtracing/coresight/coresight-core.c  | 48 +++++++++++++++----
>>   .../hwtracing/coresight/coresight-cti-core.c  |  2 +
>>   drivers/hwtracing/coresight/coresight-etb10.c |  2 +
>>   drivers/hwtracing/coresight/coresight-etm.h   |  6 +--
>>   .../coresight/coresight-etm3x-core.c          | 28 +++++------
>>   .../coresight/coresight-etm3x-sysfs.c         |  8 ++--
>>   .../coresight/coresight-etm4x-core.c          |  2 +
>>   .../hwtracing/coresight/coresight-funnel.c    |  2 +
>>   .../coresight/coresight-replicator.c          |  1 +
>>   .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
>>   include/linux/coresight.h                     |  3 ++
>>   12 files changed, 73 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
>> index d9259c0b6e64..575c2d247a90 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>>          catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>>          catu_desc.ops = &catu_ops;
>>
>> +       coresight_reset_claim(&catu_desc.access);
>>          drvdata->csdev = coresight_register(&catu_desc);
>>          if (IS_ERR(drvdata->csdev))
>>                  ret = PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 7fe5d5d432c4..97f33ffad05e 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -212,20 +212,48 @@ int coresight_claim_device(struct coresight_device *csdev)
>>   EXPORT_SYMBOL_GPL(coresight_claim_device);
>>
>>   /*
>> - * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
>> + * Clear the claim tag for the device.
>> + * Returns an error if the device wasn't already claimed.
>> + */
>> +int coresight_reset_claim(struct csdev_access *csa)
>> +{
>> +       int ret;
>> +
>> +       CS_UNLOCK(csa->base);
>> +       ret = coresight_reset_claim_unlocked(csa);
>> +       CS_LOCK(csa->base);
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_reset_claim);
> 
> Maybe my question is overlapping with Mike's comment.
> 
> Callers never check the return values from coresight_reset_claim(). I am

I can remove the return value if it's confusing. The thought process was 
probably that it could be useful somewhere in the future, and 
coresight_reset_claim_unlocked() returns something anyway so might as 
well pass it up.

> wandering if coresight_reset_claim() can directly call
> coresight_clear_self_claim_tag() for _trying_ to clear self-host tag in
> probe phase. Any self claim tag issues will be deferred to detect until
> enable the component.
> 

Maybe, the spec does a read before setting which I assumed should be 
done for clearing as well. As in to not touch anything if it's in use 
externally. It doesn't specifically describe any clearing sequence, but 
if we assume it's ok to blindly clear self hosted flag even when it's in 
use then yes we can directly call coresight_clear_self_claim_tag().

This doesn't change anything about deferring errors though, 
coresight_reset_claim() doesn't warn early either.

> For consistent, we might rename coresight_reset_claim() to
> coresight_reset_self_claim_tag(), which acquires CS lock and clear
> self claim tag.
> 
>> +/*
>> + * Clear the claim tag for the device. Called with CS_UNLOCKed for the component.
>> + * Returns an error if the device wasn't already claimed.
>> + */
>> +int coresight_reset_claim_unlocked(struct csdev_access *csa)
>> +{
>> +       if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED) {
>> +               coresight_clear_self_claim_tag(csa);
>> +               return 0;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_reset_claim_unlocked);
>> +
>> +/*
>> + * coresight_disclaim_device_unlocked : Clear the claim tag for the device
>> + * and warn if the device wasn't already claimed.
>>    * Called with CS_UNLOCKed for the component.
>>    */
>>   void coresight_disclaim_device_unlocked(struct csdev_access *csa)
>>   {
>> -       if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
>> -               coresight_clear_self_claim_tag(csa);
>> -       else
>> -               /*
>> -                * The external agent may have not honoured our claim
>> -                * and has manipulated it. Or something else has seriously
>> -                * gone wrong in our driver.
>> -                */
>> -               WARN_ON_ONCE(1);
>> +       /*
>> +        * Warn if the external agent hasn't honoured our claim
>> +        * and has manipulated it. Or something else has seriously
>> +        * gone wrong in our driver.
>> +        */
>> +       WARN_ON_ONCE(coresight_reset_claim_unlocked(csa));
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index 073f67a41af9..389a72362f0c 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>>          cti_desc.ops = &cti_ops;
>>          cti_desc.groups = drvdata->ctidev.con_groups;
>>          cti_desc.dev = dev;
>> +
>> +       coresight_reset_claim(&cti_desc.access);
>>          drvdata->csdev = coresight_register(&cti_desc);
>>          if (IS_ERR(drvdata->csdev)) {
>>                  ret = PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
>> index d8bc3e776c88..b598b2c0c9bb 100644
>> --- a/drivers/hwtracing/coresight/coresight-etb10.c
>> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
>> @@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>>          desc.pdata = pdata;
>>          desc.dev = dev;
>>          desc.groups = coresight_etb_groups;
>> +
>> +       coresight_reset_claim(&desc.access);
>>          drvdata->csdev = coresight_register(&desc);
>>          if (IS_ERR(drvdata->csdev))
>>                  return PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
>> index e02c3ea972c9..a89736309c27 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm.h
>> @@ -229,7 +229,7 @@ struct etm_config {
>>    * @config:    structure holding configuration parameters.
>>    */
>>   struct etm_drvdata {
>> -       void __iomem                    *base;
>> +       struct csdev_access             csa;
> 
> I would like to extract the change for using `csdev_access` in the
> ETMv3 driver into a new patch, which is irrelevant to reset self claim
> tags and would significantly reduce the complexity in this patch.
> 

Will do, good point.

> Thanks,
> Leo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
