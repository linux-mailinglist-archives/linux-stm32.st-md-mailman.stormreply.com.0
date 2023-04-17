Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BCF6E4BC3
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 16:45:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08091C6A5FA;
	Mon, 17 Apr 2023 14:45:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2583C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 14:45:18 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-54c0c86a436so539505867b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681742717; x=1684334717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4FzwEmXCbLWkDqPKTIh/nkoj4HCKQ0guZR5zz+6K+8=;
 b=UAt8CkCWKymPJxTMqsOXGGIqQPoR9Gv1LM0ejR0A4FCOlvgWZy8ZJH1j4h9I82XGFb
 XU6coHvaKbwHU5tIJ7ya3KyCYve5k6G/yFUoN4Ewe2JNKgS2M8Ym1pdXxk4h1iQDO/tN
 qvXvLWSA1rTLyRId5BtxQBrhF6DtqqLaO/CwBqoi4FUk+UOIXqgVNOeTxiHwxAx2GLwk
 z2OuC2K2xNXxWy2x2K03rOSVfD4eb/I2rQ/t9Xkv3MGCjIBxYiLCdxY9RHKEgNY5qh+q
 ntC+QJvnAsYIyjbCGOztQVzQStOU6ePp3T9uLN2JuNNJ56fb3tBGpK1yHK0mFfTszukJ
 B68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681742717; x=1684334717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4FzwEmXCbLWkDqPKTIh/nkoj4HCKQ0guZR5zz+6K+8=;
 b=k3c8PkNBxNYLW6zAOMstslrjBoz6JPK1r8l3hZL3+2zElRXVj/Mbb+0ywYxZ9mS2hP
 ukSJexjE8h7NDDiFXOquc2RsP6dHaYHrpFwgmDhStQAV1cI8ZBT9iLVwWbPRB6J0fwOV
 VWgS/b/F/vXoxXWI8JmpQ3Gr4WO3jRocaTPnmpedObyCEHIzvYux8KHsnql1HYygrV1z
 iYb8HUZGz4uNsUEba4MehuKzlQr4EbR5gy4cCbJH4K3iYgiTOPkbWmvT+jBJOc/PTV1J
 B/clB9eBEnZoddPp4GIyxoVc3dVDf54iS+yma5uMi3gAWrV+OZuV+NVFhbnFK8QpoQ/+
 Q8Ew==
X-Gm-Message-State: AAQBX9d2gyGggNX5Bvllrd/xQnfJpAjCezDCE5Ok3VfA/VKCLDgFb8Sn
 XesSDe1RuJYEglHCkePlpe8z5bwR1TcnKKDj37g5dCQ0t8ah4UjdAds=
X-Google-Smtp-Source: AKy350Y1VOmPkjLQAICiz3zrAWRrax3arHCfhHoshAEA18nmx8Jnxmo4jV8sMGUGj5IOTTm6cYY1fxg5osjZyIOgoo8=
X-Received: by 2002:a81:ac19:0:b0:53c:6fda:835f with SMTP id
 k25-20020a81ac19000000b0053c6fda835fmr9043046ywh.0.1681742717316; Mon, 17 Apr
 2023 07:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
 <20230405-pl180-busydetect-fix-v2-5-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-5-eeb10323b546@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Apr 2023 16:44:41 +0200
Message-ID: <CAPDyKFrdgktJo8=rLCsvTgbY8qyoBqdJQEduV_uHKE5ptZHgsQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 05/12] mmc: mmci: Make busy complete
	state machine explicit
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

On Sun, 9 Apr 2023 at 00:00, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This refactors the ->busy_complete() callback currently
> only used by Ux500 to handle busy detection on hardware
> where one and the same IRQ is fired whether we get a
> start or an end signal on busy detect.

Nitpick: The callback is being used by the mmci_stm32_sdmmc variant too.

