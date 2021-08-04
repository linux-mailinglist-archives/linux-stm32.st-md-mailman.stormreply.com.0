Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DE3E0045
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Aug 2021 13:35:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65704C5A4D3;
	Wed,  4 Aug 2021 11:35:23 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 852AFC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Aug 2021 11:35:21 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id j19so847499vso.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Aug 2021 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zFmNv8bWnnhaUEfEbtd/dIDab8KFB9ZFGv6zOrp9yb4=;
 b=iu0kyRPpYLdd/jKrXz1byoUVslMvTNXKDP5os4v7jpIA9Q4eZ9ui2ItYYzm14Ep4dl
 ovQWvTdkAoGV/HM55AZMcYojzijUvBsmwjyLPGu0ajgS9yg+HSdYM/DjDuTE17r2kwku
 A+KsLof1HDrPTHh9X4WNRSZ47BKMaPTBXgjUPbKDxD5p3F1e9ikCH9SB/1sGkt0AhztT
 M73vqhZO16i6VffkAeO6/HB5YHRQsL1u+GxNm9q+8l7dx+BQdsx+PgRnG85naHFHwF+S
 Txfpfm+vz2kG5lnH4z1nUXucc4va+QumoW539vaWHuhUsrmG7osUGfM8sVu4nHtsY2kb
 9xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zFmNv8bWnnhaUEfEbtd/dIDab8KFB9ZFGv6zOrp9yb4=;
 b=bFl6Qz37R+XUothIGdCPeCxqaq+YzuDthJWr9XmDqfXLQjsFq+qilsdKlQW13kqt88
 FqBdqoUgB9cktU/5KmYOUDTAcVoLy5v6ttIdcrTSv+xHg/7lWOozHwr/H1rFp/lklWrq
 BJStXu93qB8Lj3MTvhsPoopKbd+F5GZ1zBEjvwpMj9yjcenY7PSaJsuECEBlaYtu4XVp
 5vXI8kbSW7OtvEmlyth3HBW3hoJMooyxD9JJhGwY20FYl50UXvh2Jlv2rDKPK2ROo64v
 WdiwVaCDBdAVPwdMdQ1DPXndq/5BsKqEODGkOpKSxla5fewNEvGJnwcH9/lLMYqC1ls6
 kfZg==
X-Gm-Message-State: AOAM532MnSc+JhytQgPJWcQkdGp9dMa9weUE66vhoF7ccGXP5B18zzAB
 E0GliwWIJLCj2qvorg/wc22XfH5WZAYmDZ88QNsEpQ==
X-Google-Smtp-Source: ABdhPJyCx3nRY/4KqOLvHiEA42E1G/VVl/48vDkQI4N1BE+4zhkOavjC4jVwnhhJLmbbutkiekBOZaTnqYfqHAut40o=
X-Received: by 2002:a67:7c14:: with SMTP id x20mr9769573vsc.42.1628076920860; 
 Wed, 04 Aug 2021 04:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210701143353.13188-1-yann.gautier@foss.st.com>
In-Reply-To: <20210701143353.13188-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Aug 2021 13:34:44 +0200
Message-ID: <CAPDyKFoCABbyKaejhzAqM9hv7Emg4WyfbtORoW_XMnmoxKSVAQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: check when the voltage
 switch procedure should be done
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

On Thu, 1 Jul 2021 at 16:34, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> From: Christophe Kerello <christophe.kerello@foss.st.com>
>
> If the card has not been power cycled, it may still be using 1.8V
> signaling. This situation is detected in mmc_sd_init_card function and
> should be handled in mmci stm32 variant.
> The host->pwr_reg variable is also correctly protected with spin locks.
>
> Fixes: 94b94a93e355 ("mmc: mmci_sdmmc: Implement signal voltage callbacks")
>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

Applied for fixes and by adding stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 51db30acf4dc..fdaa11f92fe6 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -479,8 +479,9 @@ static int sdmmc_post_sig_volt_switch(struct mmci_host *host,
>         u32 status;
>         int ret = 0;
>
> -       if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180) {
> -               spin_lock_irqsave(&host->lock, flags);
> +       spin_lock_irqsave(&host->lock, flags);
> +       if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 &&
> +           host->pwr_reg & MCI_STM32_VSWITCHEN) {
>                 mmci_write_pwrreg(host, host->pwr_reg | MCI_STM32_VSWITCH);
>                 spin_unlock_irqrestore(&host->lock, flags);
>
> @@ -492,9 +493,11 @@ static int sdmmc_post_sig_volt_switch(struct mmci_host *host,
>
>                 writel_relaxed(MCI_STM32_VSWENDC | MCI_STM32_CKSTOPC,
>                                host->base + MMCICLEAR);
> +               spin_lock_irqsave(&host->lock, flags);
>                 mmci_write_pwrreg(host, host->pwr_reg &
>                                   ~(MCI_STM32_VSWITCHEN | MCI_STM32_VSWITCH));
>         }
> +       spin_unlock_irqrestore(&host->lock, flags);
>
>         return ret;
>  }
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
