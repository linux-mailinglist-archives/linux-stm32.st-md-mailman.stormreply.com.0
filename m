Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D364D859A
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 14:04:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEAB7C60467;
	Mon, 14 Mar 2022 13:04:19 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1D14C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 13:04:17 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id bu29so27117104lfb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/MfZZ8Z2VIRecHres2doKMiTPlkeNRdQVYI9Pur3LWg=;
 b=CAqEHUaj6AhkwwEV4fG53921rZDVLI25guUp4kKbZHYrGsnPdybb4SZap6GGfpchvN
 /N4S0TPHJoKhQUFT4m9ieSo5Y73BHV//gg6oKRUw2YR6TEhipbovxHI498M/MxD6rGry
 fh/HpovLgWCqKuL+GGb4U7PXl5Pwvq5INkaeTJngHLBd67MdbjEi8TjwhVwl3oJfmnwR
 mfE2hK7KnWfM5ze6g23N9XSaoJMYD8JBm0IHi2Mjxt3X2d3GfwjVlIaSWuCPykc4FMBY
 ZGojEFVRGc2Q2YBN9ELDzzHlRkWezpf8zBplgHdILSRDRt6Iu11yB0JGrEeOtYqxiKvl
 Gw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/MfZZ8Z2VIRecHres2doKMiTPlkeNRdQVYI9Pur3LWg=;
 b=3cMn8teqbinqW7J3TuxkwjHw+HBAYPO2uqP/BaVhMOKiDLJ5F2pyo9Kpb7BrAyBJya
 BoLk7ri9JVyOh4hby2KZF5hEu5wt1GWY/8iZ02Wmrr3vxOjRCGIpVlHCl/eqUVUly8Rh
 7oM5kleEnJCXpE/RXE73RCHU9s+6Gupbv4znY+FK9jGcwnqMuHmyTWgRlP+N1NEhTyt6
 RmuUulo/5LLk1haNfVyF3rTqz1BF+zDuotwhVC70f6ddRC5E4CQ+FqJJrHVxfk8y2iIu
 dznzV1I0TwlTJcBG7ph2dWJv0c1cJjC2MVUh9GQCOk1bIIGVAhxyNqz/e6nWtvnj03Wn
 PGVA==
X-Gm-Message-State: AOAM530F0XATwCP0Byhl4aAE14cWDzXco9ctc+JCx1iFsbfIPRB+XUYt
 gevbj42w4HQfmJFekrNf95VocfNrYIr4KqKdzVcM6Q==
X-Google-Smtp-Source: ABdhPJxLj7y2ByIROxvKKfiEeHzQZ63DiyPekwQpuNnd2iLxo6Vd9kVMmuxVeBkOcfokRikDVwLDYdTWQLK3uoV/k80=
X-Received: by 2002:a05:6512:3e0c:b0:448:3480:1fe5 with SMTP id
 i12-20020a0565123e0c00b0044834801fe5mr13437236lfv.358.1647263057083; Mon, 14
 Mar 2022 06:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
 <20220314125554.190574-1-yann.gautier@foss.st.com>
In-Reply-To: <20220314125554.190574-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Mar 2022 14:03:41 +0100
Message-ID: <CAPDyKFruN9Xwk4uqFumwBdcn4SjKQcSQVBbALa3kVxY4mVzOnQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage MMC_PM_KEEP_POWER
	per variant config
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

On Mon, 14 Mar 2022 at 13:56, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> Add a disable_keep_power field in variant_data struct. The
> MMC_PM_KEEP_POWER flag will be enabled if disable_keep_power is not set.
> It is only set to true for stm32_sdmmc variants.
>
> The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
> It doesn't correctly support low power on this board. The Wifi chip
> awaits an always-on regulator, but it was connected to v3v3 which is off
> in low-power sequence. MMC_PM_KEEP_POWER should then be disabled.

Just to make sure I get this correct.

Why can't the regulator stay on during system suspend? The point is,
we don't need an always on regulator to cope with this.

Kind regards
Uffe

>
> The flag can still be enabled through DT property:
> keep-power-in-suspend.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> Update in v2:
> Reword commit message to better explain the issue.
>
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
