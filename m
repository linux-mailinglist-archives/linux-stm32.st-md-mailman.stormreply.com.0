Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2D732DEC
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 12:28:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47FC5C6A610;
	Fri, 16 Jun 2023 10:28:34 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE262C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:28:32 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-56d304e5f83so6275057b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686911312; x=1689503312;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UFBKZNxqmuX+Sqe1P30p47ITzse6yIuxpmhDkKOdXE4=;
 b=sxQDW85XdEH3/LFYNzD0ZN2NWReezT26FBDJdLs79BZ+oeCDtW1mlW6Mw4WpMZ8rxg
 ZXuvbvAYCO4+iqxeC1TKLOigeanG85elCuP/mwTVOOOF+aZ/WfwTeLLop5yUV5N//S9Z
 0ggvNX22b9iWAuFLOtE3JcdmTRHNZsOZg6VC/dxX/7cQXT4JM6q8dVFJzoue3Ky8hB9z
 mhYx50aP9c13LzkR/yqhZGIS1kRe9ep9eVTEfDwiEA8H66YaDZ9u1JDNZnkAzgVw8kx0
 DLz1s+6bPoJ8X7XuEQPrHRx7NPT2SMTsalauSL683ICimTk0tJQstHBBEnAcjPTk9RhZ
 Itow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686911312; x=1689503312;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UFBKZNxqmuX+Sqe1P30p47ITzse6yIuxpmhDkKOdXE4=;
 b=Xfbrq/l5h2pLNWgwhherIWDdBEDcRHkw+2v5E03mie767XRo+QkEYZrZvEIeTpJwgx
 75wL0JqOyiSwwOTrBXa3QUCOTBZVzgcJ/ghTFOqelpqg29RqoLPgs2mYmIEOF1yItnNK
 l/UTcwetyDNkwy55zlnXjbG5RD7qHnOlQ96Q1J+vpBDAAf6Z/pQJSXas23JZdK2RM7Tz
 MXRcZeFTl4XLUFLkVvgbdYkw/YZx/4nXOxmvDy3KX+4+dffI/voD9F/w+19NJLaMxC7S
 iZDR/YH6/F9iX3nG3bc+OMW7mM3Sa1bl9VZIjl7maQEflIz8uk8TIAGR8/kGc47//ZcT
 zknw==
X-Gm-Message-State: AC+VfDzd5K+uom9bMBvzUUOM8RHxjTzRKJfpSOcJwbRYQZIyO08uJVsn
 2nNZ8OXgZMiWpbvdKb5YwDx2+fD4zFrrFVQOS+/C4A==
X-Google-Smtp-Source: ACHHUZ4P/5sZJt2zbkTX5cSoYxr4bfTHJBpJM3KirHpdpQg2/Bg3bGdh+F0r2+3tPlzmjG8XxmjePstXWpLbjGLxSWw=
X-Received: by 2002:a81:c201:0:b0:569:e7cb:cd4e with SMTP id
 z1-20020a81c201000000b00569e7cbcd4emr1383942ywc.48.1686911311664; Fri, 16 Jun
 2023 03:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
 <20230405-pl180-busydetect-fix-v6-5-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-5-b850ec8019f3@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 16 Jun 2023 12:27:55 +0200
Message-ID: <CAPDyKFp=W2wzoQZFVRFfqKmPdMHsoOK-Virp9FhqMj+TxbO9Gw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 5/9] mmc: mmci: Make busy complete
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

