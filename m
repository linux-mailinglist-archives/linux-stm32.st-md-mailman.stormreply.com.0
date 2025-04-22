Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8262EA96409
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 11:21:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35425C78F68;
	Tue, 22 Apr 2025 09:21:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F349EC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 09:21:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E99BC152B;
 Tue, 22 Apr 2025 02:21:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22443F5A1;
 Tue, 22 Apr 2025 02:21:12 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:21:07 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20250422092107.GC28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-8-leo.yan@arm.com>
 <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 7/9] coresight: Make clock sequence
	consistent
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

On Thu, Apr 03, 2025 at 12:40:39PM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:08, Leo Yan wrote:
> > Since atclk is enabled after pclk during the probe phase, this commit
> > maintains the same sequence for the runtime resume flow.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
> >  drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
> >  drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
> >  drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
> >  4 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> > index ec6d3e656548..e378c2fffca9 100644
> > --- a/drivers/hwtracing/coresight/coresight-funnel.c
> > +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> > @@ -299,11 +299,11 @@ static int funnel_runtime_resume(struct device *dev)
> >  {
> >  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
> >  
> > -	if (drvdata && !IS_ERR(drvdata->atclk))
> > -		clk_prepare_enable(drvdata->atclk);
> > -
> >  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> >  		clk_prepare_enable(drvdata->pclk);
> > +
> > +	if (drvdata && !IS_ERR(drvdata->atclk))
> > +		clk_prepare_enable(drvdata->atclk);
> >  	return 0;
> >  }
> 
> funnel_probe() enables pclk after atclk though - which needs to be
> reversed as well ?

Good point!

The key point is a dynamic probe enables pclk clock in AMBA bus driver,
which is anyway prior to enable atclk.

We need to keep consistent flow for all flows (static probe, dynamic
probe, runtime PM resume).  The patch 09 consolidates clock enabling for
static and dynamic probe, and this patch is for runtime PM.

For a better organization, I will place this patch after the patch 09
in the next spin.

[...]

> I assume this patch is trying to have the same clock sequence enablement
> during original probe and resume path and then just the reverse sequence
> during suspend path.

Correct.  As said, the patch 09 is for clock enabling sequence in
probe, and this patch is for the resume path.

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
