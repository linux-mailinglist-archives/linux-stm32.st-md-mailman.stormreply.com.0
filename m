Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 566DD202538
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jun 2020 18:27:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F00A1C36B0C;
	Sat, 20 Jun 2020 16:27:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A33C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 16:27:07 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B923E23B29;
 Sat, 20 Jun 2020 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592670426;
 bh=TTAjRUuYaQyybBSVFHKE0cyjidHxSqeHgWWYL+fAAs8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mvRc/XkrIVY+ZZAhayv5kA72UCGWJBuJMRQ/khTeRc/7pM9I7ifQ7X8jqqKLJZHOb
 EbodUMIW8Pu+XBqJtMeuD2A1ARtMhkeoTeblIflrfuWVMLP1YlLaJcz/VAtxtwAjGa
 0RvMSqp3qtOqo/BeLIMeWXFemno9ogLR2aGVfYI8=
Date: Sat, 20 Jun 2020 17:27:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Message-ID: <20200620172701.223b85cc@archlinux>
In-Reply-To: <eb26c2b2aa2e1fbadc80bcf27551160c05eaa050.camel@analog.com>
References: <20200522130804.631508-1-alexandru.ardelean@analog.com>
 <20200525082648.39656-1-alexandru.ardelean@analog.com>
 <20200531154535.4e7490e0@archlinux>
 <eb26c2b2aa2e1fbadc80bcf27551160c05eaa050.camel@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: stm32-dfsdm-adc: remove usage of
 iio_priv_to_dev() helper
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

On Fri, 19 Jun 2020 08:00:36 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Sun, 2020-05-31 at 15:45 +0100, Jonathan Cameron wrote:
> > [External]
> > 
> > On Mon, 25 May 2020 11:26:48 +0300
> > Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:
> >   
> > > We may want to get rid of the iio_priv_to_dev() helper. The reason is
> > > that
> > > we will hide some of the members of the iio_dev structure (to prevent
> > > drivers from accessing them directly), and that will also mean hiding
> > > the
> > > implementation of the iio_priv_to_dev() helper inside the IIO core.
> > > 
> > > Hiding the implementation of iio_priv_to_dev() implies that some fast-
> > > paths
> > > may not be fast anymore, so a general idea is to try to get rid of the
> > > iio_priv_to_dev() altogether.
> > > The iio_priv() helper won't be affected by the rework, as the iio_dev
> > > struct will keep a reference to the private information.
> > > 
> > > For this driver, not using iio_priv_to_dev(), means reworking some
> > > paths to
> > > pass the iio device and using iio_priv() to access the private
> > > information.
> > > 
> > > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>  
> > Looks great.  Will let it sit a little longer on list for others to
> > review
> > though.
> >   
> 
> ping on this :)
Thanks

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Jonathan

