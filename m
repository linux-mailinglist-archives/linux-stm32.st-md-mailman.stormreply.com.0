Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2B3039A9
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 10:58:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93024C57183;
	Tue, 26 Jan 2021 09:58:53 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57EA7C57181
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 09:58:52 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id a6so3749006vkb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJ9v9Eswuw8AGGiIrKPTyPin8ZlyKUfcCAR1/7Zh/xM=;
 b=cyDIRjpO4ZFnV9DET3FtMjX1D/Hxer5/id5g72v3adkfwmLW9gVcnnTXjc5RCcMLH7
 doX76Bobh/BCQcD6YSmWuKwQJcEKNLMhjhdumwRK7lhyz25Oo9CtfOs6oM1orZ9Q713x
 1hPeiBG1hTkxvTC+PrPd0ULC9K/wPIGUl/RbJmyvPy7/8K3xL2rDF4MthNFxMM9hVOOX
 xYYrnAZJvBul/Cu/0OEyWtOHNEW1vC6MKQ9/Tc6TFpOr/py0SYAZP1IC4EcJfJgthd/K
 wx9RPXFarfoUIEHSn0WnmHP0EYv0JDfXHesZMTyRN/DBa/058FPVpc4zfUTNwJoZSbd0
 Copw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJ9v9Eswuw8AGGiIrKPTyPin8ZlyKUfcCAR1/7Zh/xM=;
 b=OHU6+qjjr336MNXgKg8U1nf+4FFv76ZTqRy935KAXxbJdLMumwdee4A9X0cS7Nck3G
 FTqc8kXPDdbJbJBFvwJ3PjX6d0f/rdnCcvmKUgP8Kj98SO3Tvoa873rXKln7GuLFW6yZ
 yQpTmK8nlpNFEGROGKQEidkYxbAsZBS+5phdguw0R0bI4FhcnvChx+OOel3W4pJeqf9l
 zHBoRpMhg3zXVNT1DKChoNs5dg8+s4tgS6RdPGEWY31/3lL2r6hYM9cDb0zdKnQ50RFl
 dwpoCWcHJWBG16RJXMWoW+WcMNlMwn4zW4orBsjxSSnhdjItb6e7NqCXAOlFuJ1AZjkV
 8tJQ==
X-Gm-Message-State: AOAM533bA+6TvB9HQp0FD0/7pabY0gBcaHafFCd0QlBYjfqsSrDAossF
 UlJCfNP2gHRVWW5lRr4uJF1hvAx99+/CEXwqh922rA==
X-Google-Smtp-Source: ABdhPJzC9akXFrbRt4Jm1DTTTS+O1MYoHbnyPrNkFvF2mxlHPqUwHojEqZvYDAxg5Ar2kbdE6A5vZRDISwvvG+EKCIM=
X-Received: by 2002:a1f:2b58:: with SMTP id r85mr3612849vkr.6.1611655131305;
 Tue, 26 Jan 2021 01:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20210124170258.32862-1-marex@denx.de>
 <20210124170258.32862-2-marex@denx.de>
In-Reply-To: <20210124170258.32862-2-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Jan 2021 10:58:14 +0100
Message-ID: <CAPDyKFpn1PZWPnGTP-NdizVjwRgtdfPpw=Wf1g++Cf0y4dYxgA@mail.gmail.com>
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 2/4] mmc: mmci: Add support for probing
 bus voltage level translator
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

On Sun, 24 Jan 2021 at 18:03, Marek Vasut <marex@denx.de> wrote:
>
> Add support for testing whether bus voltage level translator is present
> and operational. This is useful on systems where the bus voltage level
> translator is optional, as the translator can be auto-detected by the
> driver and the feedback clock functionality can be disabled if it is
> not present.
>
> This requires additional pinmux state, "init", where the CMD, CK, CKIN
> lines are not configured, so they can be claimed as GPIOs early on in
> probe(). The translator test sets CMD high to avoid interfering with a
> card, and then verifies whether signal set on CK is detected on CKIN.
> If the signal is detected, translator is present, otherwise the CKIN
> feedback clock are disabled.
>
> Tested-by: Yann Gautier <yann.gautier@foss.st.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com

Applied for next, thanks!

Kind regards
Uffe


