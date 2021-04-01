Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF4351A67
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 20:06:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2403BC57B78;
	Thu,  1 Apr 2021 18:06:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FC39C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 18:06:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso1434446pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Apr 2021 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LtbHgeOb5Q/GLe2iHTvlk5L+iXICHogfcJ7TfbimPCs=;
 b=VrZzKx+uJE1Tg2egJrBWLu9gt7VPFt1vdgxVuXWVwFli0ZByDP+TLwtmNsK3rBfDjr
 X7hhAzyzRTpOvhmB/LeTdNIxX4XX/UGzFC/GMPKd2Eryww1KZ40M7qxQSEaOYEPSzprh
 nw/hLrU383xEpIKwm1BCBTTUunmbXPf8Tc8j/IeWclI9wMWW/Gdk3CRe9QDZmDs8rUjP
 +YebusOFF126ld9ZER5jzx5j/WDpY2fs9fZQTq4mZoc/gd+fS6ExHGSO40lmtnWjlEoj
 M7gUflHLs8oMkXRwy55JMpOT0s4+Hu2QgkbC/5nsdS/qCKwMoFWsMty9iSBGa0LPtJGy
 aLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LtbHgeOb5Q/GLe2iHTvlk5L+iXICHogfcJ7TfbimPCs=;
 b=c8QRxjIjALCqCMwGYTlPAP65iVJk5/WE5bSSEOaqN9b7tCXTpvX8ts6qrdv5b9ap8I
 6NjHIh25n6nAzuP7CaMO2zDI2qQEAWOFyETCSPBB8/i3E6cMbohKyfmP8WgAmrYpMPaG
 ceqdSM0J/Z5DFYreCCslUHa+c0kAfxrOJQ9GeihKBiSpD+YIQgiwyPe8ZZ7JQ/HrLmyT
 zrC78+EqIvOEkyJ6qK/AESCVirlA9ux9hI7Fe+n76/p1WFGlYvI0rDD0A2odkPPBIbQY
 d9WjkV4N4WZ5B5JRimdDisIhbRBlr4q/+eLA6f2SiGL6/f/gbJHKunxe8cyoBkx9Busu
 GeZQ==
X-Gm-Message-State: AOAM531zr1egJTZ7oaJOX1eLXtfKR+BS+Mtm7cE7nY33uAhO2HiwidVc
 exuFUf+kNL9I9sgjKgWUM6KzJjxm/r400mc6zdg=
X-Google-Smtp-Source: ABdhPJzsvLX9harUfAuK07k4egskm6yqn6pQylArKiWFguIMrjNLOlW5MORgdYPmir2kwL2JGK0erL1PRRJAwTzvGaw=
X-Received: by 2002:a17:90a:db49:: with SMTP id
 u9mr10351275pjx.181.1617300374919; 
 Thu, 01 Apr 2021 11:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210401154343.41527-1-dmugil2000@gmail.com>
In-Reply-To: <20210401154343.41527-1-dmugil2000@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Apr 2021 21:05:58 +0300
Message-ID: <CAHp75VfkCQpfUrVcWHUnD4DLMp9iZJBL8mYfsYOCsESm_y068A@mail.gmail.com>
To: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
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

On Thu, Apr 1, 2021 at 8:48 PM Mugilraj Dhavachelvan
<dmugil2000@gmail.com> wrote:
>
> dropped __func__ while using dev_dbg() and pr_debug()

The commit message may be amended, from code perspective LGTM!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 76a60d93fe23..95ec5f3c3126 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -198,7 +198,7 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
>         unsigned int p = fl->ford;      /* filter order (ford) */
>         struct stm32_dfsdm_filter_osr *flo = &fl->flo[fast];
>
> -       pr_debug("%s: Requested oversampling: %d\n",  __func__, oversamp);
> +       pr_debug("Requested oversampling: %d\n", oversamp);
>         /*
>          * This function tries to compute filter oversampling and integrator
>          * oversampling, base on oversampling ratio requested by user.
> @@ -294,8 +294,8 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
>                                 }
>                                 flo->max = (s32)max;
>
> -                               pr_debug("%s: fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
> -                                        __func__, fast, flo->fosr, flo->iosr,
> +                               pr_debug("fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
> +                                        fast, flo->fosr, flo->iosr,
>                                          flo->res, bits, flo->rshift,
>                                          flo->lshift);
>                         }
> @@ -858,7 +858,7 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
>          * support in IIO.
>          */
>
> -       dev_dbg(&indio_dev->dev, "%s: pos = %d, available = %d\n", __func__,
> +       dev_dbg(&indio_dev->dev, "pos = %d, available = %d\n",
>                 adc->bufi, available);
>         old_pos = adc->bufi;
>
> @@ -912,7 +912,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev *indio_dev)
>         if (!adc->dma_chan)
>                 return -EINVAL;
>
> -       dev_dbg(&indio_dev->dev, "%s size=%d watermark=%d\n", __func__,
> +       dev_dbg(&indio_dev->dev, "size=%d watermark=%d\n",
>                 adc->buf_sz, adc->buf_sz / 2);
>
>         if (adc->nconv == 1 && !indio_dev->trig)
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