> 
> > Thanks,
> > 
> > Jonathan
> >   
> > > ---
> > > 
> > > Changelog v1 -> v2:
> > > * changed some paths to pass a reference to ref to iio device and
> > > access
> > >   private state-struct via iio_priv()
> > > 
> > >  drivers/iio/adc/stm32-dfsdm-adc.c | 65 ++++++++++++++++---------------
> > >  1 file changed, 33 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-
> > > dfsdm-adc.c
> > > index 76a60d93fe23..03dfc0b6ba98 100644
> > > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > > @@ -330,9 +330,9 @@ static int stm32_dfsdm_compute_all_osrs(struct
> > > iio_dev *indio_dev,
> > >  	return 0;
> > >  }
> > >  
> > > -static int stm32_dfsdm_start_channel(struct stm32_dfsdm_adc *adc)
> > > +static int stm32_dfsdm_start_channel(struct iio_dev *indio_dev)
> > >  {
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	const struct iio_chan_spec *chan;
> > >  	unsigned int bit;
> > > @@ -350,9 +350,9 @@ static int stm32_dfsdm_start_channel(struct
> > > stm32_dfsdm_adc *adc)
> > >  	return 0;
> > >  }
> > >  
> > > -static void stm32_dfsdm_stop_channel(struct stm32_dfsdm_adc *adc)
> > > +static void stm32_dfsdm_stop_channel(struct iio_dev *indio_dev)
> > >  {
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	const struct iio_chan_spec *chan;
> > >  	unsigned int bit;
> > > @@ -418,11 +418,11 @@ static void stm32_dfsdm_stop_filter(struct
> > > stm32_dfsdm *dfsdm,
> > >  			   DFSDM_CR1_DFEN_MASK, DFSDM_CR1_DFEN(0));
> > >  }
> > >  
> > > -static int stm32_dfsdm_filter_set_trig(struct stm32_dfsdm_adc *adc,
> > > +static int stm32_dfsdm_filter_set_trig(struct iio_dev *indio_dev,
> > >  				       unsigned int fl_id,
> > >  				       struct iio_trigger *trig)
> > >  {
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	u32 jextsel = 0, jexten = STM32_DFSDM_JEXTEN_DISABLED;
> > >  	int ret;
> > > @@ -447,11 +447,11 @@ static int stm32_dfsdm_filter_set_trig(struct
> > > stm32_dfsdm_adc *adc,
> > >  	return 0;
> > >  }
> > >  
> > > -static int stm32_dfsdm_channels_configure(struct stm32_dfsdm_adc *adc,
> > > +static int stm32_dfsdm_channels_configure(struct iio_dev *indio_dev,
> > >  					  unsigned int fl_id,
> > >  					  struct iio_trigger *trig)
> > >  {
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[fl_id];
> > >  	struct stm32_dfsdm_filter_osr *flo = &fl->flo[0];
> > > @@ -491,11 +491,11 @@ static int stm32_dfsdm_channels_configure(struct
> > > stm32_dfsdm_adc *adc,
> > >  	return 0;
> > >  }
> > >  
> > > -static int stm32_dfsdm_filter_configure(struct stm32_dfsdm_adc *adc,
> > > +static int stm32_dfsdm_filter_configure(struct iio_dev *indio_dev,
> > >  					unsigned int fl_id,
> > >  					struct iio_trigger *trig)
> > >  {
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[fl_id];
> > >  	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fl->fast];
> > > @@ -521,7 +521,7 @@ static int stm32_dfsdm_filter_configure(struct
> > > stm32_dfsdm_adc *adc,
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	ret = stm32_dfsdm_filter_set_trig(adc, fl_id, trig);
> > > +	ret = stm32_dfsdm_filter_set_trig(indio_dev, fl_id, trig);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > @@ -729,21 +729,22 @@ static ssize_t dfsdm_adc_audio_set_spiclk(struct
> > > iio_dev *indio_dev,
> > >  	return len;
> > >  }
> > >  
> > > -static int stm32_dfsdm_start_conv(struct stm32_dfsdm_adc *adc,
> > > +static int stm32_dfsdm_start_conv(struct iio_dev *indio_dev,
> > >  				  struct iio_trigger *trig)
> > >  {
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	int ret;
> > >  
> > > -	ret = stm32_dfsdm_channels_configure(adc, adc->fl_id, trig);
> > > +	ret = stm32_dfsdm_channels_configure(indio_dev, adc->fl_id, trig);
> > >  	if (ret < 0)
> > >  		return ret;
> > >  
> > > -	ret = stm32_dfsdm_start_channel(adc);
> > > +	ret = stm32_dfsdm_start_channel(indio_dev);
> > >  	if (ret < 0)
> > >  		return ret;
> > >  
> > > -	ret = stm32_dfsdm_filter_configure(adc, adc->fl_id, trig);
> > > +	ret = stm32_dfsdm_filter_configure(indio_dev, adc->fl_id, trig);
> > >  	if (ret < 0)
> > >  		goto stop_channels;
> > >  
> > > @@ -757,13 +758,14 @@ static int stm32_dfsdm_start_conv(struct
> > > stm32_dfsdm_adc *adc,
> > >  	regmap_update_bits(regmap, DFSDM_CR1(adc->fl_id),
> > >  			   DFSDM_CR1_CFG_MASK, 0);
> > >  stop_channels:
> > > -	stm32_dfsdm_stop_channel(adc);
> > > +	stm32_dfsdm_stop_channel(indio_dev);
> > >  
> > >  	return ret;
> > >  }
> > >  
> > > -static void stm32_dfsdm_stop_conv(struct stm32_dfsdm_adc *adc)
> > > +static void stm32_dfsdm_stop_conv(struct iio_dev *indio_dev)
> > >  {
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  
> > >  	stm32_dfsdm_stop_filter(adc->dfsdm, adc->fl_id);
> > > @@ -771,7 +773,7 @@ static void stm32_dfsdm_stop_conv(struct
> > > stm32_dfsdm_adc *adc)
> > >  	regmap_update_bits(regmap, DFSDM_CR1(adc->fl_id),
> > >  			   DFSDM_CR1_CFG_MASK, 0);
> > >  
> > > -	stm32_dfsdm_stop_channel(adc);
> > > +	stm32_dfsdm_stop_channel(indio_dev);
> > >  }
> > >  
> > >  static int stm32_dfsdm_set_watermark(struct iio_dev *indio_dev,
> > > @@ -1017,7 +1019,7 @@ static int __stm32_dfsdm_postenable(struct
> > > iio_dev *indio_dev)
> > >  		goto stop_dfsdm;
> > >  	}
> > >  
> > > -	ret = stm32_dfsdm_start_conv(adc, indio_dev->trig);
> > > +	ret = stm32_dfsdm_start_conv(indio_dev, indio_dev->trig);
> > >  	if (ret) {
> > >  		dev_err(&indio_dev->dev, "Can't start conversion\n");
> > >  		goto err_stop_dma;
> > > @@ -1063,7 +1065,7 @@ static void __stm32_dfsdm_predisable(struct
> > > iio_dev *indio_dev)
> > >  {
> > >  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  
> > > -	stm32_dfsdm_stop_conv(adc);
> > > +	stm32_dfsdm_stop_conv(indio_dev);
> > >  
> > >  	stm32_dfsdm_adc_dma_stop(indio_dev);
> > >  
> > > @@ -1159,7 +1161,7 @@ static int stm32_dfsdm_single_conv(struct iio_dev
> > > *indio_dev,
> > >  
> > >  	adc->nconv = 1;
> > >  	adc->smask = BIT(chan->scan_index);
> > > -	ret = stm32_dfsdm_start_conv(adc, NULL);
> > > +	ret = stm32_dfsdm_start_conv(indio_dev, NULL);
> > >  	if (ret < 0) {
> > >  		regmap_update_bits(adc->dfsdm->regmap, DFSDM_CR2(adc-  
> > > >fl_id),  
> > >  				   DFSDM_CR2_REOCIE_MASK,
> > > DFSDM_CR2_REOCIE(0));
> > > @@ -1180,7 +1182,7 @@ static int stm32_dfsdm_single_conv(struct iio_dev
> > > *indio_dev,
> > >  	else
> > >  		ret = IIO_VAL_INT;
> > >  
> > > -	stm32_dfsdm_stop_conv(adc);
> > > +	stm32_dfsdm_stop_conv(indio_dev);
> > >  
> > >  	stm32_dfsdm_process_data(adc, res);
> > >  
> > > @@ -1313,8 +1315,8 @@ static const struct iio_info stm32_dfsdm_info_adc
> > > = {
> > >  
> > >  static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
> > >  {
> > > -	struct stm32_dfsdm_adc *adc = arg;
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct iio_dev *indio_dev = arg;
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	struct regmap *regmap = adc->dfsdm->regmap;
> > >  	unsigned int status, int_en;
> > >  
> > > @@ -1574,7 +1576,7 @@ static int stm32_dfsdm_adc_probe(struct
> > > platform_device *pdev)
> > >  	iio->dev.of_node = np;
> > >  	iio->modes = INDIO_DIRECT_MODE;
> > >  
> > > -	platform_set_drvdata(pdev, adc);
> > > +	platform_set_drvdata(pdev, iio);
> > >  
> > >  	ret = of_property_read_u32(dev->of_node, "reg", &adc->fl_id);
> > >  	if (ret != 0 || adc->fl_id >= adc->dfsdm->num_fls) {
> > > @@ -1603,7 +1605,7 @@ static int stm32_dfsdm_adc_probe(struct
> > > platform_device *pdev)
> > >  		return irq;
> > >  
> > >  	ret = devm_request_irq(dev, irq, stm32_dfsdm_irq,
> > > -			       0, pdev->name, adc);
> > > +			       0, pdev->name, iio);
> > >  	if (ret < 0) {
> > >  		dev_err(dev, "Failed to request IRQ\n");
> > >  		return ret;
> > > @@ -1650,8 +1652,8 @@ static int stm32_dfsdm_adc_probe(struct
> > > platform_device *pdev)
> > >  
> > >  static int stm32_dfsdm_adc_remove(struct platform_device *pdev)
> > >  {
> > > -	struct stm32_dfsdm_adc *adc = platform_get_drvdata(pdev);
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  
> > >  	if (adc->dev_data->type == DFSDM_AUDIO)
> > >  		of_platform_depopulate(&pdev->dev);
> > > @@ -1663,8 +1665,7 @@ static int stm32_dfsdm_adc_remove(struct
> > > platform_device *pdev)
> > >  
> > >  static int __maybe_unused stm32_dfsdm_adc_suspend(struct device *dev)
> > >  {
> > > -	struct stm32_dfsdm_adc *adc = dev_get_drvdata(dev);
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > >  
> > >  	if (iio_buffer_enabled(indio_dev))
> > >  		__stm32_dfsdm_predisable(indio_dev);
> > > @@ -1674,8 +1675,8 @@ static int __maybe_unused
> > > stm32_dfsdm_adc_suspend(struct device *dev)
> > >  
> > >  static int __maybe_unused stm32_dfsdm_adc_resume(struct device *dev)
> > >  {
> > > -	struct stm32_dfsdm_adc *adc = dev_get_drvdata(dev);
> > > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >  	const struct iio_chan_spec *chan;
> > >  	struct stm32_dfsdm_channel *ch;
> > >  	int i, ret;  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