On Fri, 16 Jun 2023 at 10:30, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This refactors the ->busy_complete() callback currently
> only used by Ux500 and STM32 to handle busy detection on
> hardware where one and the same IRQ is fired whether we get
> a start or an end signal on busy detect.
>
> The code is currently using the cached status from the
> command IRQ in ->busy_status as a state to select what to
> do next: if this state is non-zero we are waiting for
> IRQs and if it is zero we treat the state as the starting
> point for a busy detect wait cycle.
>
> Make this explicit by creating a state machine where the
> ->busy_complete callback moves between three states.
>
> The Ux500 busy detect code currently assumes this order:
> we enable the busy detect IRQ, get a busy start IRQ, then a
> busy end IRQ, and then we clear and mask this IRQ and
> proceed.
>
> We insert debug prints for unexpected states.
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
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v4->v6:
> - When waiting for the busy end IRQ, what we expect is that
>   the IRQ should trigger right after the busy signal ends, and
>   thus thes busy indication should be de-asserted (low). We
>   invert the logic such that this is what we expect, and
>   the error case is if the busy detect status is still high
>   when we get the busy end IRQ.
> ChangeLog v3->v4:
> - Assign state MMCI_BUSY_DONE outside the if()-clause for
>   the busy detect initialization.
> ChangeLog v2->v3:
> - Drop surplus states and merge IDLE and DONE states into one,
>   we start out DONE. Name states *_WAITING_FOR_* so it is clear
>   what is going on.
> - Rebase on other changes.
> - Reword commit message.
> ChangeLog v1->v2:
> - No changes
> ---
>  drivers/mmc/host/mmci.c             | 55 +++++++++++++++++++++++++------------
>  drivers/mmc/host/mmci.h             | 14 ++++++++++
>  drivers/mmc/host/mmci_stm32_sdmmc.c |  6 +++-
>  3 files changed, 56 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index d632658d9d20..ccfca055f9a1 100644
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
> +       if (host->busy_state == MMCI_BUSY_DONE) {
>                 status = readl(base + MMCISTATUS);
>                 if (status & host->variant->busy_detect_flag) {
>                         writel(readl(base + MMCIMASK0) |
> @@ -695,6 +696,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>                                base + MMCIMASK0);
>
>                         host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
>                         return false;
>                 }
>         }
> @@ -710,25 +712,40 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * both the start and the end interrupts needs to be cleared,
>          * one after the other. So, clear the busy start IRQ here.
>          */
> -       if (host->busy_status &&
> -           (status & host->variant->busy_detect_flag)) {
> -               host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> -               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> -               return false;
> +       if (host->busy_state == MMCI_BUSY_WAITING_FOR_START_IRQ) {
> +               if (status & host->variant->busy_detect_flag) {
> +                       host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
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
>         }
>
> -       /*
> -        * If there is a command in-progress that has been successfully
> -        * sent and the busy bit isn't set, it means we have received
> -        * the busy end IRQ. Clear and mask the IRQ, then continue to
> -        * process the command.
> -        */
> -       if (host->busy_status) {
> -               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> -
> -               writel(readl(base + MMCIMASK0) &
> -                      ~host->variant->busy_detect_mask, base + MMCIMASK0);
> -               host->busy_status = 0;
> +       if (host->busy_state == MMCI_BUSY_WAITING_FOR_END_IRQ) {
> +               if (!(status & host->variant->busy_detect_flag)) {
> +                       host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       host->busy_state = MMCI_BUSY_DONE;
> +                       return false;
> +               } else {
> +                       dev_dbg(mmc_dev(host->mmc),
> +                               "busy status still asserted when handling busy end IRQ\n");
> +                       /* Force clear the spurious IRQ */

It may certainly be a spurious IRQ, but I am not sure that the below
is the correct thing to do in this case. I think it would be better to
continue to wait for another IRQ that could be the busy end IRQ.

Note that, the ->busy_detect_flag-bit in the status register can not
be trusted to be the root cause of the spurious IRQ. In fact, that bit
may not be linked to an IRQ at all, as it's dynamically updated and
can be polled too. See mmci_card_busy().

> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       writel(readl(base + MMCIMASK0) &
> +                              ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +                       host->busy_state = MMCI_BUSY_DONE;
> +                       host->busy_status = 0;
> +                       return true;
> +               }
>         }
>

[...]

> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 60bca78a72b1..a805647b6664 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c

After a second thought, I think we should leave mmci_stm32_sdmmc as
is. There is no point in assigning the ->busy_state, unless we really
make use of it.

Moreover, I think sdmmc_busy_complete() is already quite simple to follow.

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
> +               host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
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

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
