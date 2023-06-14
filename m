Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62772FE35
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 14:17:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22126C6A61A;
	Wed, 14 Jun 2023 12:17:26 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37FF1C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:17:24 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-bd744ffc263so541104276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 05:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686745043; x=1689337043;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wiBlA+RDlH7R4OggHRWKj7Fxop5IItuK1n0fHDx4yHw=;
 b=c1l2fM4LaNmiHUX81AtW3b2A9JMGlFrJ8LxfZqVmmIWd1EBd1qDMYcDRFvGu/xnAQO
 dY37C0gCffbk6ulsMYXviKhf+nHrdxufHf+QBIzc15hf+ccSEHPZ3NFEgxTui6DBcqZY
 J0PqE9NHUt+XgDK5whgt6k0w0VdN3hsWBAoXSQt96ugh9LqenU9Eo2ghgFlyAzmXl0Yk
 dJVKmw7jTiPsnd84pkk/T3d6NvFGdlrkTrFq6cB5CHur598lzR1aVJciqIeIMIqY3GPP
 RkcCsw90F20Xa3c6m1ArBjJO+otmuSFzAvkQDjUTIqjrnr2U+aZGd15Ciqda2bCq5KB+
 efig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686745043; x=1689337043;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiBlA+RDlH7R4OggHRWKj7Fxop5IItuK1n0fHDx4yHw=;
 b=KJwD/PkmeV5qtXkGzD5kXnskR6brEvl04RrZDF2nZOKjIIDvrdQNg9q9BD2jvWyhVZ
 FqW7EHt9yLTEooHRgFgImL4bZ7q9AQWFw2PonoejnZ4VD3I6OVe2Ds0veu8QpnWPsz8w
 quxyoy6RE5OZ9K8CB16W4eDV1rrCDjSsmoBDK3FtoROuKk4lL9WF+y7ig71VKYkizSEh
 SoLF6aLY0wr5pu2Fq9MjsCdoEwlE1i40rOBRtOkpwCipmNpdndW0e7oC/bahRdV5c9f6
 9GZ6unUKS/BxG3W6pm2FDDBHc0oTFkdegMD2Ere5zGdwcf8X0tQodFXNf/dlePEluedL
 3STQ==
X-Gm-Message-State: AC+VfDxvgtR+GaWyNzHaHJLuuet2IpINsrvo7brn1p3JBY8QxutrpVxf
 OZ3Q031jbPNspz+3pG2ImCnmNDolK+LsU96cP91QVQ==
X-Google-Smtp-Source: ACHHUZ5K7H9WPjQtqp24pEfxQtv8IPUZVJcyYIGqu0TLM/IkZzUn4XE/SMePAeC2AkTEc8wkcC21yhJ8fp8elq8xy1w=
X-Received: by 2002:a81:6654:0:b0:56d:d58:82b7 with SMTP id
 a81-20020a816654000000b0056d0d5882b7mr1518242ywc.23.1686745043025; Wed, 14
 Jun 2023 05:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
 <20230405-pl180-busydetect-fix-v4-10-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-10-df9c8c504353@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 14:16:46 +0200
Message-ID: <CAPDyKFrq2doTP-7Pdi3cAUtGy9fhqi9mjDZDEhSAdaEd_y+YpA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 10/10] mmc: mmci: Add busydetect timeout
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

On Tue, 13 Jun 2023 at 22:34, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Add a timeout for busydetect IRQs using a delayed work.
> It might happen (and does happen) on Ux500 that the first
> busy detect IRQ appears and not the second one. This will
> make the host hang indefinitely waiting for the second
> IRQ to appear.
>
> Calculate the busy timeout unconditionally in
> mmci_start_command() using the code developed for STM32
> and use this as a timeout for the command.
>
> This makes the eMMC work again on Skomer.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Use the calculated command busy timeout from the core
>   or the same calculated default as for STM32.
> ChangeLog v2->v3:
> - Rebased.
> ChangeLog v1->v2:
> - No changes
> ---
>  drivers/mmc/host/mmci.c | 30 +++++++++++++++++++++++++++---
>  drivers/mmc/host/mmci.h |  1 +
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 478f71dc7f34..12df1c231177 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -37,6 +37,7 @@
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/div64.h>
>  #include <asm/io.h>
> @@ -740,6 +741,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                         host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
>                         writel(host->variant->busy_detect_mask, base + MMCICLEAR);
>                         host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;

