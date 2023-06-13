Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80972E284
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 14:08:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4BA8C6A61A;
	Tue, 13 Jun 2023 12:08:57 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53BAAC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:08:56 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-bc476bf5239so3504336276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686658135; x=1689250135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4U/SDkRXm6JkONHl+aWXETJibApGBtdkGiq/SpX1/d4=;
 b=D/abDtSqFY96ns73/ovymsUDWZPjiAAI+3v9BMsjwFMwvTm5t5GuGyOpMONucXZNLn
 30ATL75uvZYUTOPsxw945GCHBH91blhSZBwtsUUWFeDwccndQfXz7OGNQHW/mIGbTo1V
 JW4PcaBbxlGKMxzzx/d2gthJzJkDMJRBuPocqAFMvVk6PMqdRIrEwk1ge3C9VIRNVRfv
 ridd60LoMcAjmA5CJPK1NIsJlIZcW0eV9x2u2U9o2WdQny255DhM645FYCuap2NgkAkp
 t9pzDdzQsvsbrs7ol2I28nenyedWo9+KRBfzpb1gU4eTL+VDJde4phmp7+5f9H6r3QWC
 CtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686658135; x=1689250135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4U/SDkRXm6JkONHl+aWXETJibApGBtdkGiq/SpX1/d4=;
 b=HeHZ5A3knTS5C2mH5m7IfRdvxcc5VL4OJk4WgMzLV/kbtHDmAeO3j8W8wphUk55LR1
 +Zxm7lrqxSWs3xj3au1MnRYuAlrxzLu+Parr8Ku2ouSCE9fTJ2RMNL5wcZW/qr2/ddW2
 cFhnwnx79gwRCdqe+gItf0ycZjXB6+wgkmFLAObMFORIXwHtG8kZS5cj2dEseEq6G2VR
 njoRZ7WJhIJy1PwMK2NIlfz98rK3Czxz6F5ER4MOskV01vyaK9UYmlSwU5ApHa2t1TGw
 +vNoAzE+09pVY2yDm9f8staLTiXp/MT3pxGwrOcdQfG9N8gzvZudwGcMe8z+5DKRil31
 jZxw==
X-Gm-Message-State: AC+VfDxtPFsTDz7wdTS8gfn+pXwMwKTrVTgKluneGhn0mEH0P0hHveUA
 iOWlzlonNaxAE4CYZs5jwkanR24L33gyC9loh3GBLw==
X-Google-Smtp-Source: ACHHUZ6WVoLDVEDK0BpXNpOAwZ5+NTR7G+XMiR4IQvyhiJB1aFu88filt1KWfDheICbk25Cb9d/sTd4vmbFww6ispAk=
X-Received: by 2002:a25:df83:0:b0:bc6:7dea:d08c with SMTP id
 w125-20020a25df83000000b00bc67dead08cmr1586473ybg.34.1686658135322; Tue, 13
 Jun 2023 05:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-6-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-6-cd3d5925ae64@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Jun 2023 14:08:19 +0200
Message-ID: <CAPDyKFph_wm1f6bXs7eETVG8OciS8FsjWpcfCj9_meE7HsrWcg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 06/10] mmc: mmci: Retry the busy start
	condition
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
> This makes the ux500 ->busy_complete() callback re-read
> the status register 10 times while waiting for the busy
> signal to assert in the status register.
>
> If this does not happen, we bail out regarding the
> command completed already, i.e. before we managed to
> start to check the busy status.
>
> There is a comment in the code about this, let's just
> implement it to be certain that we can catch this glitch
> if it happens.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebased.
> ChangeLog v1->v2:
> - Move over the initial saving of host->busy_status from
>   an unrelated patch to this one: it is clear what we are
>   doing: we don't want to miss any transient
>   (MCI_CMDSENT | MCI_CMDRESPEND) in the status register.
> ---
>  drivers/mmc/host/mmci.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index edc68fc7b642..2858d8d67129 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -664,6 +664,7 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
>  static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>  {
>         void __iomem *base = host->base;
> +       int retries = 10;
>
>         if (status & err_msk) {
>                 /* Stop any ongoing busy detection if an error occurs */
> @@ -684,21 +685,36 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * Note that, the card may need a couple of clock cycles before
>          * it starts signaling busy on DAT0, hence re-read the
>          * MMCISTATUS register here, to allow the busy bit to be set.
> -        * Potentially we may even need to poll the register for a
> -        * while, to allow it to be set, but tests indicates that it
> -        * isn't needed.
>          */
>         if (host->busy_state == MMCI_BUSY_DONE) {
> -               status = readl(base + MMCISTATUS);
> -               if (status & host->variant->busy_detect_flag) {
> -                       writel(readl(base + MMCIMASK0) |
> -                              host->variant->busy_detect_mask,
> -                              base + MMCIMASK0);
> -
> -                       host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
> -                       host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
> -                       return false;
> +               /*
> +                * Save the first status register read to be sure to catch
> +                * all bits that may be lost will retrying. If the command
> +                * is still busy this will result in assigning 0 to
> +                * host->busy_status, which is what it should be in IDLE.
> +                */
> +               host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +               while (retries) {
> +                       status = readl(base + MMCISTATUS);
> +                       if (status & host->variant->busy_detect_flag) {
> +                               writel(readl(base + MMCIMASK0) |
> +                                      host->variant->busy_detect_mask,
> +                                      base + MMCIMASK0);
> +
> +                               /* Keep accumulating status bits */
> +                               host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);

Looks like we should accumulate the status, no matter whether the
host->variant->busy_detect_flag is set?

Perhaps move this just before the if-clause above?

> +                               host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
> +                               return false;
> +                       }
> +                       retries--;
>                 }
> +               dev_dbg(mmc_dev(host->mmc), "no busy signalling in time\n");
> +               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +               writel(readl(base + MMCIMASK0) &
> +                      ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +               host->busy_state = MMCI_BUSY_DONE;
> +               host->busy_status = 0;
> +               return true;
>         }
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
