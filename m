Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D2467357
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 09:41:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2965C5F1DD;
	Fri,  3 Dec 2021 08:41:08 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C27DDC5F1DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 08:41:06 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x15so8651787edv.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Dec 2021 00:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uLBHn9jsbKV7jZYY7Dm+t8lPDQRTZnoOfAaLgWh49GU=;
 b=LsIAHi4O7+rAKszJKyJ/QwZwolqgX7Xp85HCfWi/OAlf7oOjExVQVB3A1uF6oJMxXi
 gPosTZ3PyRq9IbJKMX4ESqDGYZZYcom4XQ8JtyMRl5tOE7xlwAkd4FpJbONadp6pWo7I
 oUoB99whrPg0HGUqiRetXBExiz97qDkf5NdxXb1GpetgxbWitUxWw81WWVuMwB7DeHg4
 F4fsE0Im8ySC6EvPdTGuYxXIdnTwT10W+OMVEHRanF7YSviRe6CvO4rDs/Sfax7qLy0G
 GQ8KIQPRWvs0w82uwlN5lRnk2skx92g4UPLasKF6asjvNdNubK/yYeFyTDsn7OcD+219
 BK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLBHn9jsbKV7jZYY7Dm+t8lPDQRTZnoOfAaLgWh49GU=;
 b=UUCGTgD4gBqNPjb/aUD9U6TKt4YaFYmaQhUw1WU36zlJQZG1T8E+T1krpNNEO/QH1N
 fFr44ZkTI0Qi2NfPoIImN1DSOXH91Yj0wopj/+2S2/SMz0Dj9dtnBmcvgTVW+wDpyvvD
 y5u5svGCrhQdwUIFMgUGGLbxE7OAXAb00Teg5vcjjGcyoiTGtbykPx9azlLlsHYCQvPN
 AULJ+Soz4NZ6apvKnl/QCeeid2Z51oHg0lkwLJoAPx+jUKzR2LHRbPhU8eHzW3vUO5YE
 BOS5KshGOZmhBLOLToOvD4+stKZ8kc/6GijoLxlqZMwVALt3fZoZ1TzH82QT8SZc5wJG
 w96w==
X-Gm-Message-State: AOAM532iWi2IAhfEWzu/TdjXFfSog9XaYMpRcj31hAsedyZAcEc/ltf+
 OYmS8WwYKDMzghYcmtqaEY7Xr3+O3DLT2RWGmFn/yA==
X-Google-Smtp-Source: ABdhPJzNHiauf+pMC5f/US+c9OIXcWbcKMNg90ABw6xCvQOgNu83JV2BIOiQy03TdGH6uVMTEr4y57dSuqO0jiYbpps=
X-Received: by 2002:a17:907:75f0:: with SMTP id
 jz16mr22268827ejc.77.1638520866276; 
 Fri, 03 Dec 2021 00:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Dec 2021 09:40:55 +0100
Message-ID: <CAMRc=Md-TKUETLzf41D2KeQODac153_AumMTW4928XfJ70GRxQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Thierry Reding <treding@nvidia.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-pwm@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vladimir Zapolskiy <vz@mleia.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Gregory Fong <gregory.0xf0@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 patches@opensource.cirrus.com, Kevin Hilman <khilman@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/3] gpio: Get rid of duplicate of_node
 assignment in the drivers
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

On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

I have a bad feeling about this but I've gone through the drivers in
this patch and it seems like you don't update any of the drivers that
use multiple child OF nodes so I can't really point out any obvious
bug.

I have another change I'm working on that's related, let me send it shortly.

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
