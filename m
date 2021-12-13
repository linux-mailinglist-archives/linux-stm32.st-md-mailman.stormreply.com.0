Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B24472DE1
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 14:51:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F1FFC5EC6B;
	Mon, 13 Dec 2021 13:51:11 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CDACC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 13:51:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id l25so52689179eda.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JA6W9bf1908WD6cfFb6AhPYhGreRD1L3ZPU1ovM0YAo=;
 b=JR+DaCc5q3x/nJ52dLl6r+4FwSEv9WD0p7h6CAvJzuCN4LA6+wkAYifxMiKmhtGPMC
 FTN/0x8gYKn6C0DH+DPrgH6lH2w+WJEIfGDy1/YzVD0zU202RDccLQt46z8yx/mv5SEQ
 orFijgywNSCXDOJ/OPyq3mvh5NlrdflBnU+13ax6fE2dt0FQGfzQsQKPQMlWf12X6gYS
 H/d+nrvTinlxhp9IzxuZ3LhRXaM+23FWY9lMgayxh0hvEqluoQhfJStRiFE2+rfIOnQF
 Iw8LA3Ko152lC8tyud5LtFSKXRrJ7LmTPR7MzT1Pb8/drF5Zj0ygRhSQOmk3y0qr4lHt
 19ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JA6W9bf1908WD6cfFb6AhPYhGreRD1L3ZPU1ovM0YAo=;
 b=yvFWmlsLvhuP8earQBSTRPWUmjlf+j0GvCwfj5KS+jWuwZegaZeo19CLxIxhlNZ1Ci
 rQMFZeBoLE8sgdCMjJPyLKV16JxL9m1L+nMgK+D8PDaiwhDtsZRRjEcMiYhBe/DBxl1E
 I8eoguZCJjI0ryUbw5Pyn2PLuPdyv0ECrx3IPzOFDQAz/RjWLqkT4DCYFQFQ8MVctjg9
 atpoHhg/0sFRGMGEv+NMYg91JHcBi+BYtuyLuwGS1DZMbgI2IB463qoIg4deVxNnfoFv
 YxxLCq7bcQPaktmTrb2YqFZgGd34ySUxn5m2Iw9IyxZjxKqyTbvTlmDWjxyGGLqF6X6l
 MsJg==
X-Gm-Message-State: AOAM530JnsqtMkRaiOln//GePXAyCQFJuCUxDHF5x8EefMeOKZg+nq4r
 RTOqDPlczBa4djn6jOOFJ2LsJ6Q7VwwJg3UD9yvaEg==
X-Google-Smtp-Source: ABdhPJyUfRonKaOMYp5CA3+4Qguk6GD9f9+ENkQJ7XEThNqMIaIY/ZVhde1IxmgVdguaMtUOm8hj/b6kBh4NcjdyhEI=
X-Received: by 2002:a05:6402:354e:: with SMTP id
 f14mr63951085edd.245.1639403467922; 
 Mon, 13 Dec 2021 05:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 Dec 2021 14:50:57 +0100
Message-ID: <CAMRc=Meve=W3yvPmakFap-s6cOY1GUq7c1VjJE2dEH4f0+shag@mail.gmail.com>
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
> ---

If there are no objections, I am willing to apply this to give it some
time in next and get the work on dropping the OF APIs from gpiolib
going.

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
