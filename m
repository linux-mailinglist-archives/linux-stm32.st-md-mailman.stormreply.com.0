Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8EF5F24
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2019 13:38:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F43C36B0B;
	Sat,  9 Nov 2019 12:38:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAC99C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2019 12:38:09 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06D64207FF;
 Sat,  9 Nov 2019 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573303088;
 bh=XVnSugf5yeS7ju3H3HrhT5xXtiTNx1q/s0jgoUAsGv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tFShlZ+MHSIVtUdT/SQsfFhOLvjUaLYC7RK2W+lkTkUSFHnZKDgN5BkhXbb4zm/vC
 KlWym7bieROGF/+wAlY0jO6KGCaLezuUph1781ZrIq2YCngy2YHPAcDwFNCXLiyHYq
 GuwZKBAM3s9CwEVBj/yeAmqpx4P9gr8C0O/VW7FU=
Date: Sat, 9 Nov 2019 12:38:03 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191109123803.3c002877@archlinux>
In-Reply-To: <20191103123042.54c82559@archlinux>
References: <1572279108-25916-1-git-send-email-fabrice.gasnier@st.com>
 <1572279108-25916-3-git-send-email-fabrice.gasnier@st.com>
 <20191103123042.54c82559@archlinux>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] iio: adc: stm32: allow to tune analog
	clock
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

On Sun, 3 Nov 2019 12:30:42 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 28 Oct 2019 17:11:48 +0100
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> 
> > Add new optional dt property to tune analog clock prescaler.
> > Driver looks for optional "st,max-clk-rate-hz", then computes
> > best approximation below that rate, using ADC internal prescaler.
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>  
> If the previous email I wrote on this got to anyone before I hit
> cancel, please ignore. Had completely failed to read the code correctly.
> 
> Anyhow this seems fine to me, but given there are a lot of existing
> clk related bindings I'd like to give a little longer for Rob to
> have a chance to take a look at the binding.
> 
> Give me a poke if I seem to have lost this in a week or so.

Applied to the togreg branch of iio.git. Shortly to be pushed out
as testing for the autobuilders to poke at it.

Thanks,

Jonathan

> 
> Thanks,
> 
> Jonathan
> 
> 
> 
> > ---
> >  drivers/iio/adc/stm32-adc-core.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > index 20c626c..6537f4f 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -79,6 +79,7 @@ struct stm32_adc_priv_cfg {
> >   * @domain:		irq domain reference
> >   * @aclk:		clock reference for the analog circuitry
> >   * @bclk:		bus clock common for all ADCs, depends on part used
> > + * @max_clk_rate:	desired maximum clock rate
> >   * @booster:		booster supply reference
> >   * @vdd:		vdd supply reference
> >   * @vdda:		vdda analog supply reference
> > @@ -95,6 +96,7 @@ struct stm32_adc_priv {
> >  	struct irq_domain		*domain;
> >  	struct clk			*aclk;
> >  	struct clk			*bclk;
> > +	u32				max_clk_rate;
> >  	struct regulator		*booster;
> >  	struct regulator		*vdd;
> >  	struct regulator		*vdda;
> > @@ -141,7 +143,7 @@ static int stm32f4_adc_clk_sel(struct platform_device *pdev,
> >  	}
> >  
> >  	for (i = 0; i < ARRAY_SIZE(stm32f4_pclk_div); i++) {
> > -		if ((rate / stm32f4_pclk_div[i]) <= priv->cfg->max_clk_rate_hz)
> > +		if ((rate / stm32f4_pclk_div[i]) <= priv->max_clk_rate)
> >  			break;
> >  	}
> >  	if (i >= ARRAY_SIZE(stm32f4_pclk_div)) {
> > @@ -230,7 +232,7 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
> >  			if (ckmode)
> >  				continue;
> >  
> > -			if ((rate / div) <= priv->cfg->max_clk_rate_hz)
> > +			if ((rate / div) <= priv->max_clk_rate)
> >  				goto out;
> >  		}
> >  	}
> > @@ -250,7 +252,7 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
> >  		if (!ckmode)
> >  			continue;
> >  
> > -		if ((rate / div) <= priv->cfg->max_clk_rate_hz)
> > +		if ((rate / div) <= priv->max_clk_rate)
> >  			goto out;
> >  	}
> >  
> > @@ -655,6 +657,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *np = pdev->dev.of_node;
> >  	struct resource *res;
> > +	u32 max_rate;
> >  	int ret;
> >  
> >  	if (!pdev->dev.of_node)
> > @@ -731,6 +734,13 @@ static int stm32_adc_probe(struct platform_device *pdev)
> >  	priv->common.vref_mv = ret / 1000;
> >  	dev_dbg(&pdev->dev, "vref+=%dmV\n", priv->common.vref_mv);
> >  
> > +	ret = of_property_read_u32(pdev->dev.of_node, "st,max-clk-rate-hz",
> > +				   &max_rate);
> > +	if (!ret)
> > +		priv->max_clk_rate = min(max_rate, priv->cfg->max_clk_rate_hz);
> > +	else
> > +		priv->max_clk_rate = priv->cfg->max_clk_rate_hz;
> > +
> >  	ret = priv->cfg->clk_sel(pdev, priv);
> >  	if (ret < 0)
> >  		goto err_hw_stop;  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
