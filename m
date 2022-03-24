Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB34E62CF
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 12:56:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E18ACC60497;
	Thu, 24 Mar 2022 11:56:13 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 519DCC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 11:56:12 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id s25so5820317lji.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20qzSFu8WfFwCVYdzmq5hRnnFKw8ZDXsTSDNJQxzips=;
 b=F29pMukvvs0UY7bTUtc1Tt9UgguPPK1AYFQx+T/yGyVZ+Y5Kzfd8qOBxFztYBt54Cn
 Ord0ThryohwhU38ZYzUtx2JM/TNVre58iFvSf6gz7nsFXurdeVbJsVGfn2Mzr5GfTACa
 trP9aVf/PauBXoHeuEzqVtqUaMxjGDOPzP9mJ0oOvgkjUN+kXI0BLq0XB/ONhoMIYEpy
 BopNgDvFptw0AiKJd4E1t3M0DWnXWV5g+5E1tZ/g/NLPLVv+yb//veNSaZCFdVKTVFtt
 2D/jQhdtUH18hJDdEFI5bdzei/dowxx0vsllHWmQ6uMte3hIezf7/lLnebGbox7gBFVd
 2ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20qzSFu8WfFwCVYdzmq5hRnnFKw8ZDXsTSDNJQxzips=;
 b=ZgXmiU8Bkdr2BtgkxKOhM6xQTX98J8UYSN9NvncEtmh5X/o4IDkzEvKVPOp36LBoiF
 SiJD0GANSIviKl3EYKTebmcFK95sTXlKJNg+ToJS28pKdV/Bhx/5yDaNSn5J3gCbKci8
 ZCHU2K7mTJlkk6j2I2AEZjIfZuw4+RbC7t1AcVHq2Si+R1miFIdWXngz8nhKl/MVzl3x
 Lne4Br3Q2O+YN+6nDAnioPC1VxdSDJpkTfERf5onWPGAuwYZ5jiZriDxS9ZP3K5r39IW
 m77rtxqSQIzCrC8hbeQdt5OgbsGI3MvqZypGNPwXn5nr/Dl23K+O4qhkztcO+VLoI+7h
 P1jw==
X-Gm-Message-State: AOAM530vXFYJSJbuvLgCI5W1yA3hzWzZriu53lNcnSlbdggd7jxFwq2e
 vpqvRU+xj9l+qp5wOxxOQTw+lt0cvzGsSmyNS7SCKg==
X-Google-Smtp-Source: ABdhPJw0GZRItCAMGMn5UV2L1PQyIs1R+7qQj5XrMCVRXWMeIg8BqBj3QSlStxt7HTPELqkp6gmVtw+jQBG/FeW7xHw=
X-Received: by 2002:a2e:9cc5:0:b0:239:da6e:290d with SMTP id
 g5-20020a2e9cc5000000b00239da6e290dmr3744841ljj.4.1648122971468; Thu, 24 Mar
 2022 04:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220317111944.116148-1-yann.gautier@foss.st.com>
 <20220317111944.116148-3-yann.gautier@foss.st.com>
In-Reply-To: <20220317111944.116148-3-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Mar 2022 12:55:35 +0100
Message-ID: <CAPDyKFqzzKgLHWiy26QW0hvM9kZEATS_c2mXkTuGiFpPaW8YKw@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] mmc: mmci: stm32: use a buffer for
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

On Thu, 17 Mar 2022 at 12:19, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> In SDIO mode, the sg list for requests can be unaligned with what the
> STM32 SDMMC internal DMA can support. In that case, instead of failing,
> use a temporary bounce buffer to copy from/to the sg list.
> This buffer is limited to 1MB. But for that we need to also limit
> max_req_size to 1MB. It has not shown any throughput penalties for
> SD-cards or eMMC.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 80 +++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 4566d7fc9055..a4414e32800f 100644
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
> @@ -54,6 +57,7 @@ struct sdmmc_dlyb {
>  static int sdmmc_idma_validate_data(struct mmci_host *host,
>                                     struct mmc_data *data)
>  {
> +       struct sdmmc_idma *idma = host->dma_priv;
>         struct scatterlist *sg;
>         int i;
>
> @@ -61,21 +65,23 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
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
> +                       idma->use_bounce_buffer = true;
> +                       return 0;
>                 }
>         }
>
>         if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
> -               dev_err(mmc_dev(host->mmc),
> +               dev_dbg(mmc_dev(host->mmc),
>                         "unaligned last scatterlist: ofst:%x length:%d\n",
>                         data->sg->offset, data->sg->length);
> -               return -EINVAL;
> +               idma->use_bounce_buffer = true;
>         }
>
>         return 0;
> @@ -84,18 +90,29 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
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
> @@ -112,8 +129,19 @@ static int sdmmc_idma_prep_data(struct mmci_host *host,
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
> @@ -137,6 +165,16 @@ static int sdmmc_idma_setup(struct mmci_host *host)
>                 host->mmc->max_segs = SDMMC_LLI_BUF_LEN /
>                         sizeof(struct sdmmc_lli_desc);
>                 host->mmc->max_seg_size = host->variant->stm32_idmabsize_mask;
> +
> +               host->mmc->max_req_size = SZ_1M;
> +               idma->bounce_buf = dmam_alloc_coherent(dev,
> +                                                      host->mmc->max_req_size,
> +                                                      &idma->bounce_dma_addr,
> +                                                      GFP_KERNEL);
> +               if (!idma->bounce_buf) {
> +                       dev_err(dev, "Unable to map allocate DMA bounce buffer.\n");
> +                       return -ENOMEM;

If we fail to allocate the 1M bounce buffer, then we end up always
using a PIO based mode, right?

Perhaps we can allow the above allocation to fail, but then limit us
to use DMA only when the buffers are properly aligned? Would that
work?

> +               }
>         } else {
>                 host->mmc->max_segs = 1;
>                 host->mmc->max_seg_size = host->mmc->max_req_size;
> @@ -154,8 +192,16 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
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

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
