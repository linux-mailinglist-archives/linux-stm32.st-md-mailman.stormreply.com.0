Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D500C4EEFA3
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 16:27:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 878ECC5EC6B;
	Fri,  1 Apr 2022 14:27:43 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76C4EC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 14:27:41 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2eb2fc29caeso4242767b3.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Apr 2022 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/yBHZSAzaOdetcg5JOmc7KTk+gATLVEE7qyh+p2yR08=;
 b=lKu8NVYdkB8B4FroUiZcqglGUjmayIjnAOxS557eZB9iqUw3yVgKqog4K+ulQTQ+IE
 dGPqkKVHNvB8Z66V9QC1ctGMwsdDl+sjxyfxv1LzkIpf1x0vIHymXnQf90klHyoIBEFC
 3lO2PXxv38FQyWHytdRHlqzlH/2VtTwj55GQjGASLOj2e3jyp55+RK2PhMTaDZTn67bD
 SEeuFZ3xVp057vNLwm90J76+e1spNghFZ4EDTSa0QALnENZrk8xB2IE5+62aku3NWBNv
 G87AuYYt9jUuab8e7NS5+dT96N0ujvuRf8pDdMcpWYDArq2ZsLf4L2ox5mrfQetYRxFz
 ioBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/yBHZSAzaOdetcg5JOmc7KTk+gATLVEE7qyh+p2yR08=;
 b=eMMglNLo13vHkYJQvFhZOO/TBVC4r/8EFOwNIKf+OZGZlatgvvRnaAEgTyOQAPkxvy
 WhtDRKDqLNdFmFuRgql+rg23NNv1VHTVTZsNcZlHEnhCTulZcCuUPlaFr22EkRsBKuFr
 Jt/UHnnZ9ux9m1bELET0VjlO7i0U5D9SSl+5ygPn7VaHU87JrjN1J5BY/cIw+D+9LGB+
 bxI8ts4n3tjFrnBwaQK3Y3NQjlVe1tClntKEqrDbZHUMW6QJJ6jp1a587T9LFI+iijrr
 mEMMknFw0CbLsKjvf+Rj1bMjesyvNnsZt2GfR1aw4ReXYJxgwrVkr3gAk1vZBSv8KTHw
 iRbw==
X-Gm-Message-State: AOAM531SWvcjlQ1gEjZkQ8TyrM62KyQN6LN+/NJOH7r6y2/9ua7K+et3
 X/ZaPG/9P1fw6dVNTH10W6d2bzLdoyr2MmL/CA2U+g==
X-Google-Smtp-Source: ABdhPJx/s4Sf3KYRYdEDYCncQP39/k+7eSFZl8peNL0nvO6jLLB+GW3oMlL+R1l/6d7d2z75kLYO4MEE8GYJ3vTrAuI=
X-Received: by 2002:a81:d4b:0:b0:2e5:91f2:ddc6 with SMTP id
 72-20020a810d4b000000b002e591f2ddc6mr10255853ywn.362.1648823260326; Fri, 01
 Apr 2022 07:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220328145114.334577-1-yann.gautier@foss.st.com>
In-Reply-To: <20220328145114.334577-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Apr 2022 16:27:02 +0200
Message-ID: <CAPDyKFqvZRangM1V_6d+iAPJ=1AG7_VFU8YVyp20a7d-9-OZGA@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: stm32: use a buffer for
	unaligned DMA requests
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

On Mon, 28 Mar 2022 at 16:51, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> In SDIO mode, the sg list for requests can be unaligned with what the
> STM32 SDMMC internal DMA can support. In that case, instead of failing,
> use a temporary bounce buffer to copy from/to the sg list.
> This buffer is limited to 1MB. But for that we need to also limit
> max_req_size to 1MB. It has not shown any throughput penalties for
> SD-cards or eMMC.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

Queued up for v5.19 on the devel branch, thanks!

Kind regards
Uffe