>
> The code is currently using the cached status from the
> command IRQ in ->busy_status as a state to select what to
> do next: if this state is non-zero we are waiting for
> IRQs and if it is zero we treat the state as the starting
> point for a busy detect wait cycle.
>
> Make this explicit by creating a state machine where the
> ->busy_complete callback moves between four states:
> MMCI_BUSY_NOT_STARTED, MMCI_BUSY_WAITING_FOR_IRQS,
> MMCI_BUSY_START_IRQ and MMCI_BUSY_END_IRQ.

This makes perfect sense to me too. However, these don't really match
the names of enum types you eventually decided to use.

To be consistent, perhaps it's just easier to drop the actual enum
names from the commit message?

>
> The code currently assumes this order: we enable the busy
> detect IRQ, get a busy start IRQ, then a busy end IRQ, and
> then we clear and mask this IRQ and proceed.
>
> We insert dev_err() prints for unexpected states.
>
> Augment the STM32 driver with similar states for
> completeness.
>
> This works as before on most cards, however on a
> problematic card that is not working with busy detect, and
> which I have been debugging, this happens:
>
> [127220.662719] mmci-pl18x 80005000.mmc: lost busy status
>                 when waiting for busy end IRQ
>
> This probably means that the busy detect start IRQ has
> already occurred when we start executing the
> ->busy_complete() callbacks, and the busy detect end IRQ
> is counted as the start IRQ, and this is what is causing
> the card to not be detected properly.

I agree, this whole thing has been fragile. Your observations seem
reasonable to me too.

