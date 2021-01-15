Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2CC2F88BA
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 23:47:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FD05C424C0;
	Fri, 15 Jan 2021 22:47:21 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B22E4C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 22:47:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id b10so12060595ljp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 14:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JcunmaqxuV2RjWZuDakfWhxW78qDBNreP2tnmJNECY=;
 b=d4cYqIaW97sNeqddOMl6t4zbFsfSnOz6l2Q+adKCLOAKFDpIAwrp4SOPaWqeHFINIU
 p0WEJ/wlkhYhPTATAknESy/DdAq6dQDpR++DmECyVPZS0ylMaljSXvWVCgwT+DZkxLcz
 zSuk4wPeiFMLfPplPY4ifSjk/J/e5ucJLsw1//4KxGcCdiBdvM/k64QUULCZQtQuksFI
 rhZAo+mh8k959nEuIsEHnIqLhY/HMuLXo3Embd2c2GB4jjO9W2Zx/RwFLMnEFwdeIfRO
 coSfZFhysKyh/3uGlmheComNtQuz5QAONiMlcORVXOaL0JUmd/5lhMWN9ER1DZJngKgV
 RkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JcunmaqxuV2RjWZuDakfWhxW78qDBNreP2tnmJNECY=;
 b=DV6ULuf2LY6tP5RKxGyccywDxkrUNnxn6QQUo/sgwfCpNIa/0XATGVjBBGH+DALAF3
 4/BSz884dHCUW9VsjrtOQ00LI8Y3jlTYlg7XGxiq0QlBfqiR79umKF18V2ebXYC4xAXj
 uBsCSDyz4icLtwlmMttEyfUpqKMVxO+rAtAm5jFtTq35p0tBe/H1wcexqlWsG4MjOxGc
 LadzUiqho0ocbF9TH/L7O0h5gwA4yapGWbVIKCvrtrPEy7YKvcWhK9JPMMEjVQk3WTXH
 D2ijyV6JbVTn+wwpfGLgQ4OCtKQ1A20ra16zVa0Vk+ly/dvsoCYO2Qz9wKH8cATq1f1H
 +uSg==
X-Gm-Message-State: AOAM533cDJnYmnTpnOzsWC1NE9/XVS//YlIM/DpwYp+v15RCF/4sVWdP
 NRvMxajvHSLAPWUWiAbHsm3xRWsJzrRWO/FulxwDhQ==
X-Google-Smtp-Source: ABdhPJywHaYa2mFTmpDpAbt8I8/ZgHBOUBv+erYIpLSkGqiPcPpS/VQ3WtQXK20h9hLlVX/yH4Zxxq2jd8LM80+6p/g=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr6180188ljj.326.1610750837816; 
 Fri, 15 Jan 2021 14:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20210105140718.122752-1-marex@denx.de>
In-Reply-To: <20210105140718.122752-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Jan 2021 23:47:06 +0100
Message-ID: <CACRpkda618dRmXKwJyvONoF1Bn-AOZRjaJfVCVPpPetfZny5xQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
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

Hi Marek,

thanks for your patch!

In general this patch is pretty much how I imagine I would
have solved it myself. It's a really fringe situation but STM32
is pushing the envelope with this block so here we are.

The pinmux core is definitely designed to handle stuff like
this and I'm happy that it seems to work for you.

On Tue, Jan 5, 2021 at 3:08 PM Marek Vasut <marex@denx.de> wrote:

> NOTE: I would prefer this solution over having a custom DT per SoM,
>       since it reduces the amount of DT combinations.

I don't see any problem with this approach.

>  &sdmmc1 {
> -       pinctrl-names = "default", "opendrain", "sleep";
> +       pinctrl-names = "default", "opendrain", "sleep", "init";
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

Fair enough, when submitting the final device tree, add som verbose
comments as to what is going on here so people get it.

I got reminded that the MMCI bindings are not converted to device
tree so I spent some time on that. I will send out an RFC.

> +static void mmci_probe_level_translator(struct mmc_host *mmc)

This probing function looks good.

>         if (of_get_property(np, "st,use-ckin", NULL))
> -               host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
> +               mmci_probe_level_translator(mmc);

This activates the probing based on solely the existance of this
device tree flag.

It's not a problem in this patch but we should probably only look
for some of these attributes if we determine that it's an
STM32 platform block.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
