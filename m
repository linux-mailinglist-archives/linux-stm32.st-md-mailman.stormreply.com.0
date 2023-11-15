Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3447EC7D6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 16:51:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0C9EC6C837;
	Wed, 15 Nov 2023 15:51:58 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 551C0C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 15:51:57 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-daf26d84100so5557677276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700063516; x=1700668316;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b5je3CHo1tuObxFhsj7HCVNtEJLqQI+QRpnvtFQU188=;
 b=lDYHJS0Ww1ImQqxzmYgFTDt0ZeZ37oRKYQMEO4rQTqOGd3EQlBBZtH5vKgH7DOYJXB
 lZb8Ay+lbBnfAhnmoDYTafpwJ22lz2miep9lq8ItUP3s8UvUI2Put4HOJkTux0OKfN95
 hbdmVCetkFGzIVigEB//sx0o2qsxUXT/eHhoJa/XqLmvCCsd8UWEx9MzQszGRM3OotkG
 3WC2JFOkx/qayUBA5YBhJEGCC0cspjZsV+Me2YH9P8Bndvz4jJ99r+jMJwS2tTQosFE8
 jLluRnesuzlN+u+Sqef4TtcwAHLAuwt9M85ameJ/Dsu2FNQRcpgEgdZx9kZyJB5Btsot
 vnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700063516; x=1700668316;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5je3CHo1tuObxFhsj7HCVNtEJLqQI+QRpnvtFQU188=;
 b=UiWLmJVpGww5VEciGSJVEC1sqbkg4gfNvlE9oYsAgx5krQz7iRwSpM2u3FY8vc+/Oz
 5rTgAqpmoKMXdmee7qUdh2u8tuQsxujkOA8smoiL8ZwylnKDKsOmXISKdfNFmWRWN3Ye
 tiIeK8xxjGnWOcb6y5IFEEFw6qyzBJznyu2ySNd7WR3xAR3oeseY/xuoiO4NnItnt18O
 4FSLda8emXViXwZOtlM/aotWn93o4OResGscevUVg2Mzc0G1qIA03fqO7HdIu+p3+0T0
 ES3frqDrLtvHY+5VDjGLSx1YD9ljXSZSo64c9R57jhS9jJOxssG5Vx07MLg0kJUJa7iT
 r0MQ==
X-Gm-Message-State: AOJu0YwdbKC9xCN5KzfEkxofF21KwUkCnJybybXPfr9ORStixeLK+qoy
 k/+OFhP4Rm4gXioOfVEZvhtsviRv0+M3wD1CjnTFMg==
X-Google-Smtp-Source: AGHT+IFzzO3NZ/5bQpxO81qmz5mqu7aqHq/qjLLklbYg9lW1M5RYGuiD7psN6OQiO7cBfDSq3hrdkp3jL3Z6I8OLrsU=
X-Received: by 2002:a25:687:0:b0:daf:81e5:d2fa with SMTP id
 129-20020a250687000000b00daf81e5d2famr9742559ybg.33.1700063516075; Wed, 15
 Nov 2023 07:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20231108141637.119497-1-yann.gautier@foss.st.com>
In-Reply-To: <20231108141637.119497-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Nov 2023 16:51:20 +0100
Message-ID: <CAPDyKFqJbrNQXqb4+ZLE1L+C8hxGRCuwVgPoGMu1she3+pMzrQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Yang Yingliang <yangyingliang@huawei.com>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Subject: Re: [Linux-stm32] [PATCH v3] mmc: mmci: stm32: add SDIO in-band
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

On Wed, 8 Nov 2023 at 15:18, Yann Gautier <yann.gautier@foss.st.com> wrote:
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

Applied for next, thanks!

Kind regards
Uffe


