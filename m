Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570C7317F6
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 13:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDC92C65E58;
	Thu, 15 Jun 2023 11:57:36 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71311C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 11:57:35 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-bd77424c886so1741955276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686830254; x=1689422254;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=afkr67MqCl1yPE9cbHl8BgAKnwQMyZRs7BFufFtFzas=;
 b=fj9ORj7RuqkrvPG3UrJz2q+kPp1+5z4Yz+XFHJIHBcokRNKvOUNKqrG9VRJirnJxq1
 tDc/9zdRC2xsDED9EcqQdTWHGiRddKoaYFW4b/mr93x9vjcqPZPib0U1NvZ6to+YXG5P
 lQBXc185CUCFeNqyXmPzFUs1t6zhEM02eTL9sFZlVakYv67xHMmGKAqB+lt/haMkBjhF
 fAYM2l+rQgM+qZ+SPcZun2s85N0Zmpz6DjotKml8WIWWKfRofVtwSNRjkfiGkAQNAXfc
 UQ2yvmnG1NNDbZs6MOaiBRuiYYe+YeR5rK+gqFJsVdOosl/PjAHETq59uNFuZJ7WpMtV
 t7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686830254; x=1689422254;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=afkr67MqCl1yPE9cbHl8BgAKnwQMyZRs7BFufFtFzas=;
 b=a89SgLOS8O+pv8I25j0JX7O/SRZBvM3nstqkPsnPuqf7f/UrM1bZI0/ciNvnbj8B6D
 pbiIVDIEhieW2C/vdr7gYPyw9GgBpkFL8aVna0vNZoMRsS+sg/Ffh6kHCkyWwIKE3I2o
 Se0QUbtHh3CKi/PTFjX8rpRttV4qGhJ9I+q3DjQghqzV5yHnNKR2pgb0WqQB5NSIJ4Si
 GpFIKMAI3xYtXF7uYJeMzbuy1XbTPmBx1I6ovzivxjLr3sJRIKmf/R/bdM8tnhEC0zJp
 aaY0mO7GXkD3rvKt9CDZbnWYYszH3T5sN6t2DhuSQgWGIuztDQd2ASUYeJSQgqdc2Xzg
 jXDw==
X-Gm-Message-State: AC+VfDwCgO7dPAzMESdvXUQopZadtZS31ssGVQaIUYh28g34JP4liHEP
 3XhchmwodSvL3NmnsKO61OokgHPXfOiyq0n8mekBrg==
X-Google-Smtp-Source: ACHHUZ6JdnDMBk7tsimj6J3FPVLtSWWc6Ee+HQ5b2tze37LEZa+JkI93oFT/sSy6KmGG4jLNZSUBGlWcAsGCQJEAaYA=
X-Received: by 2002:a81:4fc5:0:b0:570:eb7:3db3 with SMTP id
 d188-20020a814fc5000000b005700eb73db3mr5132585ywb.37.1686830254318; Thu, 15
 Jun 2023 04:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
 <20230405-pl180-busydetect-fix-v4-5-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-5-df9c8c504353@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Jun 2023 13:56:58 +0200
Message-ID: <CAPDyKFp36G6StCVeihOefWuaeNBEe9uC6cfQi3nh8T-HLfh7uQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 05/10] mmc: mmci: Make busy complete
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

On Tue, 13 Jun 2023 at 22:34, Linus Walleij <linus.walleij@linaro.org> wrote:
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
> index d632658d9d20..3b1a23e4ec1c 100644
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
> +               if (status & host->variant->busy_detect_flag) {

I realize that I have already queued up $subject patch, but I haven't
been able to test this myself yet.

However, I wonder if the above is really correct? More precisely, did
you confirm that the variant->busy_detect_flag-bit becomes set for the
ux500 variant, when the card stops signaling busy? If not, we will
always end up in the else clause below?

> +                       host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +                       host->busy_state = MMCI_BUSY_DONE;
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

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
