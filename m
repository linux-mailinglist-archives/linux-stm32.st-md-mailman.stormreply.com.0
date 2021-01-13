Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D313A2F48DD
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 11:45:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94EF4C424C0;
	Wed, 13 Jan 2021 10:45:20 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F420CC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 10:45:17 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id r24so838868vsg.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 02:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggmrbdZugFh6Xc9o04m7/oYR3aELx/RKMNQrAS6lzRM=;
 b=xwVwYALu8w7uwBFjZ7xyW02I279IW4oTi1W413t9yqpwGiNbb6sNO+vWC5eNZuE7Z4
 tQYDQ6nHQdKlZa0edmmBP0ZTXcrk9EAzJqOr8E/5h3Of1Juaelbpa8OSGPktC3rpShLE
 wy+AOMVEbvkvVpkwC797jNrNpbDIzRux5iGKc1oafB6QaWHsFYDJsSPSt4HYwGipJESk
 jZWQJrD8JvHWLcpLgKS7TpLQaD4iZH9UU873VQ/nTCYWL29V0jE3G0ll81eNUtMOI697
 t1/r/4itZP3PqAlTf1zDZFjgOlt9UmHTgxetjxUiMhlFtQkBAKxfqFCUaYeBWAJjSavZ
 KKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggmrbdZugFh6Xc9o04m7/oYR3aELx/RKMNQrAS6lzRM=;
 b=kw6mVDL0DG11Dx1j0Q2U4d1moKZ/pCkCI0TNJC++DDSgXCAQNIIdJN+PfnhY5XKsfT
 OSoqci88ubMEuHyJ6S990eJvw4vrUihTRwAAnhdxPIBhd52F3K4hJwvW37Ma1lCgtiiN
 hxgdpOvahsGduRXe/x8nq0cBSz8rfIZQ8IuXeTweYXKBfH90qLt9GSrS8lnOAMzF162a
 WtiEGQdsOeWniK9hKUiJgN8AIGenpTwg5pdMh8+5oUWctBNuiyLix/p0a54BQK8ARM3o
 ETSoKy085NOOvLU2+X/wovPyuKyiG9m79tAOs8GhdJc2qyCFfZZIKZ3gkVHvRHcIJR7q
 Zu9Q==
X-Gm-Message-State: AOAM532G0rr6Cdc7Cag9sGaq98EbB0ub7PxGrxHi+sbp+jFbLPnmRTcb
 2UX9M/SyID9NJ0mCPhIV+HNzko4bsjs9qPBkXCsfcQ==
X-Google-Smtp-Source: ABdhPJwdBRamR8B9HqQwgRdZYCrNcABjdmOLwpRNKbezqTedH845+FJr+ZpCds6Falhsve5F753o7yUou86hXWchj6o=
X-Received: by 2002:a67:fe85:: with SMTP id b5mr1090755vsr.19.1610534716659;
 Wed, 13 Jan 2021 02:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20210105140718.122752-1-marex@denx.de>
In-Reply-To: <20210105140718.122752-1-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 Jan 2021 11:44:39 +0100
Message-ID: <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing
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

+ Linus (GPIO/pinctrl maintainer)

On Tue, 5 Jan 2021 at 15:07, Marek Vasut <marex@denx.de> wrote:
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
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> NOTE: I would prefer this solution over having a custom DT per SoM,
>       since it reduces the amount of DT combinations.
> ---
>  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 32 ++++++++-
>  drivers/mmc/host/mmci.c                      | 70 ++++++++++++++++++--

Please avoid mixing DTS changes with changes to code in drivers.

>  2 files changed, 96 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index dc70ddd09e9d..a69cae19d92d 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -401,15 +401,45 @@ &rtc {
>         status = "okay";
>  };
>
> +&pinctrl {
> +       sdmmc1_b4_init_pins_a: sdmmc1-init-b4-0 {
> +               pins1 {
> +                       pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +                                <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +                                <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +                                <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
> +                       slew-rate = <1>;
> +                       drive-push-pull;
> +                       bias-disable;
> +               };
> +       };
> +
> +       sdmmc1_dir_init_pins_a: sdmmc1-init-dir-0 {
> +               pins1 {
> +                       pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
> +                                <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> +                                <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
> +                       slew-rate = <1>;
> +                       drive-push-pull;
> +                       bias-pull-up;
> +               };
> +       };
> +};
> +
>  &sdmmc1 {
> -       pinctrl-names = "default", "opendrain", "sleep";
> +       pinctrl-names = "default", "opendrain", "sleep", "init";

Apologize for my ignorance, but my understanding of "init" vs
"default" is that "init" should be treated as the legacy name for the
pinstate. I would appreciate Linus' opinion on this.

I am wondering if it's really a good idea to support both states like this?

>         pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
>         pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
>         pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
> +       pinctrl-3 = <&sdmmc1_b4_init_pins_a &sdmmc1_dir_init_pins_a>;
>         cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>         disable-wp;
>         st,sig-dir;
>         st,neg-edge;
> +       st,use-ckin;
> +       st,cmd-gpios = <&gpiod 2 0>;
> +       st,ck-gpios = <&gpioc 12 0>;
> +       st,ckin-gpios = <&gpioe 4 0>;
>         bus-width = <4>;
>         vmmc-supply = <&vdd_sd>;
>         status = "okay";
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

I think you can make this change bit less invasive. Rather than having
to shuffle code around in ->probe(), I suggest you call
mmci_probe_level_translator() outside and after mmci_of_parse() has
been called.

In this way, you can also provide mmci_probe_level_translator() with a
struct mmci_host *, rather than having to pick it up from
mmc_priv(mmc), if you see what I mean.

Of course, this also means in mmci_probe_level_translator() you will
have to check if MCI_STM32_CLK_SELCKIN has been set, and if not then
do an early return.

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

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