> ---
> Updates on v3:
> * remove variant ops enable_sdio_irq & sdio_irq and use common
> functions (mmci_write_sdio_irq_bit() & mmci_signal_sdio_irq())
> * enable datactrl_mask_sdio during probe if relevant and keep it
> enabled in mmci_write_datactrlreg().
>
> Updates on v2:
> * rename use_sdio_irq to supports_sdio_irq and change it to bool
> * use common code for ux500 and stm32 variants
>
> ---
>  drivers/mmc/host/mmci.c | 69 +++++++++++++++++++++++++++++++++++++++--
>  drivers/mmc/host/mmci.h |  2 ++
>  2 files changed, 69 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index e967cca7a16f..b790c3c3c8f9 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -273,6 +273,7 @@ static struct variant_data variant_stm32_sdmmc = {
>         .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(12, 5),
>         .stm32_idmabsize_align  = BIT(5),
> +       .supports_sdio_irq      = true,
>         .busy_timeout           = true,
>         .busy_detect            = true,
>         .busy_detect_flag       = MCI_STM32_BUSYD0,
> @@ -300,6 +301,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
>         .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(16, 5),
>         .stm32_idmabsize_align  = BIT(5),
> +       .supports_sdio_irq      = true,
>         .dma_lli                = true,
>         .busy_timeout           = true,
>         .busy_detect            = true,
> @@ -328,6 +330,7 @@ static struct variant_data variant_stm32_sdmmcv3 = {
>         .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(16, 6),
>         .stm32_idmabsize_align  = BIT(6),
> +       .supports_sdio_irq      = true,
>         .dma_lli                = true,
>         .busy_timeout           = true,
>         .busy_detect            = true,
> @@ -421,8 +424,9 @@ void mmci_write_pwrreg(struct mmci_host *host, u32 pwr)
>   */
>  static void mmci_write_datactrlreg(struct mmci_host *host, u32 datactrl)
>  {
> -       /* Keep busy mode in DPSM if enabled */
> -       datactrl |= host->datactrl_reg & host->variant->busy_dpsm_flag;
> +       /* Keep busy mode in DPSM and SDIO mask if enabled */
> +       datactrl |= host->datactrl_reg & (host->variant->busy_dpsm_flag |
> +                                         host->variant->datactrl_mask_sdio);
>
>         if (host->datactrl_reg != datactrl) {
>                 host->datactrl_reg = datactrl;
> @@ -1762,6 +1766,25 @@ static irqreturn_t mmci_pio_irq(int irq, void *dev_id)
>         return IRQ_HANDLED;
>  }
>
> +static void mmci_write_sdio_irq_bit(struct mmci_host *host, int enable)
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
> +static void mmci_signal_sdio_irq(struct mmci_host *host, u32 status)
> +{
> +       if (status & MCI_ST_SDIOIT) {
> +               mmci_write_sdio_irq_bit(host, 0);
> +               sdio_signal_irq(host->mmc);
> +       }
> +}
> +
>  /*
>   * Handle completion of command and data transfers.
>   */
> @@ -1806,6 +1829,9 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>                         mmci_data_irq(host, host->data, status);
>                 }
>
> +               if (host->variant->supports_sdio_irq)
> +                       mmci_signal_sdio_irq(host, status);
> +
>                 /*
>                  * Busy detection has been handled by mmci_cmd_irq() above.
>                  * Clear the status bit to prevent polling in IRQ context.
> @@ -2042,6 +2068,35 @@ static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>         return ret;
>  }
>
> +static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
> +{
> +       struct mmci_host *host = mmc_priv(mmc);
> +       unsigned long flags;
> +
> +       if (enable)
> +               /* Keep the SDIO mode bit if SDIO irqs are enabled */
> +               pm_runtime_get_sync(mmc_dev(mmc));
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       mmci_write_sdio_irq_bit(host, enable);
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +       if (!enable) {
> +               pm_runtime_mark_last_busy(mmc_dev(mmc));
> +               pm_runtime_put_autosuspend(mmc_dev(mmc));
> +       }
> +}
> +
> +static void mmci_ack_sdio_irq(struct mmc_host *mmc)
> +{
> +       struct mmci_host *host = mmc_priv(mmc);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       mmci_write_sdio_irq_bit(host, 1);
> +       spin_unlock_irqrestore(&host->lock, flags);
> +}
> +
>  static struct mmc_host_ops mmci_ops = {
>         .request        = mmci_request,
>         .pre_req        = mmci_pre_request,
> @@ -2317,6 +2372,16 @@ static int mmci_probe(struct amba_device *dev,
>                 mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
>         }
>
> +       if (variant->supports_sdio_irq && host->mmc->caps & MMC_CAP_SDIO_IRQ) {
> +               mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
> +
> +               mmci_ops.enable_sdio_irq = mmci_enable_sdio_irq;
> +               mmci_ops.ack_sdio_irq   = mmci_ack_sdio_irq;
> +
> +               mmci_write_datactrlreg(host,
> +                                      host->variant->datactrl_mask_sdio);
> +       }
> +
>         /* Variants with mandatory busy timeout in HW needs R1B responses. */
>         if (variant->busy_timeout)
>                 mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 34d9897c289b..a5eb4ced4d5d 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -331,6 +331,7 @@ enum mmci_busy_state {
>   *            register.
>   * @opendrain: bitmask identifying the OPENDRAIN bit inside MMCIPOWER register
>   * @dma_lli: true if variant has dma link list feature.
> + * @supports_sdio_irq: allow SD I/O card to interrupt the host
>   * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
>   * @dma_flow_controller: use peripheral as flow controller for DMA.
>   */
> @@ -377,6 +378,7 @@ struct variant_data {
>         u32                     start_err;
>         u32                     opendrain;
>         u8                      dma_lli:1;
> +       bool                    supports_sdio_irq;
>         u32                     stm32_idmabsize_mask;
>         u32                     stm32_idmabsize_align;
>         bool                    dma_flow_controller;
> --
> 2.34.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
