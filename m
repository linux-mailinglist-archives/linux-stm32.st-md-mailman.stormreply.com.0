Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ej3ZMtnbRGru2AoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 11:20:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC56EB8B0
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 11:20:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=arm.com header.s=foss header.b=dsOz8qYT;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=arm.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08758C8F262;
	Wed,  1 Jul 2026 09:20:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA8D4C6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 09:20:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E54B1D15;
 Wed,  1 Jul 2026 02:20:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58F583F905;
 Wed,  1 Jul 2026 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1782897622; bh=iMS7QlGpFIb3nV5N5xKvGc6g2B7VUXc78uu68pn2PyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsOz8qYTQaUth7Od3qXomWYYmuCI0lNYIyXC9Mv7T5zPERdfz95NWbYY5IBsMyKPr
 3zKBEt/8zO5baNCddUpSyEIIoUkdXgqtXaHwF7+JRdSXFhoq5xZdsmL3HUjJe53tpU
 JZSeF/Hm8V/53nE5vGKMUYA+4o6ijW7K3VKRJdhc=
Date: Wed, 1 Jul 2026 10:20:17 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Message-ID: <akTb0WAUvQFclDw6@e129823.arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
 Leo Yan <leo.yan@arm.com>, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[arm.com:s=foss];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:anshuman.khandual@arm.com,m:alexander.shishkin@linux.intel.com,m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:mike.leach@arm.com,m:coresight@lists.linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yeoreum.yun@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,linux.intel.com,linaro.org,st-md-mailman.stormreply.com,vger.kernel.org,oss.qualcomm.com,lists.linaro.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[arm.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yeoreum.yun@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,arm.com:from_mime,arm.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55BC56EB8B0

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Wed, Jul 01, 2026 at 02:05:02PM +0800, Jie Gan wrote:
> coresight_get_enable_clocks() enables the programming clock and the
> optional AT clock through devm_clk_get_optional_enabled(), which also
> registers a devm action to call clk_disable_unprepare() when the driver
> detaches.
> 
> After probe, pm_runtime_put() allows the device to suspend and the
> runtime suspend callback disables the same clocks. During remove the
> device is left runtime suspended, so pm_runtime_disable() freezes it
> with the clocks already disabled. The devm cleanup that runs afterwards
> calls clk_disable_unprepare() a second time, underflowing the clock
> enable refcount.
> 
> Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
> so the clocks are enabled again and balance the devm-managed disable.
> 
> This affects all CoreSight platform drivers that obtain their clocks
> through coresight_get_enable_clocks(): catu, cpu-debug, ctcu, etm4x,
> funnel, replicator, stm, tmc and tpiu.
> 
> Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 1 +
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  | 1 +
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
>  drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  drivers/hwtracing/coresight/coresight-stm.c        | 1 +
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
>  9 files changed, 9 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index ad8dafea7d2f..f7e501e6cbd7 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -647,6 +647,7 @@ static void catu_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__catu_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 3a806c1d50ea..f7efae5b5ce5 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -711,6 +711,7 @@ static void debug_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__debug_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01..9b6da29d9735 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -266,6 +266,7 @@ static void ctcu_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	ctcu_remove(pdev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 14bb31bd6a0b..147761024c0f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2416,6 +2416,7 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
>  
>  	if (drvdata)
>  		etm4_remove_dev(drvdata);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..4c5b94640e6a 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	funnel_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 2f382de357ee..2d765f1f73b3 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -313,6 +313,7 @@ static void replicator_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	replicator_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 4e860519a73f..a653f1eebeca 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -1026,6 +1026,7 @@ static void stm_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__stm_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index bc5a133ada3e..c9cf486873e2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -989,6 +989,7 @@ static void tmc_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__tmc_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 7b029d2eb389..72ac93749be1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -286,6 +286,7 @@ static void tpiu_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__tpiu_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
Sincerely,
Yeoreum Yun
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
