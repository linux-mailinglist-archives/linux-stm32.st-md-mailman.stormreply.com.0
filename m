Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C552AABEE
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 16:32:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BF7DC3FAE2;
	Sun,  8 Nov 2020 15:32:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C72C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 15:32:12 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B492206E0;
 Sun,  8 Nov 2020 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604849530;
 bh=hzzEOE8KcptRT00HXVKeMWjrWy6JY/zrHz1aMOEGi3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jHVr2WECv/0IdgCFKzHdh5muE4w7tm8d8q1IPaWS+X4OAPlhyEAGFJkde8FiIeMw7
 PpLE+x4nTEoWiBHYrMyZbYkyj+892C4WspqY480pRssqTNn6VxETb3aNBjmBqb9JCm
 CyifnZdf8bO4i/KdGGqVDbXVEQYXf0HwiODXa1SQ=
Date: Sun, 8 Nov 2020 15:32:05 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20201108153205.7aa4fa28@archlinux>
In-Reply-To: <8ed73130-57e7-4073-cdf2-5f31596e728c@st.com>
References: <20201105142941.27301-1-olivier.moysan@st.com>
 <8ed73130-57e7-4073-cdf2-5f31596e728c@st.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: dma transfers cleanup
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

On Thu, 5 Nov 2020 18:38:27 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 11/5/20 3:29 PM, Olivier Moysan wrote:
> > - Remove processing related to DMA in irq handler as this
> > data transfer is managed directly in DMA callback.
> > - Update comment in stm32_adc_set_watermark() function.
> > 
> > Signed-off-by: Olivier Moysan <olivier.moysan@st.com>  
> 
> Hi Olivier,
> 
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to poke at it.

Thanks,

Jonathan

> 
> Thanks,
> Fabrice
> > ---
> >  drivers/iio/adc/stm32-adc.c | 29 ++++++-----------------------
> >  1 file changed, 6 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index b3f31f147347..08be826f1462 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -1310,7 +1310,7 @@ static int stm32_adc_set_watermark(struct iio_dev *indio_dev, unsigned int val)
> >  	 * dma cyclic transfers are used, buffer is split into two periods.
> >  	 * There should be :
> >  	 * - always one buffer (period) dma is working on
> > -	 * - one buffer (period) driver can push with iio_trigger_poll().
> > +	 * - one buffer (period) driver can push data.
> >  	 */
> >  	watermark = min(watermark, val * (unsigned)(sizeof(u16)));
> >  	adc->rx_buf_sz = min(rx_buf_sz, watermark * 2 * adc->num_conv);
> > @@ -1573,31 +1573,14 @@ static irqreturn_t stm32_adc_trigger_handler(int irq, void *p)
> >  
> >  	dev_dbg(&indio_dev->dev, "%s bufi=%d\n", __func__, adc->bufi);
> >  
> > -	if (!adc->dma_chan) {
> > -		/* reset buffer index */
> > -		adc->bufi = 0;
> > -		iio_push_to_buffers_with_timestamp(indio_dev, adc->buffer,
> > -						   pf->timestamp);
> > -	} else {
> > -		int residue = stm32_adc_dma_residue(adc);
> > -
> > -		while (residue >= indio_dev->scan_bytes) {
> > -			u16 *buffer = (u16 *)&adc->rx_buf[adc->bufi];
> > -
> > -			iio_push_to_buffers_with_timestamp(indio_dev, buffer,
> > -							   pf->timestamp);
> > -			residue -= indio_dev->scan_bytes;
> > -			adc->bufi += indio_dev->scan_bytes;
> > -			if (adc->bufi >= adc->rx_buf_sz)
> > -				adc->bufi = 0;
> > -		}
> > -	}
> > -
> > +	/* reset buffer index */
> > +	adc->bufi = 0;
> > +	iio_push_to_buffers_with_timestamp(indio_dev, adc->buffer,
> > +					   pf->timestamp);
> >  	iio_trigger_notify_done(indio_dev->trig);
> >  
> >  	/* re-enable eoc irq */
> > -	if (!adc->dma_chan)
> > -		stm32_adc_conv_irq_enable(adc);
> > +	stm32_adc_conv_irq_enable(adc);
> >  
> >  	return IRQ_HANDLED;
> >  }
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
