Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B793C1A9702
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 10:41:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80B9FC36B0C;
	Wed, 15 Apr 2020 08:41:08 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC80C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 08:41:06 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id a6so1043292uao.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2k8McS/K5NefTNba5xsVsO/fUtMzpQPzb5n8a6auMs=;
 b=TGriCENOdLxLP77jm7Tb8Oa/5P93+8TDkF3Qd46iveBgLU6Nga83FMgYT9ME+mC5x9
 lU0PK3AO550ADRm4eh6Q5LHgaMRgqa5SAC4T+alOhC88n/M5T5QK4Rp+i4q9plVm+XnO
 0tTfRspCoFo5GG0eEszFEez168zIm0cZdFM4K6XJRPSmB0G08+599039AlRNwJ7E0eMf
 iHg/SRa5UnDVph5xioqQTLMjgsvIXPucWU8nNAn82N7Pxfzi43DkqkS7uZFGXKLH/jhp
 QGKgusZOcJerGc31W+hh49QxUQDDAv3FqqcazcJr+q7OgJBgUESTPih2hNFTJegku/Wu
 8DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2k8McS/K5NefTNba5xsVsO/fUtMzpQPzb5n8a6auMs=;
 b=HU2SmercqcBHCQcehGLC2aGKvc9PWXK7vZE22EjZ0b7Zhwt6kWqxWbeiCShVPLOfnd
 ilBgmg/HrxhvKcCAQteQYoN0gLaHtMBfKiTZ6VphMvTCD4kgnbjdoAl8ZxNje8VAn/d8
 IXx04M6DPV4Z1RIsnethH6+2YuBWTaYmsBh34NLaNoYJqH+lhV069iqCj52zmIxqFMal
 83TedC8qDtV2qzI42td2pN1inJ6+aCowzeMtEIOIx+IrtxafByebFRavm+51LWdLdjPM
 6xq7zBVZfH/XKMzhK3CaiDkqeZymYxR29EobyFACIkMKDJzCjXFd0DspNIvKIz8JVz3e
 DTyA==
X-Gm-Message-State: AGi0PuYMk8Sd7P9rUYwjeoYQNmYvkme0cvsatvbIxbij2R2iT/DgOq3+
 PHH96IMwmBiSui11vIis/FgPvPzLcF3C3WWWy+8lbA==
X-Google-Smtp-Source: APiQypInceMAHxuFWj5L8A7rNn9xiU0htqIhPLdEK0hmWs+SiG0rjpK4lzRvRh91FpVELvUuGl4DSB9mPofIb7/yCK0=
X-Received: by 2002:ab0:2ea:: with SMTP id 97mr3644293uah.129.1586940065768;
 Wed, 15 Apr 2020 01:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200401195722.208157-1-marex@denx.de>
In-Reply-To: <20200401195722.208157-1-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Apr 2020 10:40:30 +0200
Message-ID: <CAPDyKFoDB=d5B-2u_Y0e-XVzPQE46JBUTPwY_b_xzESm3NnjwQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] mmc: Prepare all code for
 mmc_set_signal_voltage() returning > 0
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

On Wed, 1 Apr 2020 at 21:57, Marek Vasut <marex@denx.de> wrote:
>
> Patch all drivers and core code which uses mmc_set_signal_voltage()
> and prepare it for the fact that mmc_set_signal_voltage() can return
> a value > 0, which would happen if the signal voltage switch did NOT
> happen, because the voltage was already set correctly.

I am not sure why you want to change mmc_set_signal_voltage(), can you
elaborate on that?

