Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A945ADA7D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 23:03:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 313F2C640F0;
	Mon,  5 Sep 2022 21:03:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93D4DC0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 21:03:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id lx1so19135101ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
 b=RJtkdpcWwDCjdU//f+NiUTQJO5kz/J/LQ4Oeb8FsER0ooLc9TUWAVJHwh16h0rFR6k
 jDNxcAT6fUKAWlYXkDzi9PRVLGCFhao6TAvvqUzCLnc6J1JgrkOg//ZWPBTqZXz06MLe
 g/E79BtcrSCZXcou4vgp2IFBghrcFJpfeHS130JLJDTFGdRTjjJVv3m8lMFyySNYfbdn
 zyHSJi+z2sGr74Gs8Ferhg3qHw1Rm2Rd7LpNg2QiPU+rsqNYeELsa2ObuGU9YVxZktXI
 +EIJDXEMJp+8DP7PW/zCtw+WHI1pL0md9UYJvdO9U0CdYO9jo7gVaKjIjDEh/+/hHVoD
 fvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
 b=nARya3G96dJIQpIXFGxaExJg5sycMNUbKDxwq7tOAYoI5TvqH95Q+TG0juMtQ4OUDZ
 ttkvgEno0EBlRAgozcUP45ZgBU0of3d7ZX58J2Ss35NBsq12EhiSkA1QXO1OrFrCPO7F
 ExFZ0B9Snt5EexxjAL42bX3aO77/lM25070EXOXzTKdWKHlKbTZtWCyi6Kscp0G6nupe
 bcLfu9e5bJxqMI7vNB5X2gCW8MJmIpHiRLvoG5ihAyjD83/3bC7LhTeQ1pwazme6IIhy
 +0pLNxWRrOn0k80g1OrCWzuWwQgnURo2crb3FQmBUXenLo8wZr5efAHtNojQB3oSqyHh
 TzOQ==
X-Gm-Message-State: ACgBeo1ogvnVDXj5b6LhZ68SBTUFJjGOE8F5iSFdamY7TSddqU7UWDcf
 4x5thguH8HM1uQ19tRMpHoe9kdPPwpPnmnEA7h1wAg==
X-Google-Smtp-Source: AA6agR4GWSThcRe2jCNjPhluqCCYiE882sQv//p+YmHWCdk54XKDzjUOkiYoAS2W+owpznoWxs2VPch3w1ZAdKXk+5E=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr28207413ejc.203.1662411830025; Mon, 05
 Sep 2022 14:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
 <YxZP/exeVD7DQ5Hx@google.com>
In-Reply-To: <YxZP/exeVD7DQ5Hx@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 23:03:38 +0200
Message-ID: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 02/11] drm/tegra: switch to using
	devm_fwnode_gpiod_get
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

On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > I would like to limit (or maybe even remove) use of
> > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > a bit, so let's switch to the generic device property API.
> >
> > > It may even
> > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > gpios described by swnodes.
> >
> > I would remove this sentence from all commit messages since it's a
> > debatable thing and might even not happen, so the above is a pure
> > speculation.
>
> I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> them and going to push them. I need them to convert bunch of input
> drivers away from platform data.

That's good news!

Are you referring to this patch set mentioned in a discussion
from 2017 thru 2020?
https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/

I put aside GPIO descriptor conversion for input devices (keys, buttons)
in board files anticipating a swnode mechanism.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
