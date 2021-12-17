Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8908E4791F6
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Dec 2021 17:54:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 351B0C5EC6B;
	Fri, 17 Dec 2021 16:54:14 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F34B5C5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Dec 2021 16:54:11 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y13so10030804edd.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Dec 2021 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ty3idGCi5XDl9xKvErHWNjIC6p7/NuEe9TiwxcVy8Us=;
 b=u9I1oPvsJNdQBSYXsGSVFvOEzPGh8YHNrcZyV4Kd4Ux0b007WnOatjgAjtpO7ElHj+
 hGmuiwerkfDuIqCHLAo613SY2tvmSUxTdYM0wU8p9QmiQVr9m9JA3Naueo3Yfodz6PXK
 87Kghc+eG799moXmgTvzehIou/OBfRSxy6uKhrkhotiEqkh8JRKrsnfTTnYL5U6M1B7t
 FETyeoncmUeYZBM045702egEznZCU4GjmYR8491uENA8sjto4EZdTiZlL58Y1yKTVgEN
 CaZJ582PxifNLXiMmL7WreCUCgOo3GYwkOWTOTqbS20yiN2i6DT8eADFIDVoM7GOLwCY
 9cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ty3idGCi5XDl9xKvErHWNjIC6p7/NuEe9TiwxcVy8Us=;
 b=7+J62TI0nmT/UOC6MX/EDof2VUeaZila3kkoNcc/gfZr0fBjYLnDRpXNwPa463AxBU
 2SJS6T4KbboUruLrwCqmLKjZO/jB7ghtPP0tnblK89HbirRU94ucsm/68CtawqwKWuGV
 U5EKeqV9mh1TzfsCshF1HusVKYY61GLYbwQm6l++6YVgSbBoNZkjxka1ZTTiiDVIYiWW
 5mVh48Bu8YyMnxHWoRTagXtaahXT443ul5FnpWRwDrzFORD/n9sZWjZYIX2dT6NWaKSB
 TMALXG4iKl96LS9j3Xd1EFGARFW52FdgwxeC9FNUdt1RUnv0a+0Mqi+2er8zs6sNXABH
 c7TQ==
X-Gm-Message-State: AOAM530U0rG8SqI9oEf7GLLnUVQJ9aZorTbKlGnSIqF0C157//DZ9RPW
 4WmUblVeB3Si/Z6d5woOOeCpTp5YsPhC7+XnUkO2SA==
X-Google-Smtp-Source: ABdhPJx8NgewPvw8C9vg5xgAqhhQeH0jCc31PRQMmf/5wN37PHnQyAoHsmmMeZhdRGMORIs9EvU83ilcsDAuLWfaiLU=
X-Received: by 2002:a17:906:249a:: with SMTP id
 e26mr3225602ejb.492.1639760051506; 
 Fri, 17 Dec 2021 08:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Dec 2021 17:54:00 +0100
Message-ID: <CAMRc=Mct9FuYvT-0gFrpUuNBnCVdmCp_cNESkL5NSgVVP6vezQ@mail.gmail.com>
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
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
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

Queued the series for next, thanks!

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
