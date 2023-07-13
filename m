Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28D751F78
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 13:06:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 458FCC6B452;
	Thu, 13 Jul 2023 11:06:17 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 676C6C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 11:06:16 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-bd0a359ca35so514184276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689246375; x=1691838375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M2M/lZh8JsEWuYVKsWWFjaGBRpyeEN+n2El8R2XDALY=;
 b=x+qDakDYU7SCaCRHYo8IHk3AXxJHIyHaxgle5KNxYtDxkFUfBKLDnILKAv5QsqyuyN
 wCLIDIFrJiI/ylaFEjiZbISdlg40BZmUjVk94y08GZiZ40v/oYKuezCwQFrcVKqa4PY8
 H6LqVAITrRATp43Yvje5zlxVmnDHPJQNhhnrZxd78bs7oPEBy+tmKglItVZusAEF7U1a
 nmzE+KFan4KvASFR4nYK3VZ0H1if9kptZ5lowJFTn0OKq4mmFgK129MfgzJYKhcl3WG1
 GjywAl32C0WEYrUL3Js2+WBHP3nSD7r5pkWL8qXCoJSBaqIbnFLKIUGek1ivJWCBci0A
 i+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689246375; x=1691838375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2M/lZh8JsEWuYVKsWWFjaGBRpyeEN+n2El8R2XDALY=;
 b=ewuKpun8SMeBcniYJSldLYVRpFc1zxZ6C8cQ7aoCgrkdPf8nnqqW+EoKTzS80+IBQ2
 Tpr6dYVPaT4Ojbmr2mZsOzn6uKLW4/qXBQmTQdJ0dA60VUGPxnPiwVacYd2ZiNGZhVpv
 IiUHpZKWQW68zwHBEBeFIcHhdfC0XlrLqtbBu05BtaHInsloqXXhiHHiyD4xRO7n34Ll
 eXzZoaWqkhlzYSFd7nL2vhsoC1hpDNEIyLsaSbjW4eqVz9geWPRms/zO2ZKBHw3Z3Sk1
 PKdxrjxm9yODC2knZzsrpRmvUc4sAVNE2/AOozYge8qXzLqOo61kRC2YB0jpdaPRNdRP
 3d4g==
X-Gm-Message-State: ABy/qLaKKnlLNNArigB51dUGpvEptUJ1WpNxWR+P9jrsIgiNdbZNqMSJ
 zxrlXkjHvaWCfmP/Odq2Dy7FOD7b0Dm+DiGYiNE8vQ==
X-Google-Smtp-Source: APBJJlHObgT/444UyFbaYVnmaGs/mnlSqy9iy+e1wKBM+93VVPOHlLqTjqQYV6qyhEfqVkw0MP4O+5D4OjIUjdbyfXw=
X-Received: by 2002:a25:2f81:0:b0:c80:f701:7467 with SMTP id
 v123-20020a252f81000000b00c80f7017467mr831061ybv.45.1689246375257; Thu, 13
 Jul 2023 04:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230628191243.3632401-1-linus.walleij@linaro.org>
In-Reply-To: <20230628191243.3632401-1-linus.walleij@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 13 Jul 2023 13:05:39 +0200
Message-ID: <CAPDyKFofJQcFOYzD6TsfOL-ocU4viGnMUSumjnPeojkb0drF_g@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: Improve ux500 debug prints
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