Shouldn't we schedule the work at the point when we move to
MMCI_BUSY_WAITING_FOR_START_IRQ instead?

At least, it's from that point in time that we detect that the card
signals busy. Moreover, at least theoretically, we could end up
hanging/waiting for the busy start irq too, right?

> +                       schedule_delayed_work(&host->busy_timeout_work,
> +                                             msecs_to_jiffies(host->cmd->busy_timeout));
>                 } else {
>                         dev_dbg(mmc_dev(host->mmc),
>                                 "lost busy status when waiting for busy start IRQ\n");
> @@ -751,6 +754,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                 if (status & host->variant->busy_detect_flag) {
>                         host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
>                         writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       cancel_delayed_work_sync(&host->busy_timeout_work);
>                         ux500_busy_clear_mask_done(host);
>                 } else {
>                         dev_dbg(mmc_dev(host->mmc),
> @@ -1295,10 +1299,11 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>         host->busy_status = 0;
>         host->busy_state = MMCI_BUSY_DONE;
>
> -       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
> -               if (!cmd->busy_timeout)
> -                       cmd->busy_timeout = 10 * MSEC_PER_SEC;
> +       /* Assign a default timeout if the core does not provide one */
> +       if (!cmd->busy_timeout)
> +               cmd->busy_timeout = 10 * MSEC_PER_SEC;
>
> +       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
>                 if (cmd->busy_timeout > host->mmc->max_busy_timeout)
>                         clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
>                 else
> @@ -1486,6 +1491,22 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>         }
>  }
>
> +/*
> + * This busy timeout worker is used to "kick" the command IRQ if a
> + * busy detect IRQ fails to appear in reasonable time. Only used on
> + * variants with busy detection IRQ delivery.
> + */
> +static void busy_timeout_work(struct work_struct *work)

In a way to try to be consistent with naming functions, perhaps add
the prefix "ux500_*?

> +{
> +       struct mmci_host *host =
> +               container_of(work, struct mmci_host, busy_timeout_work.work);
> +       u32 status;
> +
> +       dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy IRQ\n");
> +       status = readl(host->base + MMCISTATUS);
> +       mmci_cmd_irq(host, host->cmd, status);
> +}
> +
>  static int mmci_get_rx_fifocnt(struct mmci_host *host, u32 status, int remain)
>  {
>         return remain - (readl(host->base + MMCIFIFOCNT) << 2);
> @@ -2299,6 +2320,9 @@ static int mmci_probe(struct amba_device *dev,
>                         goto clk_disable;
>         }
>
> +       if (host->variant->busy_detect && host->ops->busy_complete)

The ->busy_detect bool, mandates the ->busy_complete() callback. There
is no need to check for it too.

> +               INIT_DELAYED_WORK(&host->busy_timeout_work, busy_timeout_work);
> +
>         writel(MCI_IRQENABLE | variant->start_err, host->base + MMCIMASK0);
>
>         amba_set_drvdata(dev, mmc);
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 12a7bbd3ce26..95d3d0a6049b 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -451,6 +451,7 @@ struct mmci_host {
>         void                    *dma_priv;
>
>         s32                     next_cookie;
> +       struct delayed_work     busy_timeout_work;
>  };
>
>  #define dma_inprogress(host)   ((host)->dma_in_progress)
>

Other than the above, I am still not convinced that we don't have a
locking issue, as we discussed for the previous version. However,
let's continue that discussion in the other thread, separately.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
