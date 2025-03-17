Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA6A64D68
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 12:56:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7B1FC78F80;
	Mon, 17 Mar 2025 11:56:21 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AD66CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 11:56:20 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso795727266b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742212579; x=1742817379;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nvSmeQlqS0PVSiztlrJp1EnapLR9YnzwoX8WjGMczkU=;
 b=iVEMfaqXFqGEOki87TbvSQXyiHpXhjMFrv////5ePmKPXuP+AqR0SY+Uy4GYpPIdny
 b58m9FSEECFNAUDam/GeDXFbm9Wbau8D0xgo1Ecm2eqguYGp5r1uRMr0UdEd22yw0zzh
 3CAmn6s7FAaRCjnrTLU1j8J6kgJXF2TEXQQCq1SVo8nb+Q85CazdQBRsWJp830LLSkt+
 TZ3zE1awKyA3Qg1gCvrZPeUDoubampByvfixq7/l/Ybjl4dcWllaXmrxCNhRZyiuudO8
 aV35TcQy3YBQ5+mYzFouWLpRBoJAf1PF/M8KUATkClEBuwi1/dc5vT1+/8H1GszoT3l3
 xENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742212579; x=1742817379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nvSmeQlqS0PVSiztlrJp1EnapLR9YnzwoX8WjGMczkU=;
 b=M8KPhvNgPlspFZlLvxVGbKmlejGO1SDBpvj4vWNc6Fau2XrbP1dhRNnrffaJwLuMG1
 i7/stVB31JNu+k6IC4eqB1Mig+IFiPjaGjBEkKuKP8fzkeNQbSh1lNerSe/XGqBNzjUC
 nYUovofh1hbScg1h0ovg1sUjh6ETCTDCoLlzwJiS/1ByIXzEAYfWQxzxFTgDUKWwegiE
 AUErpV6t/ymXP3loDUkMFsZJIIeMhlEDLPSSWub0hhUYm6aJ1WkPBrfjO+MKGrFBBPdf
 u6zk0H5o6Y/HugEODn+WY3axETG8KvOt5BACSCE4BLznw4DB1gm2E+tIgfK+uVKxe2C9
 JLCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+im4AHSB+y/rCk5U5ADWLw0UmVt9uYCSUurX0Hs7css0nfYJSkkN/Ymhlub4zsODIDVHSjmZRrtO4KA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywer1xZ5QqAcLdPcGKWsrFBNQGYdGdrqlOJ8xN63vxbh9EXygbl
 0Ch1Yks32a+qJA1FgffvGueT/whRyrpISljnSHuZ/3ifl317h6lToM2EiCh3xJ8=
X-Gm-Gg: ASbGncvpNdQ/JHGCLddDp4NUo9RT3TvBosfC7/058k17NYpWoFE/m8MipFS0R1TD8a8
 F9UWSjFM/wh9gIjGDfsQgDBvaxxOUH16MpFkQK8b1R8mCQwCaCuvTz/CieKoGQ0zuqI+8nlUE7u
 U4taFRnLVJkXUhZ+mndHZVdONbk8uk0J75JSENQJbD4TnuvJqH7v5hvlcFXei8CzDE28TTliL3k
 +SUhfMChBUFLk0NXrObgINM4jPR87jWtcgry8az1qav4cxR69xCEVROdsIvgCL87OGKjsfTqEXr
 PSUc2AfvVbGETMCBEkkDTz5sCwHDDYbteBhMz06OJDw01/CwEkA3Ag==
X-Google-Smtp-Source: AGHT+IElqC4N7WBdN/UwREha3sJL0AOI9i9gOEBfGevhPlzqhMr3fPOn8XBHjesPAtYa3nhFewNk9Q==
X-Received: by 2002:a17:907:a089:b0:ac1:ea39:9b9f with SMTP id
 a640c23a62f3a-ac330461ce4mr1164128466b.54.1742212579456; 
 Mon, 17 Mar 2025 04:56:19 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a3e0e4sm657815566b.136.2025.03.17.04.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:56:19 -0700 (PDT)
Message-ID: <a4bce4f5-88c3-4755-9ac5-3ce6fb78dfbf@linaro.org>
Date: Mon, 17 Mar 2025 11:56:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-5-james.clark@linaro.org>
 <20250313144005.GQ9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313144005.GQ9682@e132581.arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 4/7] coresight: Add claim tag warnings and
	debug messages
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



On 13/03/2025 2:40 pm, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:40AM +0000, James Clark wrote:
>>
>> Add a dev_dbg() message so that external debugger conflicts are more
>> visible. There are multiple reasons for -EBUSY so a message for this
>> particular one could be helpful. Add errors for and enumerate all the
>> other cases that are impossible.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-priv.h |  5 +-
>>   2 files changed, 34 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 7b53165c93af..7fe5d5d432c4 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -133,16 +133,6 @@ static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
>>                           csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
>>   }
>>
>> -static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
>> -{
>> -       return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
>> -}
>> -
>> -static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>> -{
>> -       return coresight_read_claim_tags(&csdev->access) != 0;
>> -}
>> -
>>   static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
>>   {
>>          csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
>> @@ -169,18 +159,40 @@ static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
>>    */
>>   int coresight_claim_device_unlocked(struct coresight_device *csdev)
>>   {
>> +       int tag;
>> +       struct csdev_access *csa;
>> +
>>          if (WARN_ON(!csdev))
>>                  return -EINVAL;
>>
>> -       if (coresight_is_claimed_any(csdev))
>> +       csa = &csdev->access;
>> +       tag = coresight_read_claim_tags(csa);
>> +
>> +       switch (tag) {
>> +       case CORESIGHT_CLAIM_FREE:
>> +               coresight_set_self_claim_tag(csa);
>> +               if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
>> +                       return 0;
>> +
> 
> It would be a rare case if a failure happens here.  Seems to me, it
> would be valuable to print a log for this edge case.
> 
> Otherwise, looks good to me.
> 

Yeah I can add dev_dbg("Busy: Couldn't set self claim tag"). Just to 
distinguish this race case from the other busy case.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