On Wed, 28 Jun 2023 at 21:12, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> To conclude the ux500 busy timeout fixes, this improves the debug and
> error prints so we can see a bit what is going on. Here is a typical
> dmesg with these new debug messages enabled:
>
> [    2.648864] mmci-pl18x 80005000.mmc: mmc2: PL180 manf 80 rev4
>                at 0x80005000 irq 81,0 (pio)
> [    2.662750] mmci-pl18x 80005000.mmc: DMA channels RX dma0chan4, TX dma0chan5
> [    3.480407] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
> [    3.487457] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
> [    3.998321] mmci-pl18x 80005000.mmc: timeout in state waiting for end IRQ
>                                         waiting for busy CMD06
> [    3.998535] mmc2: new DDR MMC card at address 0001
> [    4.000030] mmcblk2: mmc2:0001 M4G1YC 3.69 GiB
> [    4.008361]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15
>                          p16 p17 p18 p19 p20 p21 p22 p23 p24 p25
> [    4.017700] mmcblk2boot0: mmc2:0001 M4G1YC 2.00 MiB
> [    4.020477] mmcblk2boot1: mmc2:0001 M4G1YC 2.00 MiB
> [    4.022125] mmcblk2rpmb: mmc2:0001 M4G1YC 128 KiB, chardev (246:0)
> [    5.791381] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
> [   10.938568] mmci-pl18x 80005000.mmc: timeout in state waiting for end IRQ
>                                         waiting for busy CMD06
> [   17.982849] mmci-pl18x 80005000.mmc: lost busy status when waiting for
>                                         busy start IRQ CMD06
> [   18.683563] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
> [   19.385437] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
> [   20.493652] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
>
> We see a lot of lost IRQs and the timeout always occur while waiting for
> the end IRQ, and then the busy status is *low* meaning the busy indication
> is already de-asserted.
>
> So busy signalling is missed in various ways for various reasons,
> sometimes it appears that IRQs are simply lost.
>
> One hypothesis is that this happens because the events happen so fast
> that they are transient, and since the MMCI state machine in effect is
> handling an edge trigger (rising or falling signal on DAT0) the
> internal logic will miss the event, because the state machine in the
> hardware is sampling the line, and will at times detect only the first
> event but miss the second, fireing only one IRQ.
>
> We print the second timeout error with dev_err() since it is pretty
> serious, the other events are so common and simple to handle that we
> can keep them at dev_dbg() level.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 4fd28eaadc07..5d05269a8567 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -734,7 +734,8 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
>                         }
>                         retries--;
>                 }
> -               dev_dbg(mmc_dev(host->mmc), "no busy signalling in time\n");
> +               dev_dbg(mmc_dev(host->mmc),
> +                       "no busy signalling in time CMD%02x\n", cmd->opcode);
>                 ux500_busy_clear_mask_done(host);
>                 break;
>
> @@ -756,7 +757,8 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
>                         host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
>                 } else {
>                         dev_dbg(mmc_dev(host->mmc),
> -                               "lost busy status when waiting for busy start IRQ\n");
> +                               "lost busy status when waiting for busy start IRQ CMD%02x\n",
> +                               cmd->opcode);
>                         cancel_delayed_work(&host->ux500_busy_timeout_work);
>                         ux500_busy_clear_mask_done(host);
>                 }
> @@ -770,13 +772,14 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
>                         ux500_busy_clear_mask_done(host);
>                 } else {
>                         dev_dbg(mmc_dev(host->mmc),
> -                               "busy status still asserted when handling busy end IRQ - will keep waiting\n");
> +                               "busy status still asserted when handling busy end IRQ - will keep waiting CMD%02x\n",
> +                               cmd->opcode);
>                 }
>                 break;
>
>         default:
> -               dev_dbg(mmc_dev(host->mmc), "fell through on state %d\n",
> -                       host->busy_state);
> +               dev_sbg(mmc_dev(host->mmc), "fell through on state %d, CMD%02x\n",
> +                       host->busy_state, cmd->opcode);
>                 break;
>         }
>
> @@ -1503,6 +1506,20 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>         }
>  }
>
> +static char *ux500_state_str(struct mmci_host *host)
> +{
> +       switch (host->busy_state) {
> +       case MMCI_BUSY_WAITING_FOR_START_IRQ:
> +               return "waiting for start IRQ";
> +       case MMCI_BUSY_WAITING_FOR_END_IRQ:
> +               return "waiting for end IRQ";
> +       case MMCI_BUSY_DONE:
> +               return "not waiting for IRQs";
> +       default:
> +               return "unknown";
> +       }
> +}
> +
>  /*
>   * This busy timeout worker is used to "kick" the command IRQ if a
>   * busy detect IRQ fails to appear in reasonable time. Only used on
> @@ -1522,9 +1539,15 @@ static void ux500_busy_timeout_work(struct work_struct *work)
>                 /* If we are still busy, let's tag on timeout error. */
>                 if (status & host->variant->busy_detect_flag) {
>                         status |= MCI_CMDTIMEOUT;
> -                       dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy\n");
> +                       dev_err(mmc_dev(host->mmc),
> +                               "timeout in state %s still busy with CMD%02x\n",
> +                               ux500_state_str(host),
> +                               host->cmd->opcode);
>                 } else {
> -                       dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy IRQ\n");
> +                       dev_err(mmc_dev(host->mmc),
> +                               "timeout in state %s waiting for busy CMD%02x\n",
> +                               ux500_state_str(host),
> +                               host->cmd->opcode);
>                 }
>
>                 mmci_cmd_irq(host, host->cmd, status);
> --
> 2.40.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
