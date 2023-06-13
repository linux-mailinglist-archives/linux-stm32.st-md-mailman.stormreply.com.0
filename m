Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A372E27E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 14:08:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92018C6A61A;
	Tue, 13 Jun 2023 12:08:30 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9199BC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:08:27 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-56ce53c0040so37660777b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 05:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686658106; x=1689250106;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ArJBZBiSCycQL9sHnvzcinYezPRGuB1JNtNlNcpo7ME=;
 b=RpUixOH0iJeRceB0M89qFmTJXKjgHynLZhyf0F5CqKC9lkNqlWyb5YuRHF/Tp3LyxM
 NqHa3ukNQbCaVH3BCiPpo1epxqUJsf3uyyTfQOXTlDZ+AYe8JGGku/BaQInuNIE5Ry/o
 PTRuBMpEiOy2JU5jCeIM9bobweVJJ2eCbBH+rTnln3cddBwsLjODVIS7iTG92iP8wmUG
 bH+me40jLYRBfVWwNFsWMS7L1vQWXw6z8cfF8GUyCJp4pB94nJkwNXqd29mxdISqbCEf
 xsc8CyafR8Vm1EcOWOU9uj4ykcBmqRbyF8UUiJw4ds7/hjoD+U4HWuAmrWzZjRlLu0xa
 LeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686658106; x=1689250106;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ArJBZBiSCycQL9sHnvzcinYezPRGuB1JNtNlNcpo7ME=;
 b=gZ5mr2CU7HjQZzDKeS1z/rHB9/rPAoydpeJPavc1UE7oSol38itDFWtsRJEh266TY3
 YmvV01OydSuPztlu9PfcHr2AFQiIkPPQ4QpsvQkbUNsMHusc1I0Ad4lm72beSnPJxBnK
 Yd5jFswSEeLDFggcvvLKA0ztCpqfHhNVsHlX2rCGehnUw/0ev+Sj8i9Z5gS06xtf/mIa
 w9lHLCVGXdVk0zT5uRdB3IfEbvA1RAKz6RV6JYyalxFNXmUnPCKC3s4PpyQiW0YJcda1
 ERuFbDLK3bHa93SUJaJ1jLEJXh/VKmhfqp9nKIY2+k2G5jvuwXD/1/PImIJZIoK2jgih
 Xj/A==
X-Gm-Message-State: AC+VfDzIQESgxjmUGjHKiN4Mwn6lNeE2kh8EMOrwSGHzaNl7D8iQPUlX
 RY7KQ2VYCzNolkQ+TO6s443K9fklV92Wm76VP7PUoQ==
X-Google-Smtp-Source: ACHHUZ67DWmIIo0zbOpvhIaW6gPil6QfFopK0/7D1kWR4Z3TSN/H/b7MWJmvhOr0752Bk9+2D/q0c9+61pXg0Tv/PTM=
X-Received: by 2002:a25:b181:0:b0:bcb:7428:789 with SMTP id
 h1-20020a25b181000000b00bcb74280789mr1278679ybj.64.1686658106113; Tue, 13 Jun
 2023 05:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Jun 2023 14:07:50 +0200
Message-ID: <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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

On Sun, 11 Jun 2023 at 21:41, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Add a timeout for busydetect IRQs using a delayed work.
> It might happen (and does happen) on Ux500 that the first
> busy detect IRQ appears and not the second one. This will
> make the host hang indefinitely waiting for the second
> IRQ to appear.
>
> Fire a delayed work after 10ms and re-engage the command
> IRQ so the transaction finishes: we are certainly done
> at this point, or we will catch an error in the status
> register.

A fixed value of 10ms doesn't work. We have lots of commands that are
associated with way longer timeouts than this.

Typically, the cmd->busy_timeout contains the current value of the
timeout that should be used for the commands that have the flags
MMC_RSP_BUSY set for it.

The stm variant already uses cmd->busy_timeout, but also assigns a
default timeout, just to make sure if the core has failed to set
cmd->busy_timeout (it shouldn't but who knows).

A few more more comments to code, see below.

>
> This makes the eMMC work again on Skomer.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebased.
> ChangeLog v1->v2:
> - No changes
> ---
>  drivers/mmc/host/mmci.c | 23 +++++++++++++++++++++++
>  drivers/mmc/host/mmci.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 05b8fad26c10..7e40b8f2dbf3 100644
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
> @@ -741,6 +742,8 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                         host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
>                         writel(host->variant->busy_detect_mask, base + MMCICLEAR);
>                         host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
> +                       schedule_delayed_work(&host->busy_timeout_work,
> +                                             msecs_to_jiffies(10));
>                 } else {
>                         dev_dbg(mmc_dev(host->mmc),
>                                 "lost busy status when waiting for busy start IRQ\n");
> @@ -752,6 +755,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                 if (status & host->variant->busy_detect_flag) {
>                         host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
>                         writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       cancel_delayed_work_sync(&host->busy_timeout_work);
>                         ux500_busy_clear_mask_done(host);
>                 } else {
>                         dev_dbg(mmc_dev(host->mmc),
> @@ -1487,6 +1491,22 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>         }
>  }
>
> +/*
> + * This busy timeout worker is used to "kick" the command IRQ if a
> + * busy detect IRQ fails to appear in reasonable time. Only used on
> + * variants with busy detection IRQ delivery.
> + */
> +static void busy_timeout_work(struct work_struct *work)
> +{
> +       struct mmci_host *host =
> +               container_of(work, struct mmci_host, busy_timeout_work.work);
> +       u32 status;
> +
> +       dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy IRQ\n");
> +       status = readl(host->base + MMCISTATUS);
> +       mmci_cmd_irq(host, host->cmd, status);

There's no locking here. I assume that's because we call
cancel_delayed_work_sync() from an atomic context and we don't want
that to hang.

However, can't the call to mmci_cmd_irq() race with a proper irq being
managed in parallel?

> +}
> +
>  static int mmci_get_rx_fifocnt(struct mmci_host *host, u32 status, int remain)
>  {
>         return remain - (readl(host->base + MMCIFIFOCNT) << 2);
> @@ -2300,6 +2320,9 @@ static int mmci_probe(struct amba_device *dev,
>                         goto clk_disable;
>         }
>
> +       if (host->variant->busy_detect && host->ops->busy_complete)
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

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