>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - No changes
> ---
>  drivers/mmc/host/mmci.c             | 55 +++++++++++++++++++++++++++++++------
>  drivers/mmc/host/mmci.h             | 16 +++++++++++
>  drivers/mmc/host/mmci_stm32_sdmmc.c |  6 +++-
>  3 files changed, 68 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 7d42625f2356..887b83e392a4 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -670,6 +670,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                 writel(host->variant->busy_detect_mask, base + MMCICLEAR);
>                 writel(readl(base + MMCIMASK0) &
>                        ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +               host->busy_state = MMCI_BUSY_DONE;
>                 host->busy_status = 0;
>                 return true;
>         }
> @@ -687,7 +688,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * while, to allow it to be set, but tests indicates that it
>          * isn't needed.
>          */
> -       if (!host->busy_status) {
> +       if (host->busy_state == MMCI_BUSY_IDLE) {
>                 status = readl(base + MMCISTATUS);
>                 if (status & host->variant->busy_detect_flag) {
>                         writel(readl(base + MMCIMASK0) |
> @@ -695,6 +696,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                                base + MMCIMASK0);
>
>                         host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
>                         return false;
>                 }
>         }
> @@ -710,11 +712,40 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * both the start and the end interrupts needs to be cleared,
>          * one after the other. So, clear the busy start IRQ here.
>          */
> -       if (host->busy_status &&
> -           (status & host->variant->busy_detect_flag)) {
> -               host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> -               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> -               return false;
> +       if (host->busy_state == MMCI_BUSY_WAITING_FOR_IRQS) {
> +               if (status & host->variant->busy_detect_flag) {
> +                       host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       host->busy_state = MMCI_BUSY_START_IRQ;
> +                       return false;
> +               } else {
> +                       dev_dbg(mmc_dev(host->mmc),
> +                               "lost busy status when waiting for busy start IRQ\n");
> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       writel(readl(base + MMCIMASK0) &
> +                              ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +                       host->busy_state = MMCI_BUSY_DONE;
> +                       host->busy_status = 0;
> +                       return true;
> +               }
> +       }
> +
> +       if (host->busy_state == MMCI_BUSY_START_IRQ) {
> +               if (status & host->variant->busy_detect_flag) {
> +                       host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       host->busy_state = MMCI_BUSY_END_IRQ;
> +                       return false;
> +               } else {
> +                       dev_dbg(mmc_dev(host->mmc),
> +                               "lost busy status when waiting for busy end IRQ\n");
> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       writel(readl(base + MMCIMASK0) &
> +                              ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +                       host->busy_state = MMCI_BUSY_DONE;
> +                       host->busy_status = 0;
> +                       return true;
> +               }
>         }
>
>         /*
> @@ -723,11 +754,18 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * the busy end IRQ. Clear and mask the IRQ, then continue to
>          * process the command.
>          */
> -       if (host->busy_status) {
> -               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +       if (host->busy_state == MMCI_BUSY_END_IRQ) {
> +               if (status & host->variant->busy_detect_flag) {
> +                       /* We should just get two IRQs for busy detect */
> +                       dev_err(mmc_dev(host->mmc), "spurious busy detect IRQ\n");
> +                       return false;
> +               }
>
> +               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
>                 writel(readl(base + MMCIMASK0) &
>                        ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +
> +               host->busy_state = MMCI_BUSY_DONE;
>                 host->busy_status = 0;
>         }
>
> @@ -1258,6 +1296,7 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>         }
>
>         if (cmd->flags & MMC_RSP_BUSY) {
> +               host->busy_state = MMCI_BUSY_IDLE;
>                 host->busy_status = 0;
>
>                 if (host->variant->busy_timeout) {
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index e1a9b96a3396..82f3850325c8 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -261,6 +261,21 @@ struct clk;
>  struct dma_chan;
>  struct mmci_host;
>
> +/**
> + * enum mmci_busy_state - enumerate the busy detect wait states
> + *
> + * This is used for the state machine waiting for different busy detect
> + * interrupts on hardware that fire a single IRQ for start and end of
> + * the busy detect phase on DAT0.
> + */
> +enum mmci_busy_state {
> +       MMCI_BUSY_IDLE,

This state name is a bit confusing to me. If I understand correctly,
this state means that the sent command has a corresponding busy
signaling that should be checked for, right? Can we perhaps reflect
that in the name somehow?

> +       MMCI_BUSY_WAITING_FOR_IRQS,
> +       MMCI_BUSY_START_IRQ,
> +       MMCI_BUSY_END_IRQ,
> +       MMCI_BUSY_DONE,
> +};
> +
>  /**
>   * struct variant_data - MMCI variant-specific quirks
>   * @clkreg: default value for MCICLOCK register
> @@ -409,6 +424,7 @@ struct mmci_host {
>         u32                     clk_reg;
>         u32                     clk_reg_add;
>         u32                     datactrl_reg;
> +       enum mmci_busy_state    busy_state;
>         u32                     busy_status;
>         u32                     mask1_reg;
>         u8                      vqmmc_enabled:1;
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 60bca78a72b1..24831a1092b2 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -393,8 +393,10 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>         busy_d0 = sdmmc_status & MCI_STM32_BUSYD0;
>
>         /* complete if there is an error or busy_d0end */
> -       if ((status & err_msk) || busy_d0end)
> +       if ((status & err_msk) || busy_d0end) {
> +               host->busy_state = MMCI_BUSY_DONE;
>                 goto complete;
> +       }
>
>         /*
>          * On response the busy signaling is reflected in the BUSYD0 flag.
> @@ -408,6 +410,7 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                         host->busy_status = status &
>                                 (MCI_CMDSENT | MCI_CMDRESPEND);
>                 }
> +               host->busy_state = MMCI_BUSY_END_IRQ;
>                 return false;
>         }
>
> @@ -416,6 +419,7 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                 writel_relaxed(mask & ~host->variant->busy_detect_mask,
>                                base + MMCIMASK0);
>                 host->busy_status = 0;
> +               host->busy_state = MMCI_BUSY_DONE;
>         }
>
>         writel_relaxed(host->variant->busy_detect_mask, base + MMCICLEAR);
>

Overall, I have to admit that I think the code is getting harder to
follow again, even if the end result from the series looks really
nice.

Besides making sure that each step/patch compiles, I am also worried
that we may be breaking things on the way. That said, I wonder if it's
not better to actually squash some of the patches in the series, to
avoid churns - can you please look into that?

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