> ---
> V2: Rebase on next-20210122, add TB and RB
> ---
>  drivers/mmc/host/mmci.c | 70 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 65 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index b5a41a7ce165..1bc674577ff9 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -36,6 +36,7 @@
>  #include <linux/types.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/reset.h>
> +#include <linux/gpio/consumer.h>
>
>  #include <asm/div64.h>
>  #include <asm/io.h>
> @@ -1888,6 +1889,65 @@ static struct mmc_host_ops mmci_ops = {
>         .start_signal_voltage_switch = mmci_sig_volt_switch,
>  };
>
> +static void mmci_probe_level_translator(struct mmc_host *mmc)
> +{
> +       struct device *dev = mmc_dev(mmc);
> +       struct mmci_host *host = mmc_priv(mmc);
> +       struct gpio_desc *cmd_gpio;
> +       struct gpio_desc *ck_gpio;
> +       struct gpio_desc *ckin_gpio;
> +       int clk_hi, clk_lo;
> +
> +       /*
> +        * Assume the level translator is present if st,use-ckin is set.
> +        * This is to cater for DTs which do not implement this test.
> +        */
> +       host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
> +
> +       cmd_gpio = gpiod_get(dev, "st,cmd", GPIOD_OUT_HIGH);
> +       if (IS_ERR(cmd_gpio))
> +               goto exit_cmd;
> +
> +       ck_gpio = gpiod_get(dev, "st,ck", GPIOD_OUT_HIGH);
> +       if (IS_ERR(ck_gpio))
> +               goto exit_ck;
> +
> +       ckin_gpio = gpiod_get(dev, "st,ckin", GPIOD_IN);
> +       if (IS_ERR(ckin_gpio))
> +               goto exit_ckin;
> +
> +       /* All GPIOs are valid, test whether level translator works */
> +
> +       /* Sample CKIN */
> +       clk_hi = !!gpiod_get_value(ckin_gpio);
> +
> +       /* Set CK low */
> +       gpiod_set_value(ck_gpio, 0);
> +
> +       /* Sample CKIN */
> +       clk_lo = !!gpiod_get_value(ckin_gpio);
> +
> +       /* Tristate all */
> +       gpiod_direction_input(cmd_gpio);
> +       gpiod_direction_input(ck_gpio);
> +
> +       /* Level translator is present if CK signal is propagated to CKIN */
> +       if (!clk_hi || clk_lo) {
> +               host->clk_reg_add &= ~MCI_STM32_CLK_SELCKIN;
> +               dev_warn(dev,
> +                        "Level translator inoperable, CK signal not detected on CKIN, disabling.\n");
> +       }
> +
> +       gpiod_put(ckin_gpio);
> +
> +exit_ckin:
> +       gpiod_put(ck_gpio);
> +exit_ck:
> +       gpiod_put(cmd_gpio);
> +exit_cmd:
> +       pinctrl_select_default_state(dev);
> +}
> +
>  static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
>  {
>         struct mmci_host *host = mmc_priv(mmc);
> @@ -1913,7 +1973,7 @@ static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
>         if (of_get_property(np, "st,neg-edge", NULL))
>                 host->clk_reg_add |= MCI_STM32_CLK_NEGEDGE;
>         if (of_get_property(np, "st,use-ckin", NULL))
> -               host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
> +               mmci_probe_level_translator(mmc);
>
>         if (of_get_property(np, "mmc-cap-mmc-highspeed", NULL))
>                 mmc->caps |= MMC_CAP_MMC_HIGHSPEED;
> @@ -1949,15 +2009,15 @@ static int mmci_probe(struct amba_device *dev,
>         if (!mmc)
>                 return -ENOMEM;
>
> -       ret = mmci_of_parse(np, mmc);
> -       if (ret)
> -               goto host_free;
> -
>         host = mmc_priv(mmc);
>         host->mmc = mmc;
>         host->mmc_ops = &mmci_ops;
>         mmc->ops = &mmci_ops;
>
> +       ret = mmci_of_parse(np, mmc);
> +       if (ret)
> +               goto host_free;
> +
>         /*
>          * Some variant (STM32) doesn't have opendrain bit, nevertheless
>          * pins can be set accordingly using pinctrl
> --
> 2.29.2
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
