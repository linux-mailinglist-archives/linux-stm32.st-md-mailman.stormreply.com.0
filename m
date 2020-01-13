Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F7139C11
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 23:02:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04BC1C36B0D;
	Mon, 13 Jan 2020 22:02:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C6EDC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 22:02:16 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D42022072B;
 Mon, 13 Jan 2020 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578952934;
 bh=OgKDay9p8f2ObZyGcicQ+gy/7tCHu46EYwzbBIFy4Bw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pHT5bBh0iez8IKcr+GlyuKn5q/SAP7pNTjWGjKMvkbXrd1UI/wSmspGEACN7yYH+I
 /1/yBtWWtpU2t/cc18f2m4bbAs+Isbe3BZKwPYV8SnxhrkdWXoRJX+Oftin0kAmLtO
 +Wkfw8ev1pXrvi9Or7YvB4Zb1BizyIiaKPqXo3EY=
Date: Mon, 13 Jan 2020 22:02:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier MOYSAN <olivier.moysan@st.com>
Message-ID: <20200113220208.6471ba42@archlinux>
In-Reply-To: <9b7e2161-1a31-8d69-52f9-ae9dedc902e3@st.com>
References: <20191127131008.18896-1-olivier.moysan@st.com>
 <9b7e2161-1a31-8d69-52f9-ae9dedc902e3@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "lars@metafoo.de" <lars@metafoo.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>, Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: adapt sampling
 rate to oversampling ratio
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

On Fri, 10 Jan 2020 10:06:13 +0000
Olivier MOYSAN <olivier.moysan@st.com> wrote:

> Hi Jonathan, all,
> 
> Kind reminder on this patch.
Thanks!

Applied to the togreg branch of iio.git and pushed out of testing
to give the build bots a brief period to poke at it.

Sorry again for the delay

Thanks,

Jonathan


> Regards
> Olivier
> 
> On 11/27/19 2:10 PM, Olivier Moysan wrote:
> > Update sampling rate when oversampling ratio is changed
> > through the IIO ABI.
> >
> > Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> > ---
> > changes in version 2:
> > - correct title
> > ---
> >   drivers/iio/adc/stm32-dfsdm-adc.c | 32 ++++++++++++++++++-------------
> >   1 file changed, 19 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > index 0339ecdd06bd..87a842507509 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -1221,14 +1221,32 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
> >   	unsigned int spi_freq;
> >   	int ret = -EINVAL;
> >   
> > +	switch (ch->src) {
> > +	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL:
> > +		spi_freq = adc->dfsdm->spi_master_freq;
> > +		break;
> > +	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_FALLING:
> > +	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_RISING:
> > +		spi_freq = adc->dfsdm->spi_master_freq / 2;
> > +		break;
> > +	default:
> > +		spi_freq = adc->spi_freq;
> > +	}
> > +
> >   	switch (mask) {
> >   	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> >   		ret = iio_device_claim_direct_mode(indio_dev);
> >   		if (ret)
> >   			return ret;
> > +
> >   		ret = stm32_dfsdm_compute_all_osrs(indio_dev, val);
> > -		if (!ret)
> > +		if (!ret) {
> > +			dev_dbg(&indio_dev->dev,
> > +				"Sampling rate changed from (%u) to (%u)\n",
> > +				adc->sample_freq, spi_freq / val);
> >   			adc->oversamp = val;
> > +			adc->sample_freq = spi_freq / val;
> > +		}
> >   		iio_device_release_direct_mode(indio_dev);
> >   		return ret;
> >   
> > @@ -1240,18 +1258,6 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
> >   		if (ret)
> >   			return ret;
> >   
> > -		switch (ch->src) {
> > -		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL:
> > -			spi_freq = adc->dfsdm->spi_master_freq;
> > -			break;
> > -		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_FALLING:
> > -		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_RISING:
> > -			spi_freq = adc->dfsdm->spi_master_freq / 2;
> > -			break;
> > -		default:
> > -			spi_freq = adc->spi_freq;
> > -		}
> > -
> >   		ret = dfsdm_adc_set_samp_freq(indio_dev, val, spi_freq);
> >   		iio_device_release_direct_mode(indio_dev);
> >   		return ret;  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
