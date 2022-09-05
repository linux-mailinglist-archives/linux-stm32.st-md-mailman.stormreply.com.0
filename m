Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC65AD632
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 17:22:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47AA6C55596;
	Mon,  5 Sep 2022 15:22:20 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CF40C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 15:22:19 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id b2so6454702qkh.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+ZiqcY4iwW4z7/E7mCAKrjs2qkOwesFoeuU+408Ac8o=;
 b=VFmGFDTElC9gVBP4IH125hq51A7FGr51vQ9KGLGqsDH5FAEMbMbUXIVHi85ww+a0fI
 GziSfVv/AV96vVMyihm0a9WLMAOVaqURD6Z6C0QYsgp+rD6u9b5XKuySpRwB9/4ukD5r
 ntRcngBKUZIdj1p7dnKxVpS61IIJC70YsoWsdaYgU3yQ1OeaPC6Dp8pG57kfBWmOL/93
 L/IFFf00dHT3zgOp5UKnif6AxMU2wmHM+SIXzgJwfA+idsrUzSPhTV0Cy8bk19HNDekI
 +ldaJp7J0Y+v4fVjKkwUglDoR826zDL6l5uW2KrYqW3xGquKc2bpuTp1y4lh/YVJ6mAK
 GUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+ZiqcY4iwW4z7/E7mCAKrjs2qkOwesFoeuU+408Ac8o=;
 b=0zsEjCi4tqWlDYwV1ZYK51GDwUwHxoi8rKbSHLoyZWN0FPg4C/nEHlgL65Cij6Ftn0
 lBF+EgE9wnxfZ6X+4/dvfcAoCDxOOX2kmhEOK+hh2pbC1ydwQ5QkE9SJzz+ZP1RKd43E
 ViJ8L6UZZuombHDNwqGd7BjgUqbA9v/z5IcfDcYlmmYPlZEk1c/uQC/IIWHRAvPp+4su
 BL/iBYabRgD9ukXfepPeait43abr8hfjQreegjb2gTIPabFeg9xkbI8mkKcHttTY77tO
 bH5OfKp6KFje6lO02MpUxdC5CHDMmNNKi9YQxfvZJGcu40+BuM+ms7X9mrogrT7MrKVy
 sS0w==
X-Gm-Message-State: ACgBeo2rJJeUIKFmfM4d74/pkI8WUs/tli7V2PxKX/OMlpPZqU0QXQu7
 1YzrieyrUSYKhRidu//qbBRFJdTotSCwTfD5XXo=
X-Google-Smtp-Source: AA6agR6eqDleGJQNbmaUKo+DXkG0Owzp6XfxQg6gg92/7A34V7uBDxuh7YdkC5fcKcuRE7T6e8KsWIJlWSuvkZ2TzuU=
X-Received: by 2002:a05:620a:410e:b0:6bc:5cdc:88ec with SMTP id
 j14-20020a05620a410e00b006bc5cdc88ecmr33187504qko.734.1662391338268; Mon, 05
 Sep 2022 08:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
In-Reply-To: <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 18:21:42 +0300
Message-ID: <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH v1 10/11] watchdog: bd9576_wdt: switch to
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

On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 9/5/22 04:09, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> >> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> >> +       if (count < 0 && count != -EINVAL)
> >> +               return count;
> >> +
> >> +       if (count > 0) {
> >
> >> +               if (count > ARRAY_SIZE(hw_margin))
> >> +                       return -EINVAL;
> >
> > Why double check? You may move it out of the (count > 0).
>
> Two checks will always be needed, so I don't entirely see
> how that would be better.

But not nested. That's my point:

if (count > ARRAY_SIZE())
  return ...
if (count > 0)
  ...

> >> -       if (ret == 1)
> >> -               hw_margin_max = hw_margin[0];
> >
> >> +               ret = device_property_read_u32_array(dev->parent,
> >> +                                                    "rohm,hw-timeout-ms",
> >> +                                                    hw_margin, count);
> >> +               if (ret < 0)
> >> +                       return ret;
> >
> > So, only this needs the count > 0 check since below already has it implicitly.
> >
> Sorry, I don't understand this comment.

if (count > 0) {
  ret = device_property_read_u32_array(...);
  ...
}
if (count == 1)
 ...
if (count == 2)
 ...

But here it might be better to have the nested conditionals.

> >> -       if (ret == 2) {
> >> -               hw_margin_max = hw_margin[1];
> >> -               hw_margin_min = hw_margin[0];
> >> +               if (count == 1)
> >> +                       hw_margin_max = hw_margin[0];
> >> +
> >> +               if (count == 2) {
> >> +                       hw_margin_max = hw_margin[1];
> >> +                       hw_margin_min = hw_margin[0];
> >> +               }
> >>          }

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
