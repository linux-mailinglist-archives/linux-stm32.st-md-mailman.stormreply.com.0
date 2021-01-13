Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AEC2F4A3B
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 12:39:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44FF8C56635;
	Wed, 13 Jan 2021 11:39:30 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AA57C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 11:39:28 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id s2so936390vsk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnJvzz1onvjf/ovL1HapCYJD/m4iJ8h4N/uFHWbTT5Q=;
 b=qmXilFV2jORIehQZZQ++Yc8/7hBNzXdn4lef9aaXCovusRWiUeAKi+9BxRR7X4i2BV
 IjqDtIW29mesYumIU5lrLKxUmkRq+glX3yc3G5Sc5+ONN3t5EU3l9gtNQQVHi+jrGBbf
 Bip+f75NnDfs6/P4uKNeAyQ3FGiRjcNFAmvqIYY+SIC4gA+NFwu9nZs39mMdfLuZ4qpV
 fXIcxjwbdHVP8PqHmut02ARRVhgy6PWn0U7cgstolhnXyCSUlsjw6j3/OLCj/ethWXPM
 56wEbujAv5ElZp3bzepzDtv+QfZfdleiyYnh23EdjDgpm8q1KE+qXyHUQJ9cJXwelJJX
 gS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnJvzz1onvjf/ovL1HapCYJD/m4iJ8h4N/uFHWbTT5Q=;
 b=dCXCw3SMdc1KMHMqVUed2KkHRZ4muM6js0F4m9EmpIVXhm3jQ4GeNapNs3jJ/M4K7H
 +6dcTGsoVZ8S6ty9zluSWPQlZJ/iNELdEZFDIx/yxdUbW15/XaPYpqIV+bwixTtkQ5y/
 I+hW1cFTIgHQ0FlAnR95ovBNVk/is3NellmbaWl+nKbVjBLekfkcS34xcbzNWSko0stE
 hSs2hBosKzB8YjDTJB0qWxA8MLQGivXJews5V0SxCWIyALqWMY6rFaZ3wdAX8Ly4qiB5
 pdpaOKtIUnPpkS0etZdVihsp0+n1dPCWUOw/nmXnbQ3WSsmdj0/Z44QRMvlansB1ostC
 0g2g==
X-Gm-Message-State: AOAM531Cj8GCDnC9TyroTX4/5/vjRkjPFrxF9j7VAaCIcQvV/7PIaqC+
 dwNPle2cRhBwz/CErBy9UwBvnELLhJxSth+/fzne8A==
X-Google-Smtp-Source: ABdhPJx4S/BIeSIjCYMnkwf3JxdYaOGYDFl17mvox5ktXMbxztu2q0aTGetaE0lOlKARgT91O0X3uTgeBiXzmmM6wUg=
X-Received: by 2002:a67:7f41:: with SMTP id a62mr1419027vsd.55.1610537967081; 
 Wed, 13 Jan 2021 03:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
 <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
In-Reply-To: <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 Jan 2021 12:38:50 +0100
Message-ID: <CAPDyKFo5Sqxj31owrnmz1sTZqgW_PtZM2H=pDPBz+9hc0W0hHA@mail.gmail.com>
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

On Wed, 13 Jan 2021 at 12:34, Marek Vasut <marex@denx.de> wrote:
>
> On 1/13/21 11:44 AM, Ulf Hansson wrote:
>
> [...]
>
> >> NOTE: I would prefer this solution over having a custom DT per SoM,
> >>        since it reduces the amount of DT combinations.
> >> ---
> >>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 32 ++++++++-
> >>   drivers/mmc/host/mmci.c                      | 70 ++++++++++++++++++--
> >
> > Please avoid mixing DTS changes with changes to code in drivers.
>
> With RFC patch you likely want to see the whole picture, so I kept it in
> one patch.
>
> >>   2 files changed, 96 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> >> index dc70ddd09e9d..a69cae19d92d 100644
> >> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> >> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> >> @@ -401,15 +401,45 @@ &rtc {
> >>          status = "okay";
> >>   };
> >>
> >> +&pinctrl {
> >> +       sdmmc1_b4_init_pins_a: sdmmc1-init-b4-0 {
> >> +               pins1 {
> >> +                       pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> >> +                                <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> >> +                                <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> >> +                                <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
> >> +                       slew-rate = <1>;
> >> +                       drive-push-pull;
> >> +                       bias-disable;
> >> +               };
> >> +       };
> >> +
> >> +       sdmmc1_dir_init_pins_a: sdmmc1-init-dir-0 {
> >> +               pins1 {
> >> +                       pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
> >> +                                <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> >> +                                <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
> >> +                       slew-rate = <1>;
> >> +                       drive-push-pull;
> >> +                       bias-pull-up;
> >> +               };
> >> +       };
> >> +};
> >> +
> >>   &sdmmc1 {
> >> -       pinctrl-names = "default", "opendrain", "sleep";
> >> +       pinctrl-names = "default", "opendrain", "sleep", "init";
> >
> > Apologize for my ignorance, but my understanding of "init" vs
> > "default" is that "init" should be treated as the legacy name for the
> > pinstate. I would appreciate Linus' opinion on this.
>
> My understanding is that "init" is the way pins are configured before
> the driver reconfigures them to whatever the driver needs to configure
> them to. The "default" state is the normal operational state of the
> hardware, which often is the same as "init".
>
> [...]
>
> >>   static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
> >>   {
> >>          struct mmci_host *host = mmc_priv(mmc);
> >> @@ -1913,7 +1973,7 @@ static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
> >>          if (of_get_property(np, "st,neg-edge", NULL))
> >>                  host->clk_reg_add |= MCI_STM32_CLK_NEGEDGE;
> >>          if (of_get_property(np, "st,use-ckin", NULL))
> >> -               host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
> >> +               mmci_probe_level_translator(mmc);
> >
> > I think you can make this change bit less invasive. Rather than having
> > to shuffle code around in ->probe(), I suggest you call
> > mmci_probe_level_translator() outside and after mmci_of_parse() has
> > been called.
> >
> > In this way, you can also provide mmci_probe_level_translator() with a
> > struct mmci_host *, rather than having to pick it up from
> > mmc_priv(mmc), if you see what I mean.
> >
> > Of course, this also means in mmci_probe_level_translator() you will
> > have to check if MCI_STM32_CLK_SELCKIN has been set, and if not then
> > do an early return.
>
> Testing the translator presence when checking whether its enabled in DT
> seems like the right place, but that's really just an implementation detail.
>
> I am more interested in knowing whether adding
> mmci_probe_level_translator() is even acceptable in the first place. Is it ?

Honestly, I don't know.

I think I need to defer that question to Linus Walleij. And of course,
it would be nice to get the opinion from Ludovic as well.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
