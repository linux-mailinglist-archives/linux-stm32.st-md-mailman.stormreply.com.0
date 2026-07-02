Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ju43Kt23RWoUEQsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 02:59:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237A6F2B3B
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 02:59:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=JF4qzEFX;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=ilrRbQ94;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E10D7C7C7CB;
	Thu,  2 Jul 2026 00:59:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25E0BC712A3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 00:59:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 661LhMHH2449972
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 2 Jul 2026 00:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=; b=JF4qzEFXU+yZIg8T
 /wqtw9aJGtGfaeaQKbaGfomaPrPefT+PcKuRvfCds5RVKim7r64NQ3zTjxCTQZze
 WynCW2jdv/jP44CMKHkTDc4UqYfcrEmpcBywB0AueE4wsWNA4vK+se4Gy6Dndo4g
 7caQpDzv28GbP80sC/YIjXQFFsRJUd8bLB0I6lLhkCcW8OfLqe72xRJFunsfkSH/
 D7cfMYD7EKVbRw6jtVdrTFCbYGmOttG1u9Q9etWBVPGjIbBTQ1eEyAVdWU3iy+LP
 q179ryI26lltqmqNy9aPcoeqdt7qDvjXA4A5iFX2aW2lrV63r1hwch0WAIpi65Td
 gfiqhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rsjq3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 00:59:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-37e1f96b248so1740820a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2026 17:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782953946; x=1783558746;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=;
 b=ilrRbQ943WcXBGGJsKch8nhctj65fHMJ8sPbI5lp2CEijXsabjT4gP13NALFewuD/L
 6jIXd4hJeOSgt3NZqg3rJOqPO8rH+pN1ex+so7WcyNfYq2HBGc2VlK8J4mOgtD7jIcXU
 dSSDK/+Xl2aw4yvZZOSro0iSjuFkVNPpC0JVFjtyTW5U2Uvz1Vmsbf8uDa33uYTjajfz
 ck8MQWX3b3qHlxmh4FRccNS+TP3/0mKfepZ016V7BR0JBsISh3wrL5XPDEdbiaMqynlK
 xuaOyCMRy9VTFWB3JEdcjWZPhs1IRdy8BDXCGzwrJkt5Y7hnrfXfNOdin1fyCkc09pVY
 7Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782953946; x=1783558746;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1UwChVv2LtnlZ6kQ8NqUjUr2PJVqhAPZ5x3pEIn4KZE=;
 b=tZeexg2POPEE7RTLgdHkJNsGacfsMN+WUsTqBD7Y7h5N9o9Gh0W7ALFrec4NG1nJm/
 UraAmMsY/Q5YlUjhAJA/KX8mHwtW8M9GJhk5bUR/PFN+GAzxigFwrNTJnHx1C5liK9bV
 zN2VI8mdwOVyA7f58N+yZc2OkzISmPySBG1qWKuOGMGWYycGDTqC9D9db5mCQyZgb0EF
 +8pf4tj4xWREJ+sakomPBpuZzTirwaVFfGV3RNZcgyJ898vEYwFDxRVazmQMaEAq5gMt
 EEPLf4Cx+UCnWUmwEVg4JMlZ4l1rJ1UCewY/i6eRtqooDSp+ROZ8odm0FnbKpXfh0VOa
 adRw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFfp5JilbVvnkrPZZxZ2QtyZ6GCjkhU8uZ4yj8PqkxKwMxt9fMzteIHjN6KDqMbySd0ux+bCpDvk2UOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9SYhbog3gomoH7PRjXOiI/+RnMVtL4fbPtqiMOjx0xtjE5n6L
 NzWRk6MrvTPzp7Vgch9B0oz+vgU7oAfWvQO11js4Wfa2ST1xoeVHGkwk7N6+T+TRiFxs4MqsYGH
 HmPDguYMv+e4B6U06wKcazwFsnNZHAu9DEFbfV1EKo79Yx/UPAQFWUfAZZvqywaq263pliq4Lal
 B9+rEF23I=
X-Gm-Gg: AfdE7clhh94GfbNxSiPqCX7k+tIRdCa3UtuNr1uAgunlFlrSZF/LnWqkFfnb7KirBKE
 nxMSQV6rHonG5WY5pCRgNcPnjSA5JCTJaQzv4QT2GeKwHXVNC1VGgy4EctU5mSBCujBYkfhJN0h
 zCGk/07n+7b5EYMr7maEHLgDstZwLPDV988QlCLlOIHkhCmXAAUsZUcxQqsZa1o70Y1T19fMNSs
 D/i5OHXtRrVkXQwFqLNq9KfB7xGSz8YDtS/uOdAwIjPJYy4r2TUjka18u7O9i0kwUCXQJu7Wese
 GUkigqoy63wLjiybiYzP85380/gro90Z0hweUfQRZsThYwfUDoX7SmuIcoMLZ8jojAYdXmoOSZP
 iNeLThPcVdJq+oB5DdQ/EGyrc9dGdFdoZA/13kTKIfVrQItOUVmBDMP/rEJw+ix9zz3veSYsx1q
 tg
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id
 98e67ed59e1d1-380aa0ac3d4mr4195451a91.1.1782953945637; 
 Wed, 01 Jul 2026 17:59:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id
 98e67ed59e1d1-380aa0ac3d4mr4195422a91.1.1782953945182; 
 Wed, 01 Jul 2026 17:59:05 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-380e15e6e33sm86819a91.5.2026.07.01.17.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 17:59:04 -0700 (PDT)
