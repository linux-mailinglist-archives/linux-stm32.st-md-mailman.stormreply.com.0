Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE56260E91
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Sep 2020 11:22:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D952C3FAFE;
	Tue,  8 Sep 2020 09:22:57 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14E5DC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Sep 2020 07:27:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e16so17959100wrm.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Sep 2020 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOkWytvEQvcwRPaTbbeU+nJ2kZpJZSrQDxi081fe4SY=;
 b=VYOBXZVmm6Me9qi2cd3T0B/OHWxYd9Ambemd6O5THwOeqoYikp+sY/gKnIm7j4SjE5
 nVFpiqk8CNOhnkwk3Z0bUqDXZyYc4d7SD2dAsnn9g4HyCLk+kXTqxBr8ly6SsM6zBBLO
 w/n7zcnOX9DC9ykasRnl+a2R/+yCpi25q5t9LQbCKdpGjiZzaA6DUGUWU/v+zKU41Xah
 3v+dN1tAuBLvJ41uDHHJUI+9N+fy04RyuaKu0eeVLtMxE00q16uOds4Z2hnuFvdDat/d
 4f9Dop7JC5IP6sZlOgVPP54Q+Epr3d78yyyDtWgtGftL/frpXXVK3527GizQK67Bel0P
 /fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOkWytvEQvcwRPaTbbeU+nJ2kZpJZSrQDxi081fe4SY=;
 b=ANK/4nFVZWKVZ0QFAgw38/Y9hF8fflFMA2L0Bb8D4tM41IqzDcYUqjBw5z+/l5TCw2
 BMom+SkPFNn9lyX2wG1nggNCk6PWDCZEPqTyD0n1mW7ra6JI/YJwRmsTL4Oh8uTzL7ub
 vWJeKRSUIcdF2Zb8mjL59EZUt2rlt8sj61JZbeso9LvQ5x+KAGn07QfZ4KiqlBcPH/Kz
 8psQyafs1i82S40aYlEAdihqMfR+TeJBeUW+1GgfVSbAHyCRu6veyVLIBc3OD0lJAvKj
 ChaZYTQOc/+jiR2Q+PtKGn+44WwBMKqHodLjMwdI8KNXc6Qp0mHSD4uNRJsuqY8GJYYt
 lA/A==
X-Gm-Message-State: AOAM533uumX8XfJBQQrwC5BuEC08cI17YnTd691rJ9MBv1k4y7M4Dnw/
 S5yg7ueJa+cXp3yjZjTlbnwmNogFh6so1kOaexY=
X-Google-Smtp-Source: ABdhPJzy45/B81xFTZ9qjxIyvVXE4rPehBDIzrqnJqdm5h0UGpJq905XCRaEh6NE80cNlJ8M295wsyMpnc8KnrLSWF8=
X-Received: by 2002:a05:6000:36d:: with SMTP id
 f13mr24484491wrf.425.1599550066606; 
 Tue, 08 Sep 2020 00:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200901152713.18629-1-krzk@kernel.org>
In-Reply-To: <20200901152713.18629-1-krzk@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 8 Sep 2020 15:27:10 +0800
Message-ID: <CAAfSe-u6Prn=nnX8Y67DearNEuHH90Fo71R7hmxbvWGuPxyk2w@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Tue, 08 Sep 2020 09:22:54 +0000
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
 Nicolas Ferre <nicolas.ferre@microchip.com>, stable <stable@vger.kernel.org>,
 linux-spi@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH 01/11] spi: sprd: Release DMA channel also
	on probe deferral
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
> If dma_request_chan() for TX channel fails with EPROBE_DEFER, the RX
> channel would not be released and on next re-probe it would be requested
> second time.
>
> Fixes: 386119bc7be9 ("spi: sprd: spi: sprd: Add DMA mode support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/spi/spi-sprd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-sprd.c b/drivers/spi/spi-sprd.c
> index 6678f1cbc566..0443fec3a6ab 100644
> --- a/drivers/spi/spi-sprd.c
> +++ b/drivers/spi/spi-sprd.c
> @@ -563,11 +563,11 @@ static int sprd_spi_dma_request(struct sprd_spi *ss)
>
>         ss->dma.dma_chan[SPRD_SPI_TX]  = dma_request_chan(ss->dev, "tx_chn");
>         if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_TX])) {
> +               dma_release_channel(ss->dma.dma_chan[SPRD_SPI_RX]);
>                 if (PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]) == -EPROBE_DEFER)
>                         return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]);
>
>                 dev_err(ss->dev, "request TX DMA channel failed!\n");
> -               dma_release_channel(ss->dma.dma_chan[SPRD_SPI_RX]);
>                 return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]);
>         }
>
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