> ---
> Changes since v1:
> - allocate bounce buffer in sdmmc_idma_validate_data()
> - realign on top of mmc/devel branch
>   (25e14a52d35928a1831ca98889a8a25ac3017990)
>
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 88 +++++++++++++++++++++++------
>  1 file changed, 71 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 4566d7fc9055..60bca78a72b1 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -43,6 +43,9 @@ struct sdmmc_lli_desc {
>  struct sdmmc_idma {
>         dma_addr_t sg_dma;
>         void *sg_cpu;
> +       dma_addr_t bounce_dma_addr;
> +       void *bounce_buf;
> +       bool use_bounce_buffer;
>  };
>
>  struct sdmmc_dlyb {
> @@ -54,6 +57,8 @@ struct sdmmc_dlyb {
>  static int sdmmc_idma_validate_data(struct mmci_host *host,
>                                     struct mmc_data *data)
>  {
> +       struct sdmmc_idma *idma = host->dma_priv;
> +       struct device *dev = mmc_dev(host->mmc);
>         struct scatterlist *sg;
>         int i;
>
> @@ -61,41 +66,69 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
>          * idma has constraints on idmabase & idmasize for each element
>          * excepted the last element which has no constraint on idmasize
>          */
> +       idma->use_bounce_buffer = false;
>         for_each_sg(data->sg, sg, data->sg_len - 1, i) {
>                 if (!IS_ALIGNED(sg->offset, sizeof(u32)) ||
>                     !IS_ALIGNED(sg->length, SDMMC_IDMA_BURST)) {
> -                       dev_err(mmc_dev(host->mmc),
> +                       dev_dbg(mmc_dev(host->mmc),
>                                 "unaligned scatterlist: ofst:%x length:%d\n",
>                                 data->sg->offset, data->sg->length);
> -                       return -EINVAL;
> +                       goto use_bounce_buffer;
>                 }
>         }
>
>         if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
> -               dev_err(mmc_dev(host->mmc),
> +               dev_dbg(mmc_dev(host->mmc),
>                         "unaligned last scatterlist: ofst:%x length:%d\n",
>                         data->sg->offset, data->sg->length);
> -               return -EINVAL;
> +               goto use_bounce_buffer;
>         }
>
> +       return 0;
> +
> +use_bounce_buffer:
> +       if (!idma->bounce_buf) {
> +               idma->bounce_buf = dmam_alloc_coherent(dev,
> +                                                      host->mmc->max_req_size,
> +                                                      &idma->bounce_dma_addr,
> +                                                      GFP_KERNEL);
> +               if (!idma->bounce_buf) {
> +                       dev_err(dev, "Unable to map allocate DMA bounce buffer.\n");
> +                       return -ENOMEM;
> +               }
> +       }
> +
> +       idma->use_bounce_buffer = true;
> +
>         return 0;
>  }
>
>  static int _sdmmc_idma_prep_data(struct mmci_host *host,
>                                  struct mmc_data *data)
>  {
> -       int n_elem;
> +       struct sdmmc_idma *idma = host->dma_priv;
>
> -       n_elem = dma_map_sg(mmc_dev(host->mmc),
> -                           data->sg,
> -                           data->sg_len,
> -                           mmc_get_dma_dir(data));
> +       if (idma->use_bounce_buffer) {
> +               if (data->flags & MMC_DATA_WRITE) {
> +                       unsigned int xfer_bytes = data->blksz * data->blocks;
>
> -       if (!n_elem) {
> -               dev_err(mmc_dev(host->mmc), "dma_map_sg failed\n");
> -               return -EINVAL;
> -       }
> +                       sg_copy_to_buffer(data->sg, data->sg_len,
> +                                         idma->bounce_buf, xfer_bytes);
> +                       dma_wmb();
> +               }
> +       } else {
> +               int n_elem;
> +
> +               n_elem = dma_map_sg(mmc_dev(host->mmc),
> +                                   data->sg,
> +                                   data->sg_len,
> +                                   mmc_get_dma_dir(data));
>
> +               if (!n_elem) {
> +                       dev_err(mmc_dev(host->mmc), "dma_map_sg failed\n");
> +                       return -EINVAL;
> +               }
> +       }
>         return 0;
>  }
>
> @@ -112,8 +145,19 @@ static int sdmmc_idma_prep_data(struct mmci_host *host,
>  static void sdmmc_idma_unprep_data(struct mmci_host *host,
>                                    struct mmc_data *data, int err)
>  {
> -       dma_unmap_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
> -                    mmc_get_dma_dir(data));
> +       struct sdmmc_idma *idma = host->dma_priv;
> +
> +       if (idma->use_bounce_buffer) {
> +               if (data->flags & MMC_DATA_READ) {
> +                       unsigned int xfer_bytes = data->blksz * data->blocks;
> +
> +                       sg_copy_from_buffer(data->sg, data->sg_len,
> +                                           idma->bounce_buf, xfer_bytes);
> +               }
> +       } else {
> +               dma_unmap_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
> +                            mmc_get_dma_dir(data));
> +       }
>  }
>
>  static int sdmmc_idma_setup(struct mmci_host *host)
> @@ -137,6 +181,8 @@ static int sdmmc_idma_setup(struct mmci_host *host)
>                 host->mmc->max_segs = SDMMC_LLI_BUF_LEN /
>                         sizeof(struct sdmmc_lli_desc);
>                 host->mmc->max_seg_size = host->variant->stm32_idmabsize_mask;
> +
> +               host->mmc->max_req_size = SZ_1M;
>         } else {
>                 host->mmc->max_segs = 1;
>                 host->mmc->max_seg_size = host->mmc->max_req_size;
> @@ -154,8 +200,16 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
>         struct scatterlist *sg;
>         int i;
>
> -       if (!host->variant->dma_lli || data->sg_len == 1) {
> -               writel_relaxed(sg_dma_address(data->sg),
> +       if (!host->variant->dma_lli || data->sg_len == 1 ||
> +           idma->use_bounce_buffer) {
> +               u32 dma_addr;
> +
> +               if (idma->use_bounce_buffer)
> +                       dma_addr = idma->bounce_dma_addr;
> +               else
> +                       dma_addr = sg_dma_address(data->sg);
> +
> +               writel_relaxed(dma_addr,
>                                host->base + MMCI_STM32_IDMABASE0R);
>                 writel_relaxed(MMCI_STM32_IDMAEN,
>                                host->base + MMCI_STM32_IDMACTRLR);
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
