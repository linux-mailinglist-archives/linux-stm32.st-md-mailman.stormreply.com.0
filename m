Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D646888C
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Dec 2021 01:06:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53C4DC5F1D5;
	Sun,  5 Dec 2021 00:06:21 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9754C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Dec 2021 00:06:19 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id m6so13826526oim.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Dec 2021 16:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLM7Vzy6+wcFi2+uw4mY6eHdc1c6QIPZ2YzBFSeQVDk=;
 b=oypqQM9WYczOUD8yOv4W0b0J4SdrSIP2/GWFE4TR5k1CGEkHNy9WPiO008zNzsg3Pz
 zh9bUtf/VG6/b3zJ480BiJtwEa7PuEjsHQIWuEsggMdMqcZfJwsOE3iFtiG2DEPADAsO
 hqFPrgRv7CWtgQ4J5ZJRkR9iA1oQHlUoWYY8QDKpr7VM+f+8Yrryge0w8oCSslRvNp+6
 exKWbX0iHLd50+WQaM9fAnPeBnEozwwfUcCOKBUJC5pSMVg0d33S/UEK3rrGtAaDpFWu
 Uv4am7V67+qDJ2gKBQwHEmdYiUOqE7eMf4wLG94y+RQ3YPpVsZKN31tRHAbmVgDqfwLj
 frKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLM7Vzy6+wcFi2+uw4mY6eHdc1c6QIPZ2YzBFSeQVDk=;
 b=ReQwWOpirE/REBbJqsxknRrhkUtC9JN8E6fDWjWxFkevJ1ljnuv8lpjS7ZoK72fLVu
 HgdmNVeVd475HpyTbebj7PKXtm+lncuZplUrsMoRZt5T/aufnUeCA7/N2U1JgpGFCqkg
 yEibSxFVWvL7TXupnS+JQ38l+BrTihVqRZcY8hLwr33xcSLygcvAr8POLKoVbP/Q9Xup
 gHgB8mUE8BtgQ1TD5KTP9ENBd3+be0L3CtF9EknY5qqjgr2XyYQedqizkFzKZXAxsqgn
 tHXkqldD51cDd5jeTSdG7O+hFsyq590/75n+m+4Ot1HnGlYp51TMMVxq80seIB0fsn7c
 CLuA==
X-Gm-Message-State: AOAM530R5O5ddpjT+ekQ44joskYHB4bqeMITFsYX5TsFuddGerpTacwF
 9ealXvlyWgLF/dTogIt4UXL65nChdNopT/gfAyWZ2g==
X-Google-Smtp-Source: ABdhPJy/aeGs123LiAIPsyMW3EdsawUgHdqxl5iex8vMswm1x7JAmAebxj9z1jBeNmQdoS/RXvDPX+AOcq/DNJTtHIA=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16602417ois.132.1638662778472; 
 Sat, 04 Dec 2021 16:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Dec 2021 01:06:07 +0100
Message-ID: <CACRpkdZbpKqG_uS2N8TW2-HL5CqnuKDpHVCabf66MyQQof0jOw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>,
 Tony Lindgren <tony@atomide.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-rockchip@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Alexandru Ardelean <aardelean@deviqon.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Thierry Reding <treding@nvidia.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-pwm@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Gregory Fong <gregory.0xf0@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-unisoc@lists.infradead.org, patches@opensource.cirrus.com,
 Kevin Hilman <khilman@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Keerthy <j-keerthy@ti.com>, Baolin Wang <baolin.wang7@gmail.com>,
 linux-power@fi.rohmeurope.com
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

> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is definitely a patch in the right direction, as Bart says
it can be a bit dangerous, the outliers are those drivers that
assign the .dev to something completely different than the
the dev where the of_node is copied from.

The idea was definitely always to only assign it in the core
*unless* there is a reason to have a completely different
of_node for some reason.

> +++ b/drivers/gpio/gpio-rda.c
> @@ -240,8 +240,6 @@ static int rda_gpio_probe(struct platform_device *pdev)
>         rda_gpio->chip.label = dev_name(dev);
>         rda_gpio->chip.ngpio = ngpios;
>         rda_gpio->chip.base = -1;
> -       rda_gpio->chip.parent = dev;
> -       rda_gpio->chip.of_node = np;

Mention in the commit message that in this driver
you also drop the the .parent assignment because the
core will handle it.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
