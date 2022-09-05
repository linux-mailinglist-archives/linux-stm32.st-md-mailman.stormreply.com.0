Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F885AD3C2
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 15:23:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2321C0C920;
	Mon,  5 Sep 2022 13:23:44 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4378C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 13:23:42 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id g16so6257643qkl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xqnaWRmSxWCHIXi5Qlq2gni2AdAVZeps2ahh12VkulY=;
 b=nOletpYDW/GRPvkaWSlAC0rzt34URfVHbiUKwVMsxFl09VUwy8XOqhWqRsptamq/Dg
 II+253/l3T6DgJP066py1bWTdICT2vRCXvzy2Ur+pO4VC493+7Sqn84yvDmlJFGAVdYl
 5PZSVDMi1QDxBMQa2pV/FSXYTAwvX/lFVcFPmgHoO3U8MnbkwA9h7jonAO1nFwBsGmoW
 q5f2ZglIOVt/xEgJLA6EBKdc3gOuFnoMDDVILIKTeoTg7qTOPypEYwVwaO1cq1N6YfbI
 me+dt6lOnpM5B3FzI09ooPbgjOvgXIow30OcLwUv/NaL/eE7AkZh0zMQ2HIMHBfa4q7S
 WwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xqnaWRmSxWCHIXi5Qlq2gni2AdAVZeps2ahh12VkulY=;
 b=q6GEPGa0Jpu2bOvH6pd5KSIGP/DTHMxJkBoGGE3ogFEFESUo3i0aMKNOSNmkQvL38R
 JTh6P+FvjOX1Q+mTJt2dpuq4r92kivMA4OgI+bExWEgkpgKNtpBT4I+7h2T9D+5HxVUz
 BD6q2j+o1frNt8qh4mG6SwDm6/VfAqlPkLtKHZ7RyTCVR7QtNovnfS27h1hONw8GEv9e
 OTbteDAX+2k3meKzJHh6zauU/ziGWgn8Jcjs6ZraKdbnfFkxhOdCLXuqWOM5n5Y+B1cr
 NKGHNXbrcmfdnyX4UUCGNC81OxqO+9GCQIoP3Vdk1fUS9Kg2icwsJ4whvZADx04RFAil
 0cOg==
X-Gm-Message-State: ACgBeo11x43zv/lbkZd/OGniXUUEeUisUGli5hef5Qv77GFqvmrJtoHO
 /eJ5G5q+T7oLqNqwHrgPmJmVhyzFFpY0bjlj8nk=
X-Google-Smtp-Source: AA6agR5sttgUX/02ygd4oRH8E7CwuO10nDnWttnl6PSpdnCic7gOwb1KDafibQkxIBgdBbgVXC2AwvPX08spe4Hyycw=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr33223900qkp.504.1662384221554; Mon, 05
 Sep 2022 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
 <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
 <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
In-Reply-To: <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 16:23:05 +0300
Message-ID: <CAHp75Vek1WOyEdkfCgrcH2FL6GA5gTtxXaV5Qy9aJMCQ3qGxyg@mail.gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 09/11] regulator: bd9576: switch to
	using devm_fwnode_gpiod_get()
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

On Mon, Sep 5, 2022 at 4:19 PM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> On 9/5/22 13:40, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> >> +       vout_mode = device_property_read_bool(pdev->dev.parent,
> >> +                                             "rohm,vout1-en-low");
> >
> > They all using parent device and you may make code neater by adding
> >
> >    struct device *parent = pdev->dev.parent;
>
> This is a matter of personal preference. I prefer seeing
> pdev->dev.parent - as it is more obvious (to me) what the 'pdev' is than
> what 'parent' would be.
>
> I'd use the local variable only when it shortens at least one of the
> lines so that we avoid splitting it. After that being said - I'm not
> going to argue over this change either if one who is improving the
> driver wants to use the "helper" variable here.

And I believe the quoted one is exactly the case of what you are saying above.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
