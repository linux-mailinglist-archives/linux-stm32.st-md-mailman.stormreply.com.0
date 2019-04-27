Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF8B389
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2019 15:10:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA4ABC35E0B
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2019 13:10:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 285E0C35E0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 13:10:27 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B332B2146E;
 Sat, 27 Apr 2019 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556370625;
 bh=I/ov1ipXmDgyoqQOOE8Pk2e0WRg6v9my9N08LLlUspw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eqHrhqGcBidnV6RnOoR7ql0WlGs9ij1yHdOzqhNIgCr2hhKcYJgrpgJ7Grz87fR9t
 iekpGVg+xHBgbCmoqBtR1LGlyqeqlYJZG9GUNTQr101u8a2xYDFvTcSDUOhiwCe1sg
 iYFVxvN8bIIgZBAKasDFkBkcLruRrbX96XpvJjmo=
Date: Sat, 27 Apr 2019 14:10:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190427141019.1a526679@archlinux>
In-Reply-To: <b46f9525-53c0-d874-c88f-c6e351736b04@st.com>
References: <1556110286-1526-1-git-send-email-fabien.dessenne@st.com>
 <1556110286-1526-3-git-send-email-fabien.dessenne@st.com>
 <b46f9525-53c0-d874-c88f-c6e351736b04@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] iio: adc: stm32-dfsdm: missing error
 case during probe
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

On Wed, 24 Apr 2019 14:55:28 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 4/24/19 2:51 PM, Fabien Dessenne wrote:
> > During probe, check the devm_ioremap_resource() error value.
> > Also return the devm_clk_get() error value instead of -EINVAL.
> > 
> > Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> > ---  
> 
> 
> Hi Fabien,
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> 
> Thanks,
> Fabrice
> 
> >  drivers/iio/adc/stm32-dfsdm-core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> > index 0a4d374..26e2011 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-core.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> > @@ -233,6 +233,8 @@ static int stm32_dfsdm_parse_of(struct platform_device *pdev,
> >  	}
> >  	priv->dfsdm.phys_base = res->start;
> >  	priv->dfsdm.base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(priv->dfsdm.base))
> > +		return PTR_ERR(priv->dfsdm.base);
> >  
> >  	/*
> >  	 * "dfsdm" clock is mandatory for DFSDM peripheral clocking.
> > @@ -242,8 +244,10 @@ static int stm32_dfsdm_parse_of(struct platform_device *pdev,
> >  	 */
> >  	priv->clk = devm_clk_get(&pdev->dev, "dfsdm");
> >  	if (IS_ERR(priv->clk)) {
> > -		dev_err(&pdev->dev, "No stm32_dfsdm_clk clock found\n");
> > -		return -EINVAL;
> > +		ret = PTR_ERR(priv->clk);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "Failed to get clock (%d)\n", ret);
> > +		return ret;
> >  	}
> >  
> >  	priv->aclk = devm_clk_get(&pdev->dev, "audio");
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
