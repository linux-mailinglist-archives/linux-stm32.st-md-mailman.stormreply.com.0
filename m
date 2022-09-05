Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E875AD9CA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 21:40:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3768CC0AA15;
	Mon,  5 Sep 2022 19:40:07 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6307CC03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 19:40:05 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 73so8799365pga.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=CBRkTEdupwBv7lUysuAAHCWeUeGOXoPs3goZlUKIChI=;
 b=AoB/BB+wDCEOf3ollKTlkOpFH5ZdJcaYtYObH7F+USml96PL05nQZdIxn7ekRew/5b
 7EIcLBlc3MsHwZ5Sf25zmIO3Px5fO4gvhdDaBRhf9uOzwFLARLpmd1bM870f8lIBNHD3
 gytJZ2ifVtaupmJ3QTM9/NdK15W4dYwrMCBg6SW65U1OqgtNyXc84pbod89bIQ6BXjDU
 8DjK9Glh1ftaKc4OO8CDr320e11XRL2oTkt0sdDZYfOg6PUIpHo4y/CMFZXvXzFkVUsb
 WSwJf6gJvfOXaQ8gaip6aWRNOqu2Fi4hdJAIEf0y3X+J6pOHAoM+5/JGDwZcC7JNH7er
 c8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CBRkTEdupwBv7lUysuAAHCWeUeGOXoPs3goZlUKIChI=;
 b=nMiojDvyeU/kcwKdJjV0I9m398WWYCHcz3J9LJWWEZyu0d8D4DP+M+Nh4mGvvNmklF
 fZS8pAyqX7cq3NJ8woYM+qHIkCFFMSAWxUWC2vxYq94SIz58tcfkH0QbOoGUOYIq9Uyu
 hHXtOi4Bet/MiPa15ZODbcdb/KugvuERbJJF46ekBBausOD/Yl7alHlb2R5yDaE56pOk
 0VYKOvvkMbWn85CdW9qU5xrf4vIXZsykPCKKZMU3C5aY3FEdKtP7s71rpnGrxMkrq0os
 BY+/8ohPD0/YTiaEVWQWX6gXd2TmeYlMMSU6mVB7YvdyTpkmLYSwEtT1LRQH86ksW/Em
 6NAQ==
X-Gm-Message-State: ACgBeo1rgpnxOYtxntMdvkLKgpynouPXGeUhGYauGT04gKKQq5MwPNgU
 1AoqXz7vVFatw+b+S9jb51o=
X-Google-Smtp-Source: AA6agR57aEnMQb2MM+YsWuK1Qvz4a+9OpUI4vj1PStOfsBOdRv0ywrZ084st51jWLHlWq8m5GTSO4g==
X-Received: by 2002:a65:6255:0:b0:42c:87b1:485b with SMTP id
 q21-20020a656255000000b0042c87b1485bmr29214848pgv.491.1662406803892; 
 Mon, 05 Sep 2022 12:40:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170902780e00b00176b4f9d871sm2199498pll.70.2022.09.05.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:40:03 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:39:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <YxZQj8bwJCx5rqDv@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 04/11] usb: phy: tegra: switch to using
 devm_gpiod_get()
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

On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> >
> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
> > wanted to set up a pretty consumer name for the GPIO, and we now have
> > a special API for that.
> 
> ...
> 
> > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > -                                                   "nvidia,phy-reset-gpio",
> > -                                                   0, GPIOD_OUT_HIGH,
> > -                                                   "ulpi_phy_reset_b");
> > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > +                                      GPIOD_OUT_HIGH);
> >                 err = PTR_ERR_OR_ZERO(gpiod);
> 
> What does _OR_ZERO mean now?

This converts a pointer to an error code if a pointer represents
ERR_PTR() encoded error, or 0 to indicate success.

static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
{
	if (IS_ERR(ptr))
		return PTR_ERR(ptr);
	else
		return 0;
}

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