I thought we discussed changing mmc_regulator_set_vqmmc(), what am I missing?

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-mmc@vger.kernel.org
> ---
>  drivers/mmc/core/core.c              | 10 +++++-----
>  drivers/mmc/core/mmc.c               | 16 ++++++++--------
>  drivers/mmc/host/dw_mmc-k3.c         |  2 +-
>  drivers/mmc/host/dw_mmc.c            |  3 +--
>  drivers/mmc/host/mtk-sd.c            |  2 +-
>  drivers/mmc/host/renesas_sdhi_core.c |  2 +-
>  drivers/mmc/host/sdhci-sprd.c        |  2 +-
>  drivers/mmc/host/sdhci.c             |  6 +++---
>  8 files changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 4c5de6d37ac7..98a3552205cb 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1142,7 +1142,7 @@ int mmc_set_signal_voltage(struct mmc_host *host, int signal_voltage)
>         if (host->ops->start_signal_voltage_switch)
>                 err = host->ops->start_signal_voltage_switch(host, &host->ios);
>
> -       if (err)
> +       if (err < 0)
>                 host->ios.signal_voltage = old_signal_voltage;
>
>         return err;
> @@ -1152,11 +1152,11 @@ int mmc_set_signal_voltage(struct mmc_host *host, int signal_voltage)
>  void mmc_set_initial_signal_voltage(struct mmc_host *host)
>  {
>         /* Try to set signal voltage to 3.3V but fall back to 1.8v or 1.2v */
> -       if (!mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_330))
> +       if (mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_330) >= 0)
>                 dev_dbg(mmc_dev(host), "Initial signal voltage of 3.3v\n");
> -       else if (!mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180))
> +       else if (mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180) >= 0)
>                 dev_dbg(mmc_dev(host), "Initial signal voltage of 1.8v\n");
> -       else if (!mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_120))
> +       else if (mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_120) >= 0)
>                 dev_dbg(mmc_dev(host), "Initial signal voltage of 1.2v\n");
>  }
>
> @@ -1172,7 +1172,7 @@ int mmc_host_set_uhs_voltage(struct mmc_host *host)
>         host->ios.clock = 0;
>         mmc_set_ios(host);
>
> -       if (mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180))
> +       if (mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180) < 0)
>                 return -EAGAIN;
>
>         /* Keep clock gated for at least 10 ms, though spec only says 5 ms */
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index de94fbe629bd..9f5aae051f6d 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1121,7 +1121,7 @@ static int mmc_select_hs_ddr(struct mmc_card *card)
>          */
>         if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_DDR_1_2V) {
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_120);
> -               if (!err)
> +               if (err >= 0)
>                         return 0;
>         }
>
> @@ -1130,7 +1130,7 @@ static int mmc_select_hs_ddr(struct mmc_card *card)
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180);
>
>         /* make sure vccq is 3.3v after switching disaster */
> -       if (err)
> +       if (err < 0)
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_330);
>
>         return err;
> @@ -1339,11 +1339,11 @@ static int mmc_select_hs400es(struct mmc_card *card)
>         if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400_1_2V)
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_120);
>
> -       if (err && card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400_1_8V)
> +       if (err < 0 && card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400_1_8V)
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180);
>
>         /* If fails try again during next card power cycle */
> -       if (err)
> +       if (err < 0)
>                 goto out_err;
>
>         err = mmc_select_bus_width(card);
> @@ -1437,11 +1437,11 @@ static int mmc_select_hs200(struct mmc_card *card)
>         if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS200_1_2V)
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_120);
>
> -       if (err && card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS200_1_8V)
> +       if (err < 0 && card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS200_1_8V)
>                 err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180);
>
>         /* If fails try again during next card power cycle */
> -       if (err)
> +       if (err < 0)
>                 return err;
>
>         mmc_select_driver_type(card);
> @@ -1480,7 +1480,7 @@ static int mmc_select_hs200(struct mmc_card *card)
>  err:
>         if (err) {
>                 /* fall back to the old signal voltage, if fails report error */
> -               if (mmc_set_signal_voltage(host, old_signal_voltage))
> +               if (mmc_set_signal_voltage(host, old_signal_voltage) < 0)
>                         err = -EIO;
>
>                 pr_err("%s: %s failed, error %d\n", mmc_hostname(card->host),
> @@ -1769,7 +1769,7 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
>                 err = mmc_select_bus_width(card);
>                 if (err > 0 && mmc_card_hs(card)) {
>                         err = mmc_select_hs_ddr(card);
> -                       if (err)
> +                       if (err < 0)
>                                 goto free_card;
>                 }
>         }
> diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
> index 23b6f65b3785..50977ff18074 100644
> --- a/drivers/mmc/host/dw_mmc-k3.c
> +++ b/drivers/mmc/host/dw_mmc-k3.c
> @@ -424,7 +424,7 @@ static int dw_mci_hi3660_switch_voltage(struct mmc_host *mmc,
>
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>                 ret = mmc_regulator_set_vqmmc(mmc, ios);
> -               if (ret) {
> +               if (ret < 0) {

This change makes sense to me, however it's also a bit confusing, as
the changelog refers to changes for mmc_set_signal_voltage().

As I understand it, we want mmc_regulator_set_vqmmc() to return 1, in
case the current voltage level is the same as the requested "new"
target".

>                         dev_err(host->dev, "Regulator set error %d\n", ret);
>                         return ret;
>                 }

[...]

So, to conclude, it seems like $subject patch needs to be reworked a
bit - just keep the changes you have made to the host drivers, then
throw away the other parts in core.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
