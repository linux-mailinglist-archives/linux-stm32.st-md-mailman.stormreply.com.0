Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CFA77EEE
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Apr 2025 17:29:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91843C78F90;
	Tue,  1 Apr 2025 15:29:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB7FFC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 15:29:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3248714BF;
 Tue,  1 Apr 2025 08:29:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CED03F694;
 Tue,  1 Apr 2025 08:29:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:29:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250401152945.GE115840@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jie Gan <quic_jiegan@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 9/9] coresight: Consolidate clock
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

On Tue, Apr 01, 2025 at 03:58:42PM +0100, James Clark wrote:

[...]

> >   /*
> > - * Attempt to find and enable "APB clock" for the given device
> > + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> > + * for the given device.
> >    *
> > - * Returns:
> > + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> > + * skip to get and enable the pclk for an AMBA device.
> >    *
> > - * clk   - Clock is found and enabled
> > - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> > - * ERROR - Clock is found but failed to enable
> > + * atclk is an optional clock, it will be only enabled when it is existed.
> > + * Otherwise, a NULL pointer will be returned to caller.
> > + *
> > + * Returns: '0' on Success; Error code otherwise.
> >    */
> > -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> > +static inline int coresight_get_enable_clocks(struct device *dev,
> > +					      struct clk **pclk,
> > +					      struct clk **atclk)
> 
> This function has grown a bit now, probably best to remove it from the
> header and export it instead.

Sure.  I can move this function into coresight-core.c file.

> >   {
> > -	struct clk *pclk = NULL;
> > +	WARN_ON(!pclk);
> >   	if (!dev_is_amba(dev)) {
> > -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -		if (IS_ERR(pclk))
> > -			pclk = devm_clk_get_enabled(dev, "apb");
> > +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(*pclk))
> > +			*pclk = devm_clk_get_enabled(dev, "apb");
> > +		if (IS_ERR(*pclk))
> > +			return PTR_ERR(*pclk);
> > +	} else {
> > +		/* Don't enable pclk for an AMBA device */
> > +		*pclk = NULL;
> 
> Now the "apb" clock won't be enabled for amba devices. I'm assuming that's
> fine if the clock was always called "apb_pclk" for them, but the commit that
> added the new clock name didn't specify any special casing either.

> Can we have a comment that says it's deliberate? But the more I think about
> it the more I'm confused why CTCU needed a different clock name to be
> defined, when all the other Coresight devices use "apb_pclk".

Yes, seems to me, "apb" clock is the same thing with "apb_pclk".  As
CTCU DT binding has been merged, for backward compatible, we cannot
remove it now.

CTCU driver only supports static probe, it is never probed by AMBA bus
driver.  I think this is another reason that "apb_pclk" is not used in
CTCU driver.  I can add a comment like:

  "apb_pclk" is the default clock name used by the AMBA bus driver,
  while "apb" is used only by the CTCU driver.  A CoreSight driver
  should use "apb_pclk" as its programming clock name.

Thanks,
Leo

> >   	}
> > -	return pclk;
> > +	if (atclk) {
> > +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +		if (IS_ERR(*atclk))
> > +			return PTR_ERR(*atclk);
> > +	}
> > +
> > +	return 0;
> >   }
> >   #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
