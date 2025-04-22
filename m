Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3600DA960E5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 10:21:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0E70C78F6F;
	Tue, 22 Apr 2025 08:21:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C83AAC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:21:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94764152B;
 Tue, 22 Apr 2025 01:21:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6740C3F66E;
 Tue, 22 Apr 2025 01:21:13 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:21:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20250422082108.GB28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-2-leo.yan@arm.com>
 <b409c701-f126-4e07-ba14-75280529689b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b409c701-f126-4e07-ba14-75280529689b@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/9] coresight: tmc: Support atclk
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

On Thu, Apr 03, 2025 at 11:20:38AM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:07, Leo Yan wrote:
> > The atclk is an optional clock for the CoreSight TMC, but the driver
> > misses to initialize it.  In most cases, the TMC shares the same atclk
> 
> TMC shares the atclk or pclk clock with other coresight components ?

I will refine the commit log for this.

[...]

> > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >  	struct coresight_desc desc = { 0 };
> >  	struct coresight_dev_list *dev_list = NULL;
> >  
> > +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +	if (IS_ERR(drvdata->atclk))
> > +		return PTR_ERR(drvdata->atclk);
> > +
> 
> Adding this check here in __tmc_probe() ensures that it gets called
> both during AMBA and platform probe methods.

Yes.

> >  /**
> >   * struct tmc_drvdata - specifics associated to an TMC component
> > + * @atclk:	optional clock for the core parts of the TMC.
> >   * @pclk:	APB clock if present, otherwise NULL
> >   * @base:	memory mapped base address for this component.
> >   * @csdev:	component vitals needed by the framework.
> > @@ -244,6 +245,7 @@ struct tmc_resrv_buf {
> >   *		 Used by ETR/ETF.
> >   */
> >  struct tmc_drvdata {
> > +	struct clk		*atclk;
> >  	struct clk		*pclk;
> >  	void __iomem		*base;
> >  	struct coresight_device	*csdev;
> 
> Otherwise, LGTM.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks for reviewing!

Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
