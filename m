Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393DAAC074
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 11:54:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 226DFC78F72;
	Tue,  6 May 2025 09:54:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE821C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 09:54:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1E6113E;
 Tue,  6 May 2025 02:54:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10C63F5A1;
 Tue,  6 May 2025 02:54:32 -0700 (PDT)
Date: Tue, 6 May 2025 10:54:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20250506095428.GB177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-5-leo.yan@arm.com>
 <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/9] coresight: Disable programming
	clock properly
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

On Fri, May 02, 2025 at 11:40:31AM +0530, Anshuman Khandual wrote:
> Even though this might seem to be being bike shedding, the subject
> line above could be re-organized something like the following for
> better clarity.
> 
>  coresight: Properly/Appropriately disable programming clocks

Sure.  I will change the subject to this.

[...]

> > @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
> >  
> >  	__debug_remove(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> > -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> > -		clk_put(drvdata->pclk);
> >  }
> Should not these IS_ERR_OR_NULL() here be changed to IS_ERR() ?

For the case above, after changed to devm_clk_get_enabled() for the
enabling programming clocks, we don't need any special handling and
leave the clock disabling and releasing to the device model layer.

> Because now there could not be a NULL return value.
>
> drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev)
> 
> #ifdef CONFIG_PM
> static int debug_runtime_suspend(struct device *dev)
> {
>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> 
>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>                 clk_disable_unprepare(drvdata->pclk);
>         return 0;
> }
> 
> static int debug_runtime_resume(struct device *dev)
> {
>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> 
>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>                 clk_prepare_enable(drvdata->pclk);
>         return 0;
> }
> #endif

> There might more instances like these as well.
> 	
> git grep IS_ERR_OR_NULL drivers/hwtracing/coresight/ | grep "drvdata->pclk"
> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

I would like the current patch to focus on the issue of disabling /
releasing the programming clocks.

Though the IS_ERR_OR_NULL() check is redundant, it does not cause
issue or regression.  The refactoring is left in patch 09 for removing
IS_ERR_OR_NULL() checks.

Does this make sense?

Thanks
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
