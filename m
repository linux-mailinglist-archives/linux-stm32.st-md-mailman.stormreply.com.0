Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78A7AEA67
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Sep 2023 12:30:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00895C6A5EA;
	Tue, 26 Sep 2023 10:30:24 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91A30C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 10:30:22 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d8181087dc9so9310613276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695724221; x=1696329021;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zs6EsaFrBTKV0IZZFceNWjelEHVonwomtwZivcGV1MQ=;
 b=VpR35xuudwGNVDCL4U+OEOVjQJ2CTHLW9812TZBlWtHAPm2afKNjKAB+Wc/0W6evqg
 MHaWpjFW9pgYJ1/elTnvSdcARN4P8/Pgp291rx6Gp0gsHOfAwhJcenRHmqFrIy9SkoIk
 Sof2VgVXbVxOZ0xu3zCR7o9Hy5hILC1lPW3+jkOzl8Uug/SYqY/2FuCuNXBmodMTTprW
 5bQHoydkf0X01C+efaWdoj2cg53iaVKVMqv71nDY5NZQe7dTjPn7BnOisSueaoXpkR2V
 /9U6efl9K3XMz71aSGPptCxXzPl9GEbu87aKmngX1G3+1e941zTmzZZb/H6XD0Azt8tW
 LAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695724221; x=1696329021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zs6EsaFrBTKV0IZZFceNWjelEHVonwomtwZivcGV1MQ=;
 b=RR2EII0qJtojmXMFVXOEHapX36eKZ3bFltxUWoZCuHWqrf0gJRQVJY7DIuJqQFJXS5
 nBpEHQqWt3dRqWQjD//n/bILdB5r/3LVPUsnUY7RFR27bvez4T+SQtnbITuPrzV16ATB
 kY9OJv+Jn6zhD2jqe/m4XTP+8jH983Wz7phAAr2PkEQ2nrZE96iC/TzcLWvbP4/BYbRb
 /Dx5KVK6S4da/ZsH3nt+bIttu4mH6FPbFvRBjMopZNGPy8a05Sfk5vnRfgDVtqhPlqEi
 /nG6Nv9yf/COMqn0KPLjYizx938hcPgATvBd1pbvQgj/whtjNw59sSyVIBUtEzVGfN37
 imhg==
X-Gm-Message-State: AOJu0YzVQfFNNrWCCjWc4M1lXduBw1Cp0Ra018ojfzX0ao4lMV2HF1e5
 yRRf8KR2daVRlruG88WP/z+7ZnasRXsjNqwTVywyhg==
X-Google-Smtp-Source: AGHT+IHZilRoOWb3DKIhWHeylO1T8c/K+BDCkD7/mjz70rFuaPmSIWKBXiXeUcy/mHxX0LQMsysaP0GW8DLzuQYBZk0=
X-Received: by 2002:a25:d3d0:0:b0:d22:af93:1abb with SMTP id
 e199-20020a25d3d0000000b00d22af931abbmr9393570ybf.59.1695724221360; Tue, 26
 Sep 2023 03:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230914150904.155630-1-yann.gautier@foss.st.com>
In-Reply-To: <20230914150904.155630-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Sep 2023 12:29:45 +0200
Message-ID: <CAPDyKFrBUcqwuwVJsVi1JrG+0S=vWJ7D-BjQhjg-AU0GsbKO1Q@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

