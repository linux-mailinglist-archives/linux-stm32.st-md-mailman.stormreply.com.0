Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DB0329A90
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 11:40:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0C17C57189;
	Tue,  2 Mar 2021 10:40:40 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BD97C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 10:40:39 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id g68so2732461vkb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bs3aFYj5lDwWpMkhgX+vmRNoLw6eyqE+e72Cvwu8vBk=;
 b=ToEs2IVLIl0MtkeQXFndYK8lCO+lXPNZFM3errsVl5pQqRpY7LrHelfh1FFvgGvYBp
 0gqhijGNEGXqGl1T0K3/N53d2mVVhXeaWYSsgjhT0ZJzpG+gmbmT0JurcWaSyaLzZOpi
 8LtvYAq81Q0DpIEah8otXb8gryswM8KFpelDADsolgqYkV+SShg5kbE4U3XUY0EApSrQ
 3ACWW+2qOPu7/FPnQEYQSD5qTWBDNJK3NXXin6TA3Jnlob3mJwpewe7AdubCXb17Sv/R
 jXQ9Kyl7aRiV1woyMDdsjBe5eH1Ek7fdZm2YUp9wVd9kpx2c/LRFDYHT+WRT2gyT/F4E
 FF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bs3aFYj5lDwWpMkhgX+vmRNoLw6eyqE+e72Cvwu8vBk=;
 b=LzZojajefm6H5DzacRuisa6Utt8UiB9dzB2Uca/H517Kiz/1TJUNai3iPVPd6pkc/F
 l/u1VhGS9NwLnG1Is67QoxknfaGCgSyGDFeK9xYTpPwoLMXYzts1AUCP+lumVq8n2pyJ
 djHC2TxqRVetd0P8vpyptc+pU3yZEQUjlypPRSQVPyg0b9Y5KapKUo1v3QDy/5bW4VYm
 V//UI6mEDpzQkmxEdWVMvT4/M3K0Lx1bBktISPXkMWTcZuJKZZzuqgcFs3p9OrdvQKab
 l9TrTvUdDlQA7BpyaOjxJstKdtQy2pDKXqCqYc+nzCOn8NpEiWv6lehaK4hQYfuEhrjg
 Ftug==
X-Gm-Message-State: AOAM531ZMDq+VKU52pDN2kRNy46ulAJzqPmL1qx9yJ7CvnmuUGYRdxXS
 0J+Bwc2LRmH7z3jKdD4td8JsTo0ABEX1gel8Xb1QZw==
X-Google-Smtp-Source: ABdhPJxYFL17WoK6xDGbyRm9sJUh1M3Fmjg8cvD8NbL+WhqWEHetCeB7mvwoOHS5jK5CbyPdRi8GrPSEvMZdOOHYOu0=
X-Received: by 2002:a1f:a68d:: with SMTP id p135mr1850179vke.6.1614681638153; 
 Tue, 02 Mar 2021 02:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20210225145454.12780-1-yann.gautier@foss.st.com>
In-Reply-To: <20210225145454.12780-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Mar 2021 11:40:02 +0100
Message-ID: <CAPDyKFo-98OWNg4QJ1cgY2QwYFB9d-6tVrMs0RYt6-=cU3-73w@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage
	MMC_CAP_NEED_RSP_BUSY for stm32 variant
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

On Thu, 25 Feb 2021 at 15:55, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> To properly manage commands awaiting R1B responses, the capability
> MMC_CAP_NEED_RSP_BUSY is enabled in mmci driver, for stm32 variant.
> The issue was seen on STM32MP157C-EV1 board, with an erase command,
> with secure erase argument, letting the card stuck, possibly waiting
> for 4 hours before timeout.
>
> Fixes: 94fe2580a2f3 ("mmc: core: Enable erase/discard/trim support for all mmc hosts")
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> This is somehow a v2 for patch [1].
> Changes:
> - Only apply MMC_CAP_NEED_RSP_BUSY to stm32 variant
> - Cap the used timeout written to MMCIDATATIMER (when using
> MMC_CAP_NEED_RSP_BUSY, cmd->busy_timeout may be greater than
> host->max_busy_timeout)
>
>  [1] https://patchwork.kernel.org/project/linux-mmc/patch/20210204120547.15381-2-yann.gautier@foss.st.com/
>
>  drivers/mmc/host/mmci.c             | 8 +++++++-
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 17dbc81c221e..89e0e9ccfb71 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1242,7 +1242,13 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>                 if (!cmd->busy_timeout)
>                         cmd->busy_timeout = 10 * MSEC_PER_SEC;
>
> -               clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> +               if (host->mmc->caps & MMC_CAP_NEED_RSP_BUSY &&
> +                   host->mmc->max_busy_timeout &&
> +                   cmd->busy_timeout > host->mmc->max_busy_timeout)

We are already within "if (host->variant->busy_timeout ....", a few
lines above, which means this can be simplified into:

if (cmd->busy_timeout > host->mmc->max_busy_timeout)

> +                       clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
> +               else
> +                       clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> +
>                 do_div(clks, MSEC_PER_SEC);
>                 writel_relaxed(clks, host->base + MMCIDATATIMER);
>         }
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 51db30acf4dc..2ad577618324 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -522,6 +522,7 @@ void sdmmc_variant_init(struct mmci_host *host)
>
>         host->ops = &sdmmc_variant_ops;
>         host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
> +       host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;

To make it more clear that this is for variants having the
->busy_timeout flag set, I suggest to move this into mmci_probe().

>
>         base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
>         if (IS_ERR(base_dlyb))
> --
> 2.17.1
>

Well, I decided to help out a bit. I have amend the patch according to
the above and extended the commit message with some valuable
information, based upon our earlier discussions.

Patch is applied at my fixes branch with a stable tag, please have a
look, test and shout at me if there is something that looks wrong!

Thanks and kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
