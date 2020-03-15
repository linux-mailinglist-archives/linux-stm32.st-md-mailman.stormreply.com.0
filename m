Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74B185B8D
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2020 10:35:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7AECC36B0C;
	Sun, 15 Mar 2020 09:35:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F5FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 09:35:55 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52A38206BE;
 Sun, 15 Mar 2020 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584264954;
 bh=bydZt1msrAZyMXtqxKfMHkV2PUIlKeyA7eIC50CIB/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TBHxriSWt3P/WyyWLaDJyymqjhCzixdbSC6Kom2zz+dKvOk44zqBI4xFqNgxzw0Wy
 Ec1OcZMiugGyij6LFyACRIo89VS8P5sckaeq5a0n/cowSIEVh/iA3WeJIKg6KgFvoH
 Qv81sHhcA288CvhJUJKfSFmqxzysIMSHEP4Ff1Yg=
Date: Sun, 15 Mar 2020 09:35:49 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200315093549.20764470@archlinux>
In-Reply-To: <288fb604-16c6-da52-533f-7f1440ed9daa@st.com>
References: <20200309100212.16499-1-olivier.moysan@st.com>
 <288fb604-16c6-da52-533f-7f1440ed9daa@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: fix sleep in
	atomic context
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

On Mon, 9 Mar 2020 11:39:17 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 3/9/20 11:02 AM, Olivier Moysan wrote:
> > This commit fixes the following error:
> > "BUG: sleeping function called from invalid context at kernel/irq/chip.c"
> > 
> > In DMA mode suppress the trigger irq handler, and make the buffer
> > transfers directly in DMA callback, instead.
> > 
> > Fixes: 2763ea0585c9 ("iio: adc: stm32: add optional dma support")
> > 
> > Signed-off-by: Olivier Moysan <olivier.moysan@st.com>  
> 
> Hi Olivier,
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Thanks.  Queued up locally but not pushed out just yet as I have a pull
request out to Greg.  Also marked for stable.

thanks,

Jonathan

> 
> Thanks,
> Fabrice
> 
> > ---
> > Changes in v2:
> > - Add "Fixes" tag in commit message
> > 
> > This solution has been already discussed in the thread
> > https://lkml.org/lkml/2019/3/30/171, and applied in STM32 DFSDM driver:
> > e19ac9d9a978 ("iio: adc: stm32-dfsdm: fix sleep in atomic context")
> > ---
> >  drivers/iio/adc/stm32-adc.c | 31 ++++++++++++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index 80c3f963527b..ae622ee6d08c 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -1418,8 +1418,30 @@ static unsigned int stm32_adc_dma_residue(struct stm32_adc *adc)
> >  static void stm32_adc_dma_buffer_done(void *data)
> >  {
> >  	struct iio_dev *indio_dev = data;
> > +	struct stm32_adc *adc = iio_priv(indio_dev);
> > +	int residue = stm32_adc_dma_residue(adc);
> > +
> > +	/*
> > +	 * In DMA mode the trigger services of IIO are not used
> > +	 * (e.g. no call to iio_trigger_poll).
> > +	 * Calling irq handler associated to the hardware trigger is not
> > +	 * relevant as the conversions have already been done. Data
> > +	 * transfers are performed directly in DMA callback instead.
> > +	 * This implementation avoids to call trigger irq handler that
> > +	 * may sleep, in an atomic context (DMA irq handler context).
> > +	 */
> > +	dev_dbg(&indio_dev->dev, "%s bufi=%d\n", __func__, adc->bufi);
> >  
> > -	iio_trigger_poll_chained(indio_dev->trig);
> > +	while (residue >= indio_dev->scan_bytes) {
> > +		u16 *buffer = (u16 *)&adc->rx_buf[adc->bufi];
> > +
> > +		iio_push_to_buffers(indio_dev, buffer);
> > +
> > +		residue -= indio_dev->scan_bytes;
> > +		adc->bufi += indio_dev->scan_bytes;
> > +		if (adc->bufi >= adc->rx_buf_sz)
> > +			adc->bufi = 0;
> > +	}
> >  }
> >  
> >  static int stm32_adc_dma_start(struct iio_dev *indio_dev)
> > @@ -1845,6 +1867,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
> >  {
> >  	struct iio_dev *indio_dev;
> >  	struct device *dev = &pdev->dev;
> > +	irqreturn_t (*handler)(int irq, void *p) = NULL;
> >  	struct stm32_adc *adc;
> >  	int ret;
> >  
> > @@ -1911,9 +1934,11 @@ static int stm32_adc_probe(struct platform_device *pdev)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	if (!adc->dma_chan)
> > +		handler = &stm32_adc_trigger_handler;
> > +
> >  	ret = iio_triggered_buffer_setup(indio_dev,
> > -					 &iio_pollfunc_store_time,
> > -					 &stm32_adc_trigger_handler,
> > +					 &iio_pollfunc_store_time, handler,
> >  					 &stm32_adc_buffer_setup_ops);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "buffer setup failed\n");
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
