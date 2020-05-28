Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E51E5CCD
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 12:15:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEF89C36B23;
	Thu, 28 May 2020 10:15:09 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C5F4C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 10:15:07 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id e7so15464617vsm.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NnFvkEinSu8JNeeiaCqqDDP3KthjxwCRXHN9I0khteE=;
 b=JKXLgYnRrXprs68FC8fP4Hq7I9VPldQJYeOyc/9tZMIvKGkf3t5OoImS5K4atsMnAN
 r27FPxAuUszQNOJP2Mc0e0W6PepVkbJr7xfkUcfmu59eRZHeKzQsqFqgPrCLjhZ2QcZm
 B98a7+5hvdsR4PehdNAbX2Q5Irc8IRfgouLxpRWRu9GLQmRxE+zYRiXyI51m7zoRSkTJ
 +rswdazaCjsE26eujh5yTeYERp1E0iZsmhEVLg3VEOfm4tqR8fEEMp3c4DUPAf0RW48B
 6C4TICJ1VGKAY2wPQ1LKT6XGF2yPvJNdhTWDNUDY6Dvh2AZDUdM0GPcSLgQ5yRXyb7ex
 BfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NnFvkEinSu8JNeeiaCqqDDP3KthjxwCRXHN9I0khteE=;
 b=gtyfgtYsD1Dtq1oS7U2AUx2+/WEDpK5HFJWGPLiAqRQeqn3Kz0hkdbTURnoD4lMuvz
 5OcBKkXek901d6wzP/XJV3KBf1Dh4Ztfy2KpegZFX3LqpsWrmAYl5v8FEf+iQlH1gz6A
 L2oRNgrguEXdhmwrPTILs5fp0t0fo3Zilag+cpcX7zHT7Ko4737GxAjFC37VWHLwc+qd
 wOZKpkgpzWSUMPVoB0abfZIhLJu2kKdSRcw30Pdl8HEv6t7lk3QwyV5B4nRVGXivNC0O
 MTcl8EIWQq0/JgUZq21BTPxqAy1060nGvKe2D9ft8zWA6tSLhgyHrLnIVv45dbdsCL4z
 Ahig==
X-Gm-Message-State: AOAM5302iAPguwTiXK5sWn/4dcu1nNHPpwFd8kD3rQnaqTl7zFKJ+xzQ
 1PEbGS/mMikJXLcypONVbUQTC2tkr+mJ3kZwIypTxw==
X-Google-Smtp-Source: ABdhPJzVo18IfEZvDNjehMuUK+Er1KC2DxaDvMSbNlAbvNzpRPVY17HtVDdF3JBPl18RRNoiV/BlCC6N4HoAjWTgSlA=
X-Received: by 2002:a67:ec58:: with SMTP id z24mr1378822vso.200.1590660905952; 
 Thu, 28 May 2020 03:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200526155103.12514-1-ludovic.barre@st.com>
 <20200526155103.12514-3-ludovic.barre@st.com>
In-Reply-To: <20200526155103.12514-3-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 28 May 2020 12:14:28 +0200
Message-ID: <CAPDyKForRHZFGEzn=5OVY8YP6okFj7G2e6QTJFH5-Q_xP3QLBw@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] mmc: mmci_sdmmc: fix DMA API warning
	max segment size
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

On Tue, 26 May 2020 at 17:51, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> Turning on CONFIG_DMA_API_DEBUG_SG results in the following warning:
> WARNING: CPU: 1 PID: 85 at kernel/dma/debug.c:1302 debug_dma_map_sg+0x2a0/0x3cc
> mmci-pl18x 58005000.sdmmc: DMA-API: mapping sg segment longer than device claims to support [len=126976] [max=65536]
>
> dma api debug checks and compares the segment size to
> dma_get_max_seg_size (dev->dma_parms->max_segment_size),
> the sdmmc variant has an internal DMA and should define
> its max_segment_size constraint to avoid this warning.
>
> This Patch defines the dev->dma_parms->max_segment_size
> with the constraint already set for mmc core
> (host->mmc->max_seg_size).
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Applied for next, thanks!

Note, a manual backport is needed for stable, as
dma_set_max_seg_size() will fail for older kernels.
We needed to revert 9495b7e92f7 ("driver core: platform: Initialize
dma_parms for platform devices"), for stable kernels [1].

Kind regards
Uffe

[1]
https://lkml.org/lkml/2020/5/26/1216


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 2965b1c062e1..51db30acf4dc 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -119,20 +119,19 @@ static void sdmmc_idma_unprep_data(struct mmci_host *host,
>  static int sdmmc_idma_setup(struct mmci_host *host)
>  {
>         struct sdmmc_idma *idma;
> +       struct device *dev = mmc_dev(host->mmc);
>
> -       idma = devm_kzalloc(mmc_dev(host->mmc), sizeof(*idma), GFP_KERNEL);
> +       idma = devm_kzalloc(dev, sizeof(*idma), GFP_KERNEL);
>         if (!idma)
>                 return -ENOMEM;
>
>         host->dma_priv = idma;
>
>         if (host->variant->dma_lli) {
> -               idma->sg_cpu = dmam_alloc_coherent(mmc_dev(host->mmc),
> -                                                  SDMMC_LLI_BUF_LEN,
> +               idma->sg_cpu = dmam_alloc_coherent(dev, SDMMC_LLI_BUF_LEN,
>                                                    &idma->sg_dma, GFP_KERNEL);
>                 if (!idma->sg_cpu) {
> -                       dev_err(mmc_dev(host->mmc),
> -                               "Failed to alloc IDMA descriptor\n");
> +                       dev_err(dev, "Failed to alloc IDMA descriptor\n");
>                         return -ENOMEM;
>                 }
>                 host->mmc->max_segs = SDMMC_LLI_BUF_LEN /
> @@ -143,7 +142,7 @@ static int sdmmc_idma_setup(struct mmci_host *host)
>                 host->mmc->max_seg_size = host->mmc->max_req_size;
>         }
>
> -       return 0;
> +       return dma_set_max_seg_size(dev, host->mmc->max_seg_size);
>  }
>
>  static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
