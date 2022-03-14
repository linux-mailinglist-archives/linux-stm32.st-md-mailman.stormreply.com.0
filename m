Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66E4D808A
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 12:18:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 542BAC60467;
	Mon, 14 Mar 2022 11:18:27 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D2EC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 11:18:26 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 3so26437502lfr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XskhS1+ZejRwgAiU2pw1deIKGswy4V+5KYO2DeR1N9Y=;
 b=Uhu1Lwv+8VuFE5mRfF/1b2fiAHqmvUsgUhO0pXi5pyY4urvEINV6Z/m05yaTGcL5ZE
 +vLW4CEz2XJmayqkOZwg68/tGpAtHuZmQ18hMhr8SHNkm4H/Er1sDkW3fhVzF4bJp4VD
 t4GUQ30wmnGKjmoD9e7ylxfIYy7S+dnRcLwN2BAWwedlCqT01lOSr8m7LV8LVcNaIUjh
 OD7b6zeb/aNU4N99T50I0q8ffqS5qtDBfH0RYR6JetL+NbVtq48E/GQXd4m+a92tmr4b
 vqUI0gEaE7QWLqqos5eiSeey6RnrWI2pLhk0pXSQibJpGpu/eUTQPYb+Wx4tSOgjTFsn
 vASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XskhS1+ZejRwgAiU2pw1deIKGswy4V+5KYO2DeR1N9Y=;
 b=QIoX+syv7lmDoSj6JD1PZ21QMgzq6GW5K1DVbJjm+jPQI6CQ5DImwaJVmjmFeZp22R
 DWt/khnQIPxjtPdbzUsi/2sv3f/YWTrvf1gH2mOd5DAcLyIjHM4tCY69WIg1BiH42Kx7
 GOisWI86ck1WLHrI156w9FaCp86RRNPGoKz0PL+I3LZDN405LD4cWaIqsqXaEtmCt39U
 03F/tfOxPNoSX3/OY5n0REX05kJZqMRJEZVhYEvIAP1qWgJTeEa2sliwrn+mb27oICvT
 7Elc6NONMoMXPUO0qfw3lyt3wNRalX8qP3CQ40Ijhtur6tsvvgFZNsaIqxUX8wYg51e5
 G+ww==
X-Gm-Message-State: AOAM531v2hVehUtV9bMTVFp+yStNZ7yinRgFLfNbTkP47zYA68DK4h7q
 vnQNfCVf8ttL9VNTYPI3epbL1WST/XazyyV3De6Cgg==
X-Google-Smtp-Source: ABdhPJzg/q9jjOR2SPQ2R16ySqzVp24+QtiJiQEJR73cAEQSY86tTlqPmMueae2ZtUIMfhCRek0+f4lyt/Me1eJarYw=
X-Received: by 2002:a05:6512:12c4:b0:448:6d12:4434 with SMTP id
 p4-20020a05651212c400b004486d124434mr9339397lfg.71.1647256705361; Mon, 14 Mar
 2022 04:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
In-Reply-To: <20220314095225.53563-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Mar 2022 12:17:49 +0100
Message-ID: <CAPDyKFqObiC2fwZJ_0JArbVhnFZHV6bA0XJg0diwPgmRx1Bntg@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND] mmc: mmci: manage
	MMC_PM_KEEP_POWER per variant config
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

On Mon, 14 Mar 2022 at 10:53, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> Add a disable_keep_power field in variant_data struct. The
> MMC_PM_KEEP_POWER flag will be enabled if disable_keep_power is not set.
> It is only set to true for stm32_sdmmc variants.
>
> The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
> It doesn't correctly support low power, and we need to unbind the wifi
> driver before a suspend sequence. But the wifi chip firmware is then
> lost, and the communication with SDIO fails if MMC_PM_KEEP_POWER is
> enabled.

So the platform supports to maintain the power for the embedded wifi
chip during system suspend, but the SDIO func driver (for the WiFi
chip) doesn't implement its part correctly. Did I get that right?

In that case, it sounds to me like we should try to fix the support
for power management in the SDIO func driver instead, no?
I am happy to help with guidance/review if that is needed. What SDIO
func driver is this about?

Kind regards
Uffe

> The flag can still be enabled through DT property: keep-power-in-suspend.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> Resend the patch alone. It was previoulsy in a series [1] for which the
> other patches will be reworked.
>
> [1] https://lore.kernel.org/lkml/20220304135134.47827-1-yann.gautier@foss.st.com/
>
>  drivers/mmc/host/mmci.c | 5 ++++-
>  drivers/mmc/host/mmci.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 45b8608c935c..0e2f2f5d6a52 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -274,6 +274,7 @@ static struct variant_data variant_stm32_sdmmc = {
>         .busy_detect            = true,
>         .busy_detect_flag       = MCI_STM32_BUSYD0,
>         .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
> +       .disable_keep_power     = true,
>         .init                   = sdmmc_variant_init,
>  };
>
> @@ -301,6 +302,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
>         .busy_detect            = true,
>         .busy_detect_flag       = MCI_STM32_BUSYD0,
>         .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
> +       .disable_keep_power     = true,
>         .init                   = sdmmc_variant_init,
>  };
>
> @@ -2172,7 +2174,8 @@ static int mmci_probe(struct amba_device *dev,
>         host->stop_abort.flags = MMC_RSP_R1B | MMC_CMD_AC;
>
>         /* We support these PM capabilities. */
> -       mmc->pm_caps |= MMC_PM_KEEP_POWER;
> +       if (!variant->disable_keep_power)
> +               mmc->pm_caps |= MMC_PM_KEEP_POWER;
>
>         /*
>          * We can do SGIO
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index e1a9b96a3396..2cad1ef9766a 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -361,6 +361,7 @@ struct variant_data {
>         u32                     opendrain;
>         u8                      dma_lli:1;
>         u32                     stm32_idmabsize_mask;
> +       u8                      disable_keep_power:1;
>         void (*init)(struct mmci_host *host);
>  };
>
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
