Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4F260E92
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Sep 2020 11:22:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81AE5C424B0;
	Tue,  8 Sep 2020 09:22:57 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A94BC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Sep 2020 07:28:06 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e17so16225094wme.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Sep 2020 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Z6Wg0SnwD/AXrAjVsevt8UVjOEN4t/lHztjh1vqIpc=;
 b=XS64cDdEhGlawiJh6LVQuM8ykQpy7fKVkJGEf9EAbve3bo1jpw4oCC4GRgsloDDnh6
 79IovVrRwEZTq0mrnScg98VKa+IjpWfYHULNtY5xWIvmUN3msVhp6bKexlE+JOCKWfZQ
 OdDDDHqkWDjMPimfhUw1iFLXZvY9XhED6DfnCI3hLP2Gk8NX4pQsuFBvCNOJ40gzF15l
 NrzkgFpq7tOHaadAH1MMSA5SD34+0jmY3Q+QU5mAYoHM+5M+pOAKwjQUlfGgpd61bXnz
 U9xQWgk/ISvqizVv/NOPyhFXkcHw+hxFiKuB684hwNJrExcYkAwUCMVVEjFrwMANVigs
 j3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Z6Wg0SnwD/AXrAjVsevt8UVjOEN4t/lHztjh1vqIpc=;
 b=Z+zWWrDNtEnenr8CtUwkeGUPgp+AexGZQFELan0fJ2w3f3WBWL3cSevjCYeJtAqKbj
 MPtK3YF0dU3hQSOVqiguJcuyXCxQOkEkL/Chuhf2SIIvGZ0PydkfSTZS0XEYIMmatDKh
 FzG0V/bLUL32Cf6nd81+qc7PKKDzEMlFvqhDIXA/S72PsU5PMUvEFNOFp9lCZ4CLpqLg
 0FPjo2P8uj9l++oXb5fqC5zCuhkuGgjlC2OfvscsIjdVshxk9EnTXh2KeH8NqmuiH0vq
 oJyNIx1d2/18GZcQthBaNxB77L0VI1ZYpo+pYD0LEbz/HdkYhR8aXOdLl901R8RHBjJm
 0ZcQ==
X-Gm-Message-State: AOAM530OEiPGiFjpqcb9bQWjeaJDPD4P0EI3EDMLv/2jkrjOWD8cnmeo
 Kl1SHHFELP1EYOS1pU3cxgfJZkFIEoe8Uxk0Hqw=
X-Google-Smtp-Source: ABdhPJwjK6sbs60PL5NK/eMKpIpeDVHYFaKbJBQcyNs8eO310GkWIw1SY87k3/I7sILHPffB+UnJxM8R7saP0utO1yc=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr2903235wmh.152.1599550086040; 
 Tue, 08 Sep 2020 00:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200901152713.18629-1-krzk@kernel.org>
 <20200901152713.18629-2-krzk@kernel.org>
In-Reply-To: <20200901152713.18629-2-krzk@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 8 Sep 2020 15:27:29 +0800
Message-ID: <CAAfSe-v4o-9zQZOSgQfAU-C4ruJU7BJdHRe4ikghx7AFgh1qgg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Tue, 08 Sep 2020 09:22:55 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-spi@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH 02/11] spi: sprd: Simplify with
	dev_err_probe()
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

On Tue, 1 Sep 2020 at 23:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/spi/spi-sprd-adi.c |  5 +----
>  drivers/spi/spi-sprd.c     | 17 +++++------------
>  2 files changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
> index 127b8bd25831..392ec5cfa3d6 100644
> --- a/drivers/spi/spi-sprd-adi.c
> +++ b/drivers/spi/spi-sprd-adi.c
> @@ -504,10 +504,7 @@ static int sprd_adi_probe(struct platform_device *pdev)
>                         dev_info(&pdev->dev, "no hardware spinlock supplied\n");
>                         break;
>                 default:
> -                       dev_err(&pdev->dev,
> -                               "failed to find hwlock id, %d\n", ret);
> -                       fallthrough;
> -               case -EPROBE_DEFER:
> +                       dev_err_probe(&pdev->dev, ret, "failed to find hwlock id\n");
>                         goto put_ctlr;
>                 }
>         }
> diff --git a/drivers/spi/spi-sprd.c b/drivers/spi/spi-sprd.c
> index 0443fec3a6ab..635738f54c73 100644
> --- a/drivers/spi/spi-sprd.c
> +++ b/drivers/spi/spi-sprd.c
> @@ -553,22 +553,15 @@ static int sprd_spi_dma_tx_config(struct sprd_spi *ss, struct spi_transfer *t)
>  static int sprd_spi_dma_request(struct sprd_spi *ss)
>  {
>         ss->dma.dma_chan[SPRD_SPI_RX] = dma_request_chan(ss->dev, "rx_chn");
> -       if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_RX])) {
> -               if (PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]) == -EPROBE_DEFER)
> -                       return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]);
> -
> -               dev_err(ss->dev, "request RX DMA channel failed!\n");
> -               return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]);
> -       }
> +       if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_RX]))
> +               return dev_err_probe(ss->dev, PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]),
> +                                    "request RX DMA channel failed!\n");
>
>         ss->dma.dma_chan[SPRD_SPI_TX]  = dma_request_chan(ss->dev, "tx_chn");
>         if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_TX])) {
>                 dma_release_channel(ss->dma.dma_chan[SPRD_SPI_RX]);
> -               if (PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]) == -EPROBE_DEFER)
> -                       return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]);
> -
> -               dev_err(ss->dev, "request TX DMA channel failed!\n");
> -               return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]);
> +               return dev_err_probe(ss->dev, PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]),
> +                                    "request TX DMA channel failed!\n");
>         }
>
>         return 0;
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
