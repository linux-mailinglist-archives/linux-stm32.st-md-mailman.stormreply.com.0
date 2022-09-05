Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFB5ADB21
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 00:08:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EAEEC640F0;
	Mon,  5 Sep 2022 22:08:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A360C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 22:08:36 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id r12so349303pfl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 15:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=5z1ooZsxXJhukGg5jtTnKIsDm0LxvDPLLdQBFIOg9Mo=;
 b=YgTpoNtQskYKJFiEm9roM8UsHLvYEBNA1mL8ijvR43dcIl3qE9TJ2QJ31Crw3ouUSM
 iI8m5cQ7oncVgCHnH06GZ7ixBdCItXBCOTQ0lnmtukCsaxmucAabTpdrPK7wJWhoEWT7
 cgfEiI7IXkgrurTPX8XkkJoSsKsg9OzznrhVAXoVVoMju1sc4m7PY17g3MSbb/mrzdVs
 e0eC6TEC3Uajc8BSqN8s3bXjyqbHUencfLf3ZSqIc6lxiBQcd3c3TAVmvjecPrYNaR0z
 fbBCLNGPTSjT+MdQuaaUYKGVdpkhWWf3pd/I4UIY2tn2zmhrhfXgmb3XRio80gdSixHJ
 PRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=5z1ooZsxXJhukGg5jtTnKIsDm0LxvDPLLdQBFIOg9Mo=;
 b=Dgx6/yeasP6wLz4yL8UDMEPi3UonPbK+YXyrnf6g8F24wvuUAzHQ03npoptQj414FU
 OiO985FdEVB5t9f2XxsTfLYETOGveBWzgNTC5b9QdNwwjTlSxNEDYZXZsCBrPiuDMQJ0
 Cq96QKFo81EtfhDr4BFKKbHwbYB+jh6zNg0cBlJ43IM4oA5ZdKKA8EyaQ/4R5ly8uDQT
 RhK/1N86wNDAplHS+bd52UHfhMiX5QwvBhOeUBEaDlTm9uFuLpZUPwluctYPCHkQABuy
 eIBWQ5+rrBN9oHhs48QGvLO9tDd9/e0MnzaemxGMEgZbXUnzkXEWwUXG+puUDjpZSwi2
 o/Aw==
X-Gm-Message-State: ACgBeo1knKpZfb35DNxK0s9zKdG5BN5/om6C9JjpQMsbpEo6FSuIa/c/
 Xn7osbDb9FGRBt1tZV0IyQk=
X-Google-Smtp-Source: AA6agR7YbREIA01VRSmP+zvXlY2q8iiOZpKUEqi6KFy5cemoOzMeF56ZDQMRUefeyhXXs1gJaKAhsA==
X-Received: by 2002:a63:4719:0:b0:42c:5586:de2 with SMTP id
 u25-20020a634719000000b0042c55860de2mr31993067pga.158.1662415714908; 
 Mon, 05 Sep 2022 15:08:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a170902710c00b00172f1d0825esm8092373pll.113.2022.09.05.15.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:08:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:08:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <YxZzXqJiOPDVmACo@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
 <YxZP/exeVD7DQ5Hx@google.com>
 <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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

On Mon, Sep 05, 2022 at 11:03:38PM +0200, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > I would like to limit (or maybe even remove) use of
> > > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > > a bit, so let's switch to the generic device property API.
> > >
> > > > It may even
> > > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > > gpios described by swnodes.
> > >
> > > I would remove this sentence from all commit messages since it's a
> > > debatable thing and might even not happen, so the above is a pure
> > > speculation.
> >
> > I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> > them and going to push them. I need them to convert bunch of input
> > drivers away from platform data.
> 
> That's good news!
> 
> Are you referring to this patch set mentioned in a discussion
> from 2017 thru 2020?
> https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/
> 
> I put aside GPIO descriptor conversion for input devices (keys, buttons)
> in board files anticipating a swnode mechanism.

Yep, that one, exactly. It is taking a bit longer than I anticipated ;)

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
