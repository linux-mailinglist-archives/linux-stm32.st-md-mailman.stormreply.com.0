Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D1CB47B
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 08:29:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66664C36B0B;
	Fri,  4 Oct 2019 06:29:40 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90ADC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 06:29:38 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id j5so1693278uak.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2019 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cHb3TMwEz5+OXW5BLXUPEo0iVNuw/zaJSQ8nudxgUfs=;
 b=Uwjd/yJX/zvBAyGszyOFkHGxGNHPYzrzCZYU0PmR6Q5fH1sYTLP2LrV8rUqHQdILhC
 //17swpcqvTHMY4+a7g3Rj2z1VvmrmgbhwMqIYV6yDI6JbVCVuOkv7CQ6aSbI6NOhRlb
 VBWjjFQ5Nmiroaiap6+rXL/94RjLkw3GBUB9VkIWLnkrhiuwaP3Brj/EfFxSYXq1nAVE
 f6aOM0wju0q4zC7Ce3Astb9/I+2BWy4Txir0vqRryL5+kh27GVdW3u+Sa7PB20jZ6oWs
 ctHyY+MWnyfXXvJNeX3BnvYei6rogQqQEDxluAnuZJmuGnKnhlbD8dhPRdQEuB/wgz9n
 umlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cHb3TMwEz5+OXW5BLXUPEo0iVNuw/zaJSQ8nudxgUfs=;
 b=izslWGPNkA2NfChdht8UBCyQhogFE8HBUUTayBTF9xtg2P9sVSzIJJZ+ECicWpKah8
 Ds0tFE37Nx9/eUuVlaifMTEVPF2tZr3Ar580wSfKJr95aEFF81GpDOSgbFChj+m11buK
 CcNNlr54eFxorj4TnxfxZyM3jcSwDU3DD3fy11KGFowbWV8d0xj1sJrKOxQo/ane9luM
 tqpZlyaq4AZzbJIrH91Tm6WGvOaoBijW327Th6GYGqOD9MuiB2DMokTn0/NGd7Qh9bM1
 zzy+K/0zXyTwanc61wkFlUg+CFfEk7hL65bcyluoU/r+YiW4mbCrlme9/Q5bRdUhLMDr
 HPng==
X-Gm-Message-State: APjAAAV+4tRemy0rP5m5Cc0uUM9X1UhEal1KP+/kJGDxjuYh2l8j1Izd
 KLBeTqsprKekzZsVgL3+1svd6AMpjSB9M2GrPYxVRA==
X-Google-Smtp-Source: APXvYqz6daR9aHVc9S81jmd9/IFtYSbtxQdmea7YqFH+8nFRj86tzklqTbvvwLZy2tpZ0Dhc9hS5mF/g7d507FyWhH0=
X-Received: by 2002:ab0:6190:: with SMTP id h16mr5010959uan.129.1570170577595; 
 Thu, 03 Oct 2019 23:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190905122112.29672-1-ludovic.Barre@st.com>
 <20190905122112.29672-3-ludovic.Barre@st.com>
In-Reply-To: <20190905122112.29672-3-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Oct 2019 08:29:01 +0200
Message-ID: <CAPDyKFpWun8kEo00gfvx3b1W18HWQkaG2nQuvq2YiTWYUP2Maw@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V6 2/3] mmc: mmci: add busy_complete
	callback
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

On Thu, 5 Sep 2019 at 14:22, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> This patch adds busy_completion callback at mmci_host_ops
> to allow to define a specific busy completion by variant.
>
> The legacy code corresponding to busy completion used
> by ux500 variants is moved to ux500_busy_complete function.
>
> The busy_detect boolean property is replaced by
> busy_complete callback definition.

At this point I prefer to keep th busy_detect boolean property. It
makes the code a bit more consistent.

Although, I think in case busy_detect is set for the variant, the
variant also needs to assign the new ->busy_completion() callback. In
other words, we don't need to check for a valid callback in code if
busy_detect is set.

Otherwise, this looks good to me!

Kind regards
Uffe

