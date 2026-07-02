Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id brXOJiUhRmrWKQsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 10:28:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDAB6F4C87
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 10:28:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=arm.com header.s=foss header.b=JOEiNkJL;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=arm.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE65C8F262;
	Thu,  2 Jul 2026 08:28:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6F31C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 08:28:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E001476;
 Thu,  2 Jul 2026 01:28:14 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EAF03F905;
 Thu,  2 Jul 2026 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1782980898; bh=4uwRXUUaqg2LeGraF1sC1rIcMEkH9EPqVnUDYuI36uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOEiNkJLrf6wAP5HQ7kzLtcNLcAMFPURoGojkjfq+OPYfgatn8K+BcxT/IiIyLQuQ
 YApz4P5J6fx4nJcVgLYygC2tRIjfEhARRy9xNfLn6q3CQlV5S2i4ZMwPUP6Hip1juK
 GT6xSNPLnC2lv+N1Bg36xHSq+DF6TiHXDXWc0zZ8=
Date: Thu, 2 Jul 2026 09:28:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Message-ID: <20260702082816.GH1812158@e132581.arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
 <20260701162321.GG1812158@e132581.arm.com>
 <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
 <4e41e58e-5fbf-4564-bf9e-cec42570f3d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e41e58e-5fbf-4564-bf9e-cec42570f3d5@oss.qualcomm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[arm.com:s=foss];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:anshuman.khandual@arm.com,m:alexander.shishkin@linux.intel.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:yuanfang.zhang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:mike.leach@arm.com,m:coresight@lists.linaro.org,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,linux.intel.com,vger.kernel.org,linaro.org,st-md-mailman.stormreply.com,oss.qualcomm.com,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[arm.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BDAB6F4C87

On Thu, Jul 02, 2026 at 09:56:05AM +0800, Jie Gan wrote:

>  static void funnel_platform_remove(struct platform_device *pdev)
>  {
>         struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> 
>         if (WARN_ON(!drvdata))
>                 return;
> 
> -       funnel_remove(&pdev->dev);
> +       /*
> +        * Resume the device so its clocks are enabled again, balancing the
> +        * clk_disable_unprepare() that devm runs when the driver detaches.
> +        * Then mark it suspended and drop the usage count taken here.
> +        */
>         pm_runtime_get_sync(&pdev->dev);
> +       funnel_remove(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);

LGTM. Thanks for writing up the comment. Please proceed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
