Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A64696C6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 14:20:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B53B6C5F1E7;
	Mon,  6 Dec 2021 13:20:06 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E2EC5F1E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 13:20:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z5so43214188edd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Dec 2021 05:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hvZZ98+ZsTYkg5d9GGJxZP1sUx5SwZWVJ8siiSeTEiQ=;
 b=2MOQRTdPkwhZdrDsZF8v1LkIe9VhVcu+CnHsKM9OdXefuBhdam0kh3pKuY/iXJ4jwh
 zU6Pi0uyyixDjjwk/OQSxSOoc3iQ4xccBh7VU5XFj2RJmmXBFIQ5+C1z5IVbt1IIXZI9
 dWJnZb7vMFYt3V5p/nBP65LNmmSKgBcIPbBTYhEdVlTDWAEZK/VS4uN6PLzPx/US5RWz
 mZbpnIm91JPS41EBzCzQXFGe1mimok+Yzh24z3yokPYDAKM6CqgeVZv0RUMAMUb6bGfj
 4BUxGDcldPfeerU2uRtK9S94iyKNhrpwRqnnngf6pKx2tQNdE8FduPUAGoYjZpp5I9Hz
 mHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hvZZ98+ZsTYkg5d9GGJxZP1sUx5SwZWVJ8siiSeTEiQ=;
 b=KiAF0rR5P78G5CwFBqygbvPa1mQsEuoR7oQRRdY8xymW+l2HEEsP6IUCllEsh0isWE
 X2JHciozdvdE9p/c4D3+Qr2BnbXINPNL7CJfJZ0yRwi5zoQhmoUDT7NmqHoYvMZUNWaM
 rsAfMXKTWRwsR6ZAXkmWa79vYG6P4AMI70wbIQ/P4okJ9bDdWfzJv/z6RfsvXeSN1taQ
 XN86vDhLDe7S95AXNjO3iCrIw/JnV+JJXnch1dbnnnkAp2pCLElA0PmHe/+bopmnpeY9
 pBVk/ADozCul5DQBwC+dne3JU6gItBDUFdJt+q5JWr/pV11qBpHVBFiSEBTVffQoEcRj
 0sKA==
X-Gm-Message-State: AOAM532n5vqgMDXuzkdHbOaTstc8/0aW42u4BhwA0KXYJsYW4TzZi6es
 5rjBmvSUAu9yj331QB+QYFKY1+ZUt9eDq0B3t1aAYA==
X-Google-Smtp-Source: ABdhPJxT2dlCIImgLcO5pXZfgOHvmQ1PFmCORP62C543H7xjg6esBcWHlJIUNIvBYImdxEeNXjaXGHzx8AiVjQpaFnY=
X-Received: by 2002:a17:906:7b53:: with SMTP id
 n19mr45793820ejo.538.1638796804233; 
 Mon, 06 Dec 2021 05:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZbpKqG_uS2N8TW2-HL5CqnuKDpHVCabf66MyQQof0jOw@mail.gmail.com>
 <Ya4MFMWSyj4YbdNG@smile.fi.intel.com>
In-Reply-To: <Ya4MFMWSyj4YbdNG@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Dec 2021 14:19:53 +0100
Message-ID: <CAMRc=MfHir4B3X=Hhkb1_VBQJFE17=YEexDa-+cs2LnFASPRkA@mail.gmail.com>
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

On Mon, Dec 6, 2021 at 2:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Dec 05, 2021 at 01:06:07AM +0100, Linus Walleij wrote:
> > On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > GPIO library does copy the of_node from the parent device of
> > > the GPIO chip, there is no need to repeat this in the individual
> > > drivers. Remove these assignment all at once.
> > >
> > > For the details one may look into the of_gpio_dev_init() implementation.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > This is definitely a patch in the right direction, as Bart says
> > it can be a bit dangerous, the outliers are those drivers that
> > assign the .dev to something completely different than the
> > the dev where the of_node is copied from.
>
> I carefully checked these all and this patch series is only for the cases
> when I'm sure it's the same device, which is used as parent, and its of_node
> supplied.
>
> > The idea was definitely always to only assign it in the core
> > *unless* there is a reason to have a completely different
> > of_node for some reason.
> >
> > > +++ b/drivers/gpio/gpio-rda.c
> > > @@ -240,8 +240,6 @@ static int rda_gpio_probe(struct platform_device *pdev)
> > >         rda_gpio->chip.label = dev_name(dev);
> > >         rda_gpio->chip.ngpio = ngpios;
> > >         rda_gpio->chip.base = -1;
> > > -       rda_gpio->chip.parent = dev;
> > > -       rda_gpio->chip.of_node = np;
> >
> > Mention in the commit message that in this driver
> > you also drop the the .parent assignment because the
> > core will handle it.
>
> Okay, I will update it. Also I'll update to the last codebase (dunno if Bart
> is going to pull the IB from Lee where one of the drivers is gone: da53cc634cea
> ("gpio: bd70528 Drop BD70528 support").
>

I didn't plan to, just drop it from your patch.

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
