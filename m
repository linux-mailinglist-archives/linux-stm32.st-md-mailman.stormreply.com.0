Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8855AD9BB
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 21:37:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE85CC55596;
	Mon,  5 Sep 2022 19:37:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 536E7C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 19:37:39 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so5709913pjp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 12:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=UX/1xWsBuUZKNpnGbmaCNyLgDKXUyHyjW7LSvfviiGM=;
 b=Jq6z0TjBOs+Trb+l/l0E6v2zXWY5HGZUjeUfFoj6h1dgSSPD3CMOMJzKW/FgRblSih
 9XKG/JuD76vNnuQGH4IReEwETm+svg5j/jghxR4WWjXAxOGp9pztBXjFtpMn9fKYvJDF
 mXDcmytCgAWXvi4BSG5pj9Y0FI8rlxUZq6PAQAUnNGkrMF0VrQAsHOOkpAHrZbr3nOJS
 i68fopwEQC0oJscyLwdmpyB8JB1DvXhZEhs94bZIP7npUYVRKyMbaEZFnY/EWTOyJFcw
 6eno1/ywfeqqOcLh7eCoxWyTJI1hItySN2zX1dRx/cdYZr0XNXm5Jc2yy3MvF+522GeF
 f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=UX/1xWsBuUZKNpnGbmaCNyLgDKXUyHyjW7LSvfviiGM=;
 b=x7K89PYQ1Xt64vg/KmdfERXgePaTRja//eCvNRXfiJbYrhRcvGMxlQwh6760rPgxhn
 967xScVxsKhm8UE5OclKzWRoafTORcIA03KX7jxJTu1/FEDNhFCfZe+EzES09myuTcuT
 2oovRS1Al0hxdwcYIxmzhf4rkpWPtEwoIw4qlc7xgB+8ZZdWgeiwaIaodM1I+Inde6ts
 mWLstGQHZ6h/cNypntBDAcv2JGBmeFHoyXBJN297XO6gbD995cvkUqIDRTJGHzs1J3Nb
 v0fDJ/LBEjkEwMZv48FixmdJWsp6MocSr6oPUrGRK6SvBHkxTQDkM/FLkfIffGqLaKUQ
 RBsA==
X-Gm-Message-State: ACgBeo113D9clGCxou5ixm+7RHC/5+DCmgRscCs1EgxEYulKuaYTz1Oj
 +lzRDBbEThUaes8Ws3dBNEU=
X-Google-Smtp-Source: AA6agR70u6IDqbN3XobJcWbGlwEoBHj5+DIO4sKvf09Hb5lknd4pdCEXQAQd60uZG48UmUAgfPRBLA==
X-Received: by 2002:a17:902:edd5:b0:174:a6e6:51f4 with SMTP id
 q21-20020a170902edd500b00174a6e651f4mr40804784plk.82.1662406657709; 
 Mon, 05 Sep 2022 12:37:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a170902e5c100b00176b5035045sm2216157plf.202.2022.09.05.12.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:37:37 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:37:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <YxZP/exeVD7DQ5Hx@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
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

On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > I would like to limit (or maybe even remove) use of
> > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > a bit, so let's switch to the generic device property API.
> 
> > It may even
> > help with handling secondary fwnodes when gpiolib is taught to handle
> > gpios described by swnodes.
> 
> I would remove this sentence from all commit messages since it's a
> debatable thing and might even not happen, so the above is a pure
> speculation.

I have the patches. Granted, I had them since '19 ;) but I'm rebasing
them and going to push them. I need them to convert bunch of input
drivers away from platform data.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
