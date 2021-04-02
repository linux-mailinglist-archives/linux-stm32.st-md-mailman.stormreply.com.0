Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D7A352925
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Apr 2021 11:53:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1FF6C58D62;
	Fri,  2 Apr 2021 09:53:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D31BEC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Apr 2021 09:53:30 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA7C460FE6;
 Fri,  2 Apr 2021 09:53:25 +0000 (UTC)
Date: Fri, 2 Apr 2021 10:53:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20210402105335.1bfbaf2e@jic23-huawei>
In-Reply-To: <CAHp75VfkCQpfUrVcWHUnD4DLMp9iZJBL8mYfsYOCsESm_y068A@mail.gmail.com>
References: <20210401154343.41527-1-dmugil2000@gmail.com>
 <CAHp75VfkCQpfUrVcWHUnD4DLMp9iZJBL8mYfsYOCsESm_y068A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mugilraj Dhavachelvan <dmugil2000@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: drop __func__
 while using Dynamic debug
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

On Thu, 1 Apr 2021 21:05:58 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Apr 1, 2021 at 8:48 PM Mugilraj Dhavachelvan
> <dmugil2000@gmail.com> wrote:
> >
> > dropped __func__ while using dev_dbg() and pr_debug()  
> 
> The commit message may be amended, from code perspective LGTM!
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I added a note to the commit message to observe that the function
name printing can be configured using dynamic debug.

Applied to the togreg branch of iio.git and pushed out as testing
to let the autobuilder bots like 0-day check if they can find any
problems that we've missed.

Thanks,

Jonathan

> 
> > Signed-off-by: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
> > ---
> >  drivers/iio/adc/stm32-dfsdm-adc.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > index 76a60d93fe23..95ec5f3c3126 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -198,7 +198,7 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
> >         unsigned int p = fl->ford;      /* filter order (ford) */
> >         struct stm32_dfsdm_filter_osr *flo = &fl->flo[fast];
> >
> > -       pr_debug("%s: Requested oversampling: %d\n",  __func__, oversamp);
> > +       pr_debug("Requested oversampling: %d\n", oversamp);
> >         /*
> >          * This function tries to compute filter oversampling and integrator
> >          * oversampling, base on oversampling ratio requested by user.
> > @@ -294,8 +294,8 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
> >                                 }
> >                                 flo->max = (s32)max;
> >
> > -                               pr_debug("%s: fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
> > -                                        __func__, fast, flo->fosr, flo->iosr,
> > +                               pr_debug("fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
> > +                                        fast, flo->fosr, flo->iosr,
> >                                          flo->res, bits, flo->rshift,
> >                                          flo->lshift);
> >                         }
> > @@ -858,7 +858,7 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
> >          * support in IIO.
> >          */
> >
> > -       dev_dbg(&indio_dev->dev, "%s: pos = %d, available = %d\n", __func__,
> > +       dev_dbg(&indio_dev->dev, "pos = %d, available = %d\n",
> >                 adc->bufi, available);
> >         old_pos = adc->bufi;
> >
> > @@ -912,7 +912,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev *indio_dev)
> >         if (!adc->dma_chan)
> >                 return -EINVAL;
> >
> > -       dev_dbg(&indio_dev->dev, "%s size=%d watermark=%d\n", __func__,
> > +       dev_dbg(&indio_dev->dev, "size=%d watermark=%d\n",
> >                 adc->buf_sz, adc->buf_sz / 2);
> >
> >         if (adc->nconv == 1 && !indio_dev->trig)
> > --
> > 2.25.1
> >  
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