>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 142 +++++++++++++++++++++-------------------
>  drivers/mmc/host/mmci.h |   3 +-
>  2 files changed, 76 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index c30319255dc2..e20164f4354d 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -44,6 +44,7 @@
>  #define DRIVER_NAME "mmci-pl18x"
>
>  static void mmci_variant_init(struct mmci_host *host);
> +static void ux500_variant_init(struct mmci_host *host);
>  static void ux500v2_variant_init(struct mmci_host *host);
>
>  static unsigned int fmax = 515633;
> @@ -175,7 +176,6 @@ static struct variant_data variant_ux500 = {
>         .f_max                  = 100000000,
>         .signal_direction       = true,
>         .pwrreg_clkgate         = true,
> -       .busy_detect            = true,
>         .busy_dpsm_flag         = MCI_DPSM_ST_BUSYMODE,
>         .busy_detect_flag       = MCI_ST_CARDBUSY,
>         .busy_detect_mask       = MCI_ST_BUSYENDMASK,
> @@ -184,7 +184,7 @@ static struct variant_data variant_ux500 = {
>         .irq_pio_mask           = MCI_IRQ_PIO_MASK,
>         .start_err              = MCI_STARTBITERR,
>         .opendrain              = MCI_OD,
> -       .init                   = mmci_variant_init,
> +       .init                   = ux500_variant_init,
>  };
>
>  static struct variant_data variant_ux500v2 = {
> @@ -208,7 +208,6 @@ static struct variant_data variant_ux500v2 = {
>         .f_max                  = 100000000,
>         .signal_direction       = true,
>         .pwrreg_clkgate         = true,
> -       .busy_detect            = true,
>         .busy_dpsm_flag         = MCI_DPSM_ST_BUSYMODE,
>         .busy_detect_flag       = MCI_ST_CARDBUSY,
>         .busy_detect_mask       = MCI_ST_BUSYENDMASK,
> @@ -610,6 +609,67 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
>         return MCI_DPSM_ENABLE | (host->data->blksz << 16);
>  }
>
> +static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
> +{
> +       void __iomem *base = host->base;
> +
> +       /*
> +        * Before unmasking for the busy end IRQ, confirm that the
> +        * command was sent successfully. To keep track of having a
> +        * command in-progress, waiting for busy signaling to end,
> +        * store the status in host->busy_status.
> +        *
> +        * Note that, the card may need a couple of clock cycles before
> +        * it starts signaling busy on DAT0, hence re-read the
> +        * MMCISTATUS register here, to allow the busy bit to be set.
> +        * Potentially we may even need to poll the register for a
> +        * while, to allow it to be set, but tests indicates that it
> +        * isn't needed.
> +        */
> +       if (!host->busy_status && !(status & err_msk) &&
> +           (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
> +               writel(readl(base + MMCIMASK0) |
> +                      host->variant->busy_detect_mask,
> +                      base + MMCIMASK0);
> +
> +               host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +               return false;
> +       }
> +
> +       /*
> +        * If there is a command in-progress that has been successfully
> +        * sent, then bail out if busy status is set and wait for the
> +        * busy end IRQ.
> +        *
> +        * Note that, the HW triggers an IRQ on both edges while
> +        * monitoring DAT0 for busy completion, but there is only one
> +        * status bit in MMCISTATUS for the busy state. Therefore
> +        * both the start and the end interrupts needs to be cleared,
> +        * one after the other. So, clear the busy start IRQ here.
> +        */
> +       if (host->busy_status &&
> +           (status & host->variant->busy_detect_flag)) {
> +               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +               return false;
> +       }
> +
> +       /*
> +        * If there is a command in-progress that has been successfully
> +        * sent and the busy bit isn't set, it means we have received
> +        * the busy end IRQ. Clear and mask the IRQ, then continue to
> +        * process the command.
> +        */
> +       if (host->busy_status) {
> +               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +
> +               writel(readl(base + MMCIMASK0) &
> +                      ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +               host->busy_status = 0;
> +       }
> +
> +       return true;
> +}
> +
>  /*
>   * All the DMA operation mode stuff goes inside this ifdef.
>   * This assumes that you have a generic DMA device interface,
> @@ -953,9 +1013,16 @@ void mmci_variant_init(struct mmci_host *host)
>         host->ops = &mmci_variant_ops;
>  }
>
> +void ux500_variant_init(struct mmci_host *host)
> +{
> +       host->ops = &mmci_variant_ops;
> +       host->ops->busy_complete = ux500_busy_complete;
> +}
> +
>  void ux500v2_variant_init(struct mmci_host *host)
>  {
>         host->ops = &mmci_variant_ops;
> +       host->ops->busy_complete = ux500_busy_complete;
>         host->ops->get_datactrl_cfg = ux500v2_get_dctrl_cfg;
>  }
>
> @@ -1235,68 +1302,9 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>                 return;
>
>         /* Handle busy detection on DAT0 if the variant supports it. */
> -       if (busy_resp && host->variant->busy_detect) {
> -
> -               /*
> -                * Before unmasking for the busy end IRQ, confirm that the
> -                * command was sent successfully. To keep track of having a
> -                * command in-progress, waiting for busy signaling to end,
> -                * store the status in host->busy_status.
> -                *
> -                * Note that, the card may need a couple of clock cycles before
> -                * it starts signaling busy on DAT0, hence re-read the
> -                * MMCISTATUS register here, to allow the busy bit to be set.
> -                * Potentially we may even need to poll the register for a
> -                * while, to allow it to be set, but tests indicates that it
> -                * isn't needed.
> -                */
> -               if (!host->busy_status && !(status & err_msk) &&
> -                   (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
> -
> -                       writel(readl(base + MMCIMASK0) |
> -                              host->variant->busy_detect_mask,
> -                              base + MMCIMASK0);
> -
> -                       host->busy_status =
> -                               status & (MCI_CMDSENT|MCI_CMDRESPEND);
> -                       return;
> -               }
> -
> -               /*
> -                * If there is a command in-progress that has been successfully
> -                * sent, then bail out if busy status is set and wait for the
> -                * busy end IRQ.
> -                *
> -                * Note that, the HW triggers an IRQ on both edges while
> -                * monitoring DAT0 for busy completion, but there is only one
> -                * status bit in MMCISTATUS for the busy state. Therefore
> -                * both the start and the end interrupts needs to be cleared,
> -                * one after the other. So, clear the busy start IRQ here.
> -                */
> -               if (host->busy_status &&
> -                   (status & host->variant->busy_detect_flag)) {
> -                       writel(host->variant->busy_detect_mask,
> -                              host->base + MMCICLEAR);
> +       if (busy_resp && host->ops->busy_complete)
> +               if (!host->ops->busy_complete(host, status, err_msk))
>                         return;
> -               }
> -
> -               /*
> -                * If there is a command in-progress that has been successfully
> -                * sent and the busy bit isn't set, it means we have received
> -                * the busy end IRQ. Clear and mask the IRQ, then continue to
> -                * process the command.
> -                */
> -               if (host->busy_status) {
> -
> -                       writel(host->variant->busy_detect_mask,
> -                              host->base + MMCICLEAR);
> -
> -                       writel(readl(base + MMCIMASK0) &
> -                              ~host->variant->busy_detect_mask,
> -                              base + MMCIMASK0);
> -                       host->busy_status = 0;
> -               }
> -       }
>
>         host->cmd = NULL;
>
> @@ -1537,7 +1545,7 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>                  * clear the corresponding IRQ.
>                  */
>                 status &= readl(host->base + MMCIMASK0);
> -               if (host->variant->busy_detect)
> +               if (host->ops->busy_complete)
>                         writel(status & ~host->variant->busy_detect_mask,
>                                host->base + MMCICLEAR);
>                 else
> @@ -1605,7 +1613,7 @@ static void mmci_set_max_busy_timeout(struct mmc_host *mmc)
>         struct mmci_host *host = mmc_priv(mmc);
>         u32 max_busy_timeout = 0;
>
> -       if (!host->variant->busy_detect)
> +       if (!host->ops->busy_complete)
>                 return;
>
>         if (host->variant->busy_timeout && mmc->actual_clock)
> @@ -1980,7 +1988,7 @@ static int mmci_probe(struct amba_device *dev,
>         /*
>          * Enable busy detection.
>          */
> -       if (variant->busy_detect) {
> +       if (host->ops->busy_complete) {
>                 mmci_ops.card_busy = mmci_card_busy;
>                 /*
>                  * Not all variants have a flag to enable busy detection
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index d8b7f6774e8f..733f9a035b06 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -286,7 +286,6 @@ struct mmci_host;
>   * @f_max: maximum clk frequency supported by the controller.
>   * @signal_direction: input/out direction of bus signals can be indicated
>   * @pwrreg_clkgate: MMCIPOWER register must be used to gate the clock
> - * @busy_detect: true if the variant supports busy detection on DAT0.
>   * @busy_timeout: true if the variant starts data timer when the DPSM
>   *               enter in Wait_R or Busy state.
>   * @busy_dpsm_flag: bitmask enabling busy detection in the DPSM
> @@ -334,7 +333,6 @@ struct variant_data {
>         u32                     f_max;
>         u8                      signal_direction:1;
>         u8                      pwrreg_clkgate:1;
> -       u8                      busy_detect:1;
>         u8                      busy_timeout:1;
>         u32                     busy_dpsm_flag;
>         u32                     busy_detect_flag;
> @@ -369,6 +367,7 @@ struct mmci_host_ops {
>         void (*dma_error)(struct mmci_host *host);
>         void (*set_clkreg)(struct mmci_host *host, unsigned int desired);
>         void (*set_pwrreg)(struct mmci_host *host, unsigned int pwr);
> +       bool (*busy_complete)(struct mmci_host *host, u32 status, u32 err_msk);
>  };
>
>  struct mmci_host {
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
