Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D472F1A96FF
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 10:41:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71A94C36B0C;
	Wed, 15 Apr 2020 08:41:01 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70A33C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 08:40:59 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id y15so1738256vsm.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=omiGcsbKasYfX0xBbG+LJDV61G+OkCUsHwRpvQU4/dA=;
 b=rpdc6/7iEbpudnJRWnzdPPfcNHEK7QaAySAG1RrxtTnHM3yN1LVdB53uR7mf6PeZCZ
 0zgVtIIaclIrrokiRmDuNQI+VexcnktXC/gps9oyw0rm75pS5hlIEIHhuuVNqrYIdy85
 J5wZz9Dy3pBh01Hu6KRzpmbvYADvMRLVf8mSiBUYdSbUOarsim7a1ciJMthY4cR8hnri
 UpsmLnXwNNv1zFy/fYTXy0qmZ0+8MZ1Q6MYCZnUcKQT5nXRmaOu0sYe3NzzKCMG9Q0zI
 zTtke6lX+TXtkQNZDCzjSqjAN9r2bvGHwH5bY0FLtIoZrBKR0FG8U/FuiLfTj2dmLah9
 Es6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=omiGcsbKasYfX0xBbG+LJDV61G+OkCUsHwRpvQU4/dA=;
 b=FmD5UbrRm6s1yL7oCDWgDb81C02aUaEab/tU9nFvGXClBG/D2NIFJkqD/ty7a80e9L
 Uq5GLLUJ74hP3IAefHP0Lu+k8TLqOYCMVzel6nNidPlFBvoEU9J0U2KLACO+08DwPQt4
 Wjcf7guxy0IJuxXrQ+3CJPg5QLncT40D41cXps3EbNPD7y2kJV6gzg+Vc9COWho9u27p
 5f6nBu7GLU7Y7zuVSdZY08b/tD0E4UW3G1o9MulfdrDmpObOHWTPaCgSwljx8KtjCur7
 OYvw433rC1E/P2OtPRL9AyC7yS+A4zPFf+ZU0Z131Fl68mVZBhdOO9kRS3dyAggcdeZj
 cu5g==
X-Gm-Message-State: AGi0PuZHtgeBqFIDHhCBGDSwqkQEbaGd5+QGqu5iyfpEWgIY8ToGDTMm
 eJre/xCcimYmENoDm5JTDvi+VCws2xjy4wn33oiM+Q==
X-Google-Smtp-Source: APiQypKcS0T2Z05H58zalH1qbLVM4cPc7n1LTo5L/Z7jjHdRiPL0qSstLEaPV0uMvhkoKpRXznncsD8/tMqeuTb7mGE=
X-Received: by 2002:a67:f24b:: with SMTP id y11mr3508054vsm.165.1586940058296; 
 Wed, 15 Apr 2020 01:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200401195722.208157-1-marex@denx.de>
 <20200401195722.208157-2-marex@denx.de>
In-Reply-To: <20200401195722.208157-2-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Apr 2020 10:40:22 +0200
Message-ID: <CAPDyKFohHXW+5G9PTjXdvFevbx6JDOUue9+6+Ck9na36B0sH5w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/3] mmc: Return 1 from
	mmc_set_signal_voltage() if switch skipped
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
> Adjust mmc_set_signal_voltage() to return 1 if the voltage switch was
> skipped because the regulator voltage was already correct. This allows
> drivers to detect such condition and possibly skip various voltage
> switching extras.

This change to the code isn't about mmc_set_signal_voltage(), but
about mmc_regulator_set_voltage_if_supported(). Please update the
changelog to reflect this.

Moreover, as a part of $subject patch, you also need to adopt
mmc_regulator_set_vqmmc() to cope with the new behaviour of
mmc_regulator_set_voltage_if_supported().

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

If possible, please drop all these, as I don't think we need them as
references part of the patch. Of course, it's easier for you to keep
them, I can also drop it while applying.

> ---
>  drivers/mmc/core/regulator.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mmc/core/regulator.c b/drivers/mmc/core/regulator.c
> index b6febbcf8978..2805ea8a070e 100644
> --- a/drivers/mmc/core/regulator.c
> +++ b/drivers/mmc/core/regulator.c
> @@ -136,6 +136,8 @@ static int mmc_regulator_set_voltage_if_supported(struct regulator *regulator,
>                                                   int min_uV, int target_uV,
>                                                   int max_uV)
>  {
> +       int curr_voltage;

Nitpick: To be consistent with other variable names, maybe current_uV
is a better name.

> +
>         /*
>          * Check if supported first to avoid errors since we may try several
>          * signal levels during power up and don't want to show errors.
> @@ -143,6 +145,14 @@ static int mmc_regulator_set_voltage_if_supported(struct regulator *regulator,
>         if (!regulator_is_supported_voltage(regulator, min_uV, max_uV))
>                 return -EINVAL;
>
> +       /*
> +        * The voltage is already set, no need to switch.
> +        * Return 1 to indicate that no switch happened.
> +        */
> +       curr_voltage = regulator_get_voltage(regulator);
> +       if (curr_voltage == target_uV)
> +               return 1;
> +
>         return regulator_set_voltage_triplet(regulator, min_uV, target_uV,
>                                              max_uV);
>  }
> --
> 2.25.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
