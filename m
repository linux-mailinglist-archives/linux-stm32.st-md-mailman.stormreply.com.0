Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A75A1B00
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 23:25:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A39DC640FC;
	Thu, 25 Aug 2022 21:25:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33DBEC03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 21:25:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 l33-20020a05600c1d2100b003a645240a95so3151961wms.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=;
 b=dlpbM58i2Zl35pjmx5L7mRNtdc5YCm71F9sFmlELYER6ov9p1Zhw7Uryp66w+fECkw
 uWkzwI4ANxiJqV2NAH5qiBvSocnn8gCiQ2esbEPyK9VfrLMG6MP+UW57WsLhfQeb18Xm
 ywTHy3WQy2y0FYikqc1VoN0s6VRtWmBPqvQ7ayhaGh2a543N2UKdV/DJLzBcZZCckZJ6
 ioibCRuSXHClGOmbzN9j5ra8iRima6daMxIf45aGXMyoGgBcf5Q8AplMooQ7YxG8j1KJ
 +wVv5gF0Swo9gXi4Wnksh6Jhf6DtKC3uqCuZv3IfpxDnq0EW8o52F4JCeA7KQe1HLfXz
 RrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=;
 b=paO764TLVBVlNDvZsUKLMlqqCikPcZmIh9PcAH3qj8q1VCBoWwsmhTRADiq6+dds9n
 jq6HaryPH+4TkUEQCLuL2LCPZ1y78CeqnFHS5q8OgJZihBjDY0AUQRdJVRY/XAhfO5kw
 BiUAUI//HG8KLX7Mk3/6h7/L7CW2BTQ2mCvrpHHB4oNQs/u/+VhsmHP2ik9Q446vVDy0
 TIyXC7XpBjKD3SJypGGgHRMSGEwtFF2/xj6/x57ezfKC+D6/CpXws4BM7CiKL4NNKCDi
 WD4yqZTLv0L0mT/RdaYPJDYarDG9oBRA3CcA9Igdjty7lSkYCYr3csoFlo/Vhi6VIs4b
 htVA==
X-Gm-Message-State: ACgBeo0P9riLYPpmm5QTD3wL8HEk9NYYgYoT9QqOlCLrLUy1PDdMwWJn
 kCiLnTBu1lSTisWVbztU8fw=
X-Google-Smtp-Source: AA6agR4u4BAmHRat5LFEkPb1QUEY6oOp43RCL7jbGC6PWwiKhCvUcU/tuSQkwukDJ89Tw4ddFY+90Q==
X-Received: by 2002:a05:600c:b47:b0:3a5:a431:ce36 with SMTP id
 k7-20020a05600c0b4700b003a5a431ce36mr3484083wmr.89.1661462735769; 
 Thu, 25 Aug 2022 14:25:35 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b003a64f684704sm7324411wmq.40.2022.08.25.14.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 14:25:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Date: Thu, 25 Aug 2022 23:25:33 +0200
Message-ID: <1922204.usQuhbGJ8B@kista>
In-Reply-To: <20220820130925.589472-1-tudor.ambarus@microchip.com>
References: <20220820130925.589472-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Cc: tony@atomide.com, trix@redhat.com, konrad.dybcio@somainline.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org, ldewangan@nvidia.com,
 alim.akhtar@samsung.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 samuel@sholland.org, robert.jarzmik@free.fr, michal.simek@xilinx.com,
 peter.ujfalusi@gmail.com, jonathanh@nvidia.com,
 linux-samsung-soc@vger.kernel.org, wens@csie.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 linux-arm-msm@vger.kernel.org, Eugeniy.Paltsev@synopsys.com,
 linux-sunxi@lists.linux.dev, radhey.shyam.pandey@xilinx.com,
 kernel@pengutronix.de, Tudor Ambarus <tudor.ambarus@microchip.com>,
 rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com,
 green.wan@sifive.com, lars@metafoo.de, linux-mediatek@lists.infradead.org,
 haojian.zhuang@gmail.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org, shawnguo@kernel.org,
 daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: drivers: Use
	devm_platform_ioremap_resource()
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

Dne sobota, 20. avgust 2022 ob 15:09:25 CEST je Tudor Ambarus napisal(a):
> platform_get_resource() and devm_ioremap_resource() are wrapped up in the
> devm_platform_ioremap_resource() helper. Use the helper and get rid of the
> local variable for struct resource *. We now have a function call less.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/dma/bcm2835-dma.c                      |  4 +---
>  drivers/dma/dma-axi-dmac.c                     |  4 +---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  4 +---
>  drivers/dma/fsl-edma.c                         |  8 +++-----
>  drivers/dma/fsl-qdma.c                         | 10 +++-------
>  drivers/dma/idma64.c                           |  4 +---
>  drivers/dma/img-mdc-dma.c                      |  4 +---
>  drivers/dma/imx-dma.c                          |  4 +---
>  drivers/dma/imx-sdma.c                         |  4 +---
>  drivers/dma/mcf-edma.c                         |  5 +----
>  drivers/dma/mediatek/mtk-hsdma.c               |  4 +---
>  drivers/dma/mmp_pdma.c                         |  4 +---
>  drivers/dma/mmp_tdma.c                         |  4 +---
>  drivers/dma/moxart-dma.c                       |  4 +---
>  drivers/dma/mv_xor_v2.c                        |  7 ++-----
>  drivers/dma/mxs-dma.c                          |  4 +---
>  drivers/dma/nbpfaxi.c                          |  4 +---
>  drivers/dma/pxa_dma.c                          |  4 +---
>  drivers/dma/qcom/bam_dma.c                     |  4 +---
>  drivers/dma/s3c24xx-dma.c                      |  4 +---
>  drivers/dma/sf-pdma/sf-pdma.c                  |  4 +---
>  drivers/dma/sh/usb-dmac.c                      |  4 +---
>  drivers/dma/stm32-dma.c                        |  4 +---
>  drivers/dma/stm32-dmamux.c                     |  4 +---
>  drivers/dma/stm32-mdma.c                       |  4 +---
>  drivers/dma/sun4i-dma.c                        |  4 +---
>  drivers/dma/sun6i-dma.c                        |  4 +---

For sun4i-dma.c and sun6i-dma.c:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/dma/tegra210-adma.c                    |  4 +---
>  drivers/dma/ti/cppi41.c                        | 10 +++-------
>  drivers/dma/ti/omap-dma.c                      |  4 +---
>  drivers/dma/xilinx/zynqmp_dma.c                |  4 +---
>  31 files changed, 38 insertions(+), 106 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
