Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13945AAC1C4
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 12:53:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A961FC78F7B;
	Tue,  6 May 2025 10:53:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04B93C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 10:53:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E73B113E;
 Tue,  6 May 2025 03:53:47 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D70033F673;
 Tue,  6 May 2025 03:53:56 -0700 (PDT)
Date: Tue, 6 May 2025 11:53:52 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20250506105352.GE177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-8-leo.yan@arm.com>
 <08690315-ce0e-4b2e-b85e-d8b9a82f4b11@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08690315-ce0e-4b2e-b85e-d8b9a82f4b11@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 7/9] coresight: Consolidate clock
	enabling
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

On Mon, May 05, 2025 at 12:58:06PM +0530, Anshuman Khandual wrote:

[...]

> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -1645,6 +1645,51 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
> >  }
> >  EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> >  
> > +/*
> > + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> > + * for the given device.
> > + *
> > + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> > + * skip to get and enable the pclk for an AMBA device.
> > + *
> > + * atclk is an optional clock, it will be only enabled when it is existed.
> > + * Otherwise, a NULL pointer will be returned to caller.
> > + *
> > + * Returns: '0' on Success; Error code otherwise.
> > + */
> > +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> > +				struct clk **atclk)
> 
> These arguments probably could be arranged better as pclk and atclk are
> always contained inside 'xxx_drvdata' structure, which could be derived
> from the 'dev' structure itself, if [dev|platform]_set_drvdata() always
> ensured to be called earlier.

Seems to me, the conclusion "pclk and atclk ... could be derived from
the 'dev' structure itself" is not true.

The reason is the coresight_get_enable_clocks() function is located in
the CoreSight core layer, it has no knowledge for driver data
definitions (see etmv4_drvdata, funnel_drvdata, etc).  as a result, it
cannot directly access the fields "drvdata->pclk" and "drvdata->atclk".

> Currently there are only two instances where a NULL is being passed to
> indicate that 'atclk' clock is not to be probed or enabled. Could not
> individual clock requirements be passed in a flag argument instead ?
> 
> #define CORESIGHT_ENABLE_PCLK	0x1
> #define CORESIGHT_ENABLE_ATCLK	0x2
> 
> coresight_get_enable_clocks(struct device *dev, unsigned long flags)
> 
> - atclk/pclk derived from drdvata which in turn from dev
> - flags can be checked for pclk/atclk requirements
> 
> Even better - as atlck is the only optional clock here, it could just
> have a boolean flag argument to indicate for atclk clock.
>
> > +{
> > +	WARN_ON(!pclk);
> > +
> > +	if (!dev_is_amba(dev)) {
> > +		/*
> > +		 * "apb_pclk" is the default clock name for an Arm Primecell
> > +		 * peripheral, while "apb" is used only by the CTCU driver.
> > +		 *
> > +		 * For easier maintenance, CoreSight drivers should use
> > +		 * "apb_pclk" as the programming clock name.
> > +		 */
> > +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(*pclk))
> > +			*pclk = devm_clk_get_enabled(dev, "apb");
> > +		if (IS_ERR(*pclk))
> > +			return PTR_ERR(*pclk);
> > +	} else {
> > +		/* Don't enable pclk for an AMBA device */
> > +		*pclk = NULL;
> > +	}
> 
> Might be better to invert this conditional check as if (dev_is_amba(dev))
> for better readability.

Will refine code for this.

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
