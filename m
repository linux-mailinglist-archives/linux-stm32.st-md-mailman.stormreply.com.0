Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 013BDA96908
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 14:24:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0764C78F63;
	Tue, 22 Apr 2025 12:24:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9B6DC78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 12:24:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91281152B;
 Tue, 22 Apr 2025 05:24:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 747503F66E;
 Tue, 22 Apr 2025 05:24:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:24:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20250422122414.GE28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-6-leo.yan@arm.com>
 <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 5/9] coresight: Avoid enable
 programming clock duplicately
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

On Thu, Apr 03, 2025 at 12:18:56PM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:07, Leo Yan wrote:
> > The programming clock is enabled by AMBA bus driver before a dynamic
> > probe.  As a result, a CoreSight driver may redundantly enable the same
> > clock.
> > 
> > To avoid this, add a check for device type and skip enabling the
> > programming clock for AMBA devices.  The returned NULL pointer will be
> > tolerated by the drivers.
> > 
> > Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  include/linux/coresight.h | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index b888f6ed59b2..26eb4a61b992 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
> >   * Returns:
> >   *
> >   * clk   - Clock is found and enabled
> > + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> >   * ERROR - Clock is found but failed to enable
> >   */
> >  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >  {
> > -	struct clk *pclk;
> > +	struct clk *pclk = NULL;
> >  
> > -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -	if (IS_ERR(pclk))
> > -		pclk = devm_clk_get_enabled(dev, "apb");
> > +	if (!dev_is_amba(dev)) {
> > +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(pclk))
> > +			pclk = devm_clk_get_enabled(dev, "apb");
> > +	}
> >  
> >  	return pclk;
> >  }
> 
> coresight_get_enable_apb_pclk() mostly gets called in the platform driver
> probe paths but they are also present in some AMBA probe paths. Hence why
> cannot the callers in AMBA probe paths get fixed instead ?

With this approach, clocking operations are different in static probe
and dynamic probe.  This causes complexity for CoreSight drivers.

After consideration, we decided to use a central place for clock
initialization.  Patch 09 follows the idea to encapsulate pclk and atclk
operations in the coresight_get_enable_clocks() function.

> Besides return
> value never gets checked for NULL, which would have to be changed as well
> if coresight_get_enable_apb_pclk() starts returning NULL values for AMBA
> devices.
> 
> 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> 	if (IS_ERR(drvdata->pclk))
> 		return -ENODEV;

I confirmed CoreSight drivers have used this condition, so it is safe
to return NULL pointer from coresight_get_enable_apb_pclk().

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