On Thu, 14 Sept 2023 at 17:09, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> From: Christophe Kerello <christophe.kerello@foss.st.com>
>
> Add the support of SDIO in-band interrupt mode for STM32 and Ux500
> variants.
> It allows the SD I/O card to interrupt the host on SDMMC_D1 data line.
> It is not enabled by default on Ux500 variant as this is unstable and
> Ux500 users should use out-of-band IRQs.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> Updates on v2:
> * rename use_sdio_irq to supports_sdio_irq and change it to bool
> * use common code for ux500 and stm32 variants
>
> ---
>  drivers/mmc/host/mmci.c             | 85 +++++++++++++++++++++++++++++
>  drivers/mmc/host/mmci.h             |  7 +++
>  drivers/mmc/host/mmci_stm32_sdmmc.c |  2 +
>  3 files changed, 94 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index dda756a563793..65cc03ee7f23b 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -272,6 +272,7 @@ static struct variant_data variant_stm32_sdmmc = {
>         .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(12, 5),
>         .stm32_idmabsize_align  = BIT(5),
> +       .supports_sdio_irq      = true,
>         .busy_timeout           = true,
>         .busy_detect            = true,
>         .busy_detect_flag       = MCI_STM32_BUSYD0,
> @@ -299,6 +300,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
>         .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(16, 5),
>         .stm32_idmabsize_align  = BIT(5),
> +       .supports_sdio_irq      = true,
>         .dma_lli                = true,
>         .busy_timeout           = true,
>         .busy_detect            = true,
> @@ -327,6 +329,7 @@ static struct variant_data variant_stm32_sdmmcv3 = {
>         .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(16, 6),
>         .stm32_idmabsize_align  = BIT(6),
> +       .supports_sdio_irq      = true,
>         .dma_lli                = true,
>         .busy_timeout           = true,
>         .busy_detect            = true,
> @@ -423,6 +426,11 @@ static void mmci_write_datactrlreg(struct mmci_host *host, u32 datactrl)
>         /* Keep busy mode in DPSM if enabled */
>         datactrl |= host->datactrl_reg & host->variant->busy_dpsm_flag;
>
> +       /* Keep SD I/O interrupt mode enabled */
> +       if (host->variant->supports_sdio_irq &&
> +           host->mmc->caps & MMC_CAP_SDIO_IRQ)
> +               datactrl |= host->variant->datactrl_mask_sdio;
> +

This doesn't look entirely correct to me, as it will make the
->datactrl_mask_sdio bit to be set even when it shouldn't. If I
understand correctly, we really want the bit to be set if the SDIO
irqs has been enabled, but otherwise leave it for mmci_start_data() to
manage it, right?

That said, perhaps the comment a few lines above, deserves some
clarification too. Would rephrasing it into "Keep the SDIO mode bit if
SDIO irqs are enabled" make it more clear?

From an implementation point of view, an idea is to add a
"host->datactrl_reg_add" variable (we have this for the clk and pwr
registers already). mmci_write_datactrlreg() should then OR these bits
when writing to the register. In this way, mmci_enable_sdio_irq() can
update the host->datactrl_reg_add with ->datactrl_mask_sdio, when
needed. This should also work for the ->busy_dpsm_flag a few lines
above, I think.

>         if (host->datactrl_reg != datactrl) {
>                 host->datactrl_reg = datactrl;
>                 writel(datactrl, host->base + MMCIDATACTRL);
> @@ -817,6 +825,25 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
>         return (host->busy_state == MMCI_BUSY_DONE);
>  }
>
> +void ux500_and_stm32_enable_sdio_irq(struct mmci_host *host, int enable)
> +{
> +       void __iomem *base = host->base;
> +       u32 mask = readl_relaxed(base + MMCIMASK0);
> +
> +       if (enable)
> +               writel_relaxed(mask | MCI_ST_SDIOITMASK, base + MMCIMASK0);
> +       else
> +               writel_relaxed(mask & ~MCI_ST_SDIOITMASK, base + MMCIMASK0);
> +}
> +
> +void ux500_and_stm32_sdio_irq(struct mmci_host *host, u32 status)
> +{
> +       if (status & MCI_ST_SDIOIT) {
> +               ux500_and_stm32_enable_sdio_irq(host, 0);
> +               sdio_signal_irq(host->mmc);
> +       }
> +}
> +
>  /*
>   * All the DMA operation mode stuff goes inside this ifdef.
>   * This assumes that you have a generic DMA device interface,
> @@ -1191,6 +1218,8 @@ static void ux500_variant_init(struct mmci_host *host)
>  {
>         host->ops = &mmci_variant_ops;
>         host->ops->busy_complete = ux500_busy_complete;
> +       host->ops->enable_sdio_irq = ux500_and_stm32_enable_sdio_irq;
> +       host->ops->sdio_irq = ux500_and_stm32_sdio_irq;
>  }
>
>  static void ux500v2_variant_init(struct mmci_host *host)
> @@ -1198,6 +1227,8 @@ static void ux500v2_variant_init(struct mmci_host *host)
>         host->ops = &mmci_variant_ops;
>         host->ops->busy_complete = ux500_busy_complete;
>         host->ops->get_datactrl_cfg = ux500v2_get_dctrl_cfg;
> +       host->ops->enable_sdio_irq = ux500_and_stm32_enable_sdio_irq;
> +       host->ops->sdio_irq = ux500_and_stm32_sdio_irq;
>  }

It looks to me that the extra layer of mmci variant callbacks is a bit
"heavy" at this point. ux500 and the st variants seem to work very
similarly in this regard. So maybe just the mmci_ops callbacks
directly and stick to the mmci* prefix of the function names. At least
until we see a better reason to have the extra layer of callbacks.

Of course, this also means that we need to assign
mmci_ops->enable_sdio_irq|ack_sdio_irq() conditionally during probe,
based upon the variant->supports_sdio_irq bit.

>
>  static void mmci_pre_request(struct mmc_host *mmc, struct mmc_request *mrq)
> @@ -1805,6 +1836,11 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>                         mmci_data_irq(host, host->data, status);
>                 }
>
> +               if (host->variant->supports_sdio_irq &&
> +                   host->mmc->caps & MMC_CAP_SDIO_IRQ &&

Checking the caps seems superfluous. The SDIO irqs must not be
enabled, unless MMC_CAP_SDIO_IRQ is supported, right?

> +                   host->ops && host->ops->sdio_irq)
> +                       host->ops->sdio_irq(host, status);
> +
>                 /*
>                  * Busy detection has been handled by mmci_cmd_irq() above.
>                  * Clear the status bit to prevent polling in IRQ context.
> @@ -2041,6 +2077,45 @@ static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>         return ret;
>  }
>
> +static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
> +{
> +       struct mmci_host *host = mmc_priv(mmc);
> +       unsigned long flags;
> +
> +       if (!host->variant->supports_sdio_irq)
> +               return;

According to the earlier comment above about the extra layers of
callbacks, this can then be checked during probe instead and dropped
from here.

> +
> +       if (host->ops && host->ops->enable_sdio_irq) {
> +               if (enable)
> +                       /* Keep device active while SDIO IRQ is enabled */
> +                       pm_runtime_get_sync(mmc_dev(mmc));
> +
> +               spin_lock_irqsave(&host->lock, flags);
> +               host->ops->enable_sdio_irq(host, enable);
> +               spin_unlock_irqrestore(&host->lock, flags);
> +
> +               if (!enable) {
> +                       pm_runtime_mark_last_busy(mmc_dev(mmc));
> +                       pm_runtime_put_autosuspend(mmc_dev(mmc));
> +               }
> +       }
> +}
> +
> +static void mmci_ack_sdio_irq(struct mmc_host *mmc)
> +{
> +       struct mmci_host *host = mmc_priv(mmc);
> +       unsigned long flags;
> +
> +       if (!host->variant->supports_sdio_irq)
> +               return;

Ditto.

> +
> +       if (host->ops && host->ops->enable_sdio_irq) {
> +               spin_lock_irqsave(&host->lock, flags);
> +               host->ops->enable_sdio_irq(host, 1);
> +               spin_unlock_irqrestore(&host->lock, flags);
> +       }
> +}
> +
>  static struct mmc_host_ops mmci_ops = {
>         .request        = mmci_request,
>         .pre_req        = mmci_pre_request,
> @@ -2049,6 +2124,8 @@ static struct mmc_host_ops mmci_ops = {
>         .get_ro         = mmc_gpio_get_ro,
>         .get_cd         = mmci_get_cd,
>         .start_signal_voltage_switch = mmci_sig_volt_switch,
> +       .enable_sdio_irq = mmci_enable_sdio_irq,
> +       .ack_sdio_irq   = mmci_ack_sdio_irq,
>  };
>
>  static void mmci_probe_level_translator(struct mmc_host *mmc)
> @@ -2316,6 +2393,14 @@ static int mmci_probe(struct amba_device *dev,
>                 mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
>         }
>
> +       if (variant->supports_sdio_irq && host->mmc->caps & MMC_CAP_SDIO_IRQ) {
> +               mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
> +
> +               if (variant->datactrl_mask_sdio)
> +                       mmci_write_datactrlreg(host,
> +                                              host->variant->datactrl_mask_sdio);

As I stated earlier, it looks to me that this should be managed when
enabling/disabling the SDIO irqs and not during probe. No?

> +       }
> +
>         /* Variants with mandatory busy timeout in HW needs R1B responses. */
>         if (variant->busy_timeout)
>                 mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 253197f132fca..5ea4975c18ec5 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -331,6 +331,7 @@ enum mmci_busy_state {
>   *            register.
>   * @opendrain: bitmask identifying the OPENDRAIN bit inside MMCIPOWER register
>   * @dma_lli: true if variant has dma link list feature.
> + * @supports_sdio_irq: allow SD I/O card to interrupt the host
>   * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
>   */
>  struct variant_data {
> @@ -376,6 +377,7 @@ struct variant_data {
>         u32                     start_err;
>         u32                     opendrain;
>         u8                      dma_lli:1;
> +       bool                    supports_sdio_irq;
>         u32                     stm32_idmabsize_mask;
>         u32                     stm32_idmabsize_align;
>         void (*init)(struct mmci_host *host);
> @@ -400,6 +402,8 @@ struct mmci_host_ops {
>         bool (*busy_complete)(struct mmci_host *host, struct mmc_command *cmd, u32 status, u32 err_msk);
>         void (*pre_sig_volt_switch)(struct mmci_host *host);
>         int (*post_sig_volt_switch)(struct mmci_host *host, struct mmc_ios *ios);
> +       void (*enable_sdio_irq)(struct mmci_host *host, int enable);
> +       void (*sdio_irq)(struct mmci_host *host, u32 status);
>  };
>
>  struct mmci_host {
> @@ -481,6 +485,9 @@ void mmci_dmae_finalize(struct mmci_host *host, struct mmc_data *data);
>  void mmci_dmae_error(struct mmci_host *host);
>  #endif
>
> +void ux500_and_stm32_enable_sdio_irq(struct mmci_host *host, int enable);
> +void ux500_and_stm32_sdio_irq(struct mmci_host *host, u32 status);
> +
>  #ifdef CONFIG_MMC_QCOM_DML
>  void qcom_variant_init(struct mmci_host *host);
>  #else
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 35067e1e6cd80..fbfaa0bcec51e 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -681,6 +681,8 @@ static struct mmci_host_ops sdmmc_variant_ops = {
>         .busy_complete = sdmmc_busy_complete,
>         .pre_sig_volt_switch = sdmmc_pre_sig_volt_vswitch,
>         .post_sig_volt_switch = sdmmc_post_sig_volt_switch,
> +       .enable_sdio_irq = ux500_and_stm32_enable_sdio_irq,
> +       .sdio_irq = ux500_and_stm32_sdio_irq,
>  };
>
>  static struct sdmmc_tuning_ops dlyb_tuning_mp15_ops = {
> --
> 2.34.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