Message-ID: <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 08:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
 <20260701162321.GG1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260701162321.GG1812158@e132581.arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAwNyBTYWx0ZWRfX7pB3FXO9UNoP
 eS3ZHWmC2Pji6IqGNFCbO1B+kbbdZgE1PfKcv/sTH1Jpi6nGyTxxKOztzc4aylpNHhSLtDLAFq7
 N3gZ89/edcfqS1I2wTuAShi70u4gycZmBTBePvp2x85fYked0MIZhZosfGW8QcMygZdFs4xVPAU
 eymHlMLeGP5Yx/wk2gVCaKUvg2siX0XDZeEJlZl9gPJMmx1FLkGAz2tpg2WUYqAodvjzi5nK5Bf
 NMiwu5tp3HomwGDZ5OYXCOomg8hl3qipB9ZaJsm9REphSfeb/IwkDtdTHcLo/PhWb1TjcTBU2h6
 +3BMgKLbymkm6//wMRLdjQfUBogBECkstBfX/5cL5b/BgTiptYhlIzzw3m13TCc7vfgHRICuSHc
 FYgJ4AQtx9IwaHg6vjlmEHkJem0Dj1WJLvVUOvVFrXaOz/qwtloRkjpxjzbsNo9myc9aMNDQztG
 allL8FK3YCaSRL5jVXw==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a45b7da cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2XoT9cGsJh1acgpUKzsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: qe4i1ngykJ2ZPr-QP8zzbTC-z47tnChD
X-Proofpoint-ORIG-GUID: qe4i1ngykJ2ZPr-QP8zzbTC-z47tnChD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAwNyBTYWx0ZWRfX+zqzyZPfQguV
 0aMSZtwjHet6kJj6d7O9T3l1QUR7g5y+Su0Ne7Y1X/Q4Q3AWC64+hXfYuw3bPm/bX24wg12sUL1
 3as9cD102xeKRZfLWutS+WEepqNvGkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020007
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] coresight: Fix clock refcount
 imbalance on platform remove
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,linux.intel.com,vger.kernel.org,linaro.org,st-md-mailman.stormreply.com,oss.qualcomm.com,lists.linaro.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:mcoquelin.stm32@gmail.com,m:anshuman.khandual@arm.com,m:alexander.shishkin@linux.intel.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:yuanfang.zhang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:mike.leach@arm.com,m:coresight@lists.linaro.org,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3237A6F2B3B

Hi Leo,

On 7/2/2026 12:23 AM, Leo Yan wrote:
> On Wed, Jul 01, 2026 at 02:05:02PM +0800, Jie Gan wrote:
> 
>> After probe, pm_runtime_put() allows the device to suspend and the
>> runtime suspend callback disables the same clocks. During remove the
>> device is left runtime suspended, so pm_runtime_disable() freezes it
>> with the clocks already disabled. The devm cleanup that runs afterwards
>> calls clk_disable_unprepare() a second time, underflowing the clock
>> enable refcount.
> 
> Thanks for fixing the issue.
> 
> The problem is that if the device has already been runtime suspended and
> its clock has been disabled, afterwards when remove the device, the devm
> cleanup disables the clock again, resulting in clock count underflow.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
>> index 0abc11f0690c..4c5b94640e6a 100644
>> --- a/drivers/hwtracing/coresight/coresight-funnel.c
>> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
>> @@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
>>   		return;
>>   
>>   	funnel_remove(&pdev->dev);
>> +	pm_runtime_get_sync(&pdev->dev);
>>   	pm_runtime_disable(&pdev->dev);
> 
> Let's use the funnel driver for the discussion. Once we agree on the
> approach, we can apply the same change to the other CoreSight platform
> drivers.
> 
> How about the following teardown?
> 
>   static void funnel_platform_remove(struct platform_device *pdev)
>   {
>          struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +       int ret;
> 
>          if (WARN_ON(!drvdata))
>                  return;
> 
> +       ret = pm_runtime_get_sync(&pdev->dev);
> +       if (ret < 0)
> +               dev_warn(&pdev->dev, "failed to resume before remove: %d\n", ret);
> +
>          funnel_remove(&pdev->dev);
> +
>          pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
>   }

This proposal looks good to me. I forgot to add pm_runtime_put_noidle to 
drop the useless reference which created by pm_runtime_get_sync.

Thanks,
Jie

> 
> The idea is to first resume the device with pm_runtime_get_sync(), then
> perform the remove (which is safe if they need to access or clean up
> hardware state), and finally clean up the runtime PM states. I mainly
> referred to drivers/iio/adc/stm32-adc.c.
> 
> Thanks,
> Leo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
