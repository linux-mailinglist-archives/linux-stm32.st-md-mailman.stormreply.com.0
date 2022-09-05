Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F35AD9DA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 21:47:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD7DCC640F0;
	Mon,  5 Sep 2022 19:47:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CDC9C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 19:47:36 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id 9so6061807plj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 12:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=G9Qf5nb4X9K1i84KXH4HdM00CRNAf5tzFBdtc+b4TKE=;
 b=cWny7dbbvfDII4XkGp5mcFhDW7xnoXHh4AKp8q/idS35yLNxXCSkBzhGNbyJdfKcgw
 I98s6U9AGgEVnvf/Otkfnonv1p93zecPAa1Wxa3KSM+UL95+uWumTNi/u3z4jHg0grzX
 JtIxbBCRknabFNdt+fjzwr65uC6OsrsW5a4sEZz0NEuBTvgOr4Bn6uiqxSSkgXONv6VT
 dMkF/Ehj96BrC/2YGY47othtHiCKBlZNyPsKpaY7eBC/Q5vm7GnaEikiaZ3BvOwvpZmX
 nN/ytcT90lHjiXGbNBizBZZroVETT+W7vOuh6f97BaXqY726iRuZQ2CjSiog5B/naWka
 hITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=G9Qf5nb4X9K1i84KXH4HdM00CRNAf5tzFBdtc+b4TKE=;
 b=gXBcRpb2hsYnjMo11PwpTQGjOR4RkffYIVdKGxuiTKKRvW7BALjmPeqCR7L1shzMi1
 t/FXQou9u1FF3sKgVbUaI/yp/GHG9lTY9+y26Sx7TweCUkMNxQ/QXZ0BzuSK5HbqgVYx
 hPniPtT5mXcpjIhREEoIyCSXAdMWxP8tLA5lfOWHy4uwykToUKLvXpiShe8C9aBrXDc1
 LpPaMNm1NkhDa+AjTTJaHtut0ajfxYh6tfdv9wMZaKhArwcM/v6yU5sOjFAgJ8D8+3ig
 d5/7IpJJ68aStxkxOxcEJ+co/FnRA62pPqwhnbd7Yzv1Czz0KgN+RATMqRT1T5tqkPbQ
 9MjQ==
X-Gm-Message-State: ACgBeo0ojIQ7BEkrK6A3i0aZIVZRFKOm4knKZqwVm4WJzG5DXswGBxr9
 dIeezRrls1PhDxn/afYvR/8=
X-Google-Smtp-Source: AA6agR4rG9EXV1E/55fesrVFOXE77lWvaBqXkzFJkUjVwNbVeqHEEiHG7UvgGt+kX2D0zKBcZVYK9g==
X-Received: by 2002:a17:90a:3c89:b0:1fa:acc2:bafe with SMTP id
 g9-20020a17090a3c8900b001faacc2bafemr21251569pjc.84.1662407254825; 
 Mon, 05 Sep 2022 12:47:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 v63-20020a622f42000000b0053e20a0333fsm27362pfv.93.2022.09.05.12.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:47:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:47:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <YxZSUlCPEE9o/s4G@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
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
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
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

On Mon, Sep 05, 2022 at 08:49:58AM -0700, Guenter Roeck wrote:
> On 9/5/22 08:21, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 9/5/22 04:09, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > 
> > ...
> > 
> > > > > +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> > > > > +       if (count < 0 && count != -EINVAL)
> > > > > +               return count;
> > > > > +
> > > > > +       if (count > 0) {
> > > > 
> > > > > +               if (count > ARRAY_SIZE(hw_margin))
> > > > > +                       return -EINVAL;
> > > > 
> > > > Why double check? You may move it out of the (count > 0).
> >
> > > Two checks will always be needed, so I don't entirely see
> > > how that would be better.
> > 
> > But not nested. That's my point:
> > 
> > if (count > ARRAY_SIZE())
> >    return ...
> > if (count > 0)
> >    ...
> > 
> 
> The old code has either 1 or two checks if there is no error.
> Your suggested code has always two checks. I don't see how that
> is an improvement.
> 
> > > > > -       if (ret == 1)
> > > > > -               hw_margin_max = hw_margin[0];
> > > > 
> > > > > +               ret = device_property_read_u32_array(dev->parent,
> > > > > +                                                    "rohm,hw-timeout-ms",
> > > > > +                                                    hw_margin, count);
> > > > > +               if (ret < 0)
> > > > > +                       return ret;
> > > > 
> > > > So, only this needs the count > 0 check since below already has it implicitly.
> > > > 
> > > Sorry, I don't understand this comment.
> > 
> > if (count > 0) {
> >    ret = device_property_read_u32_array(...);
> >    ...
> > }
> > if (count == 1)
> >   ...
> > if (count == 2)
> >   ...
> > 
> > But here it might be better to have the nested conditionals.
> > 
> 
> We know that count is either 1 or 2 here, so strictly speaking
> 	if (count == 1) {
> 	} else {
> 	}
> would be sufficient. On the other side, that depends on ARRAY_SIZE() being
> exactly 2, so
> 	if (count == 1) {
> 	} else if (count == 2) {
> 	}
> would also make sense. Either way is fine with me. I'll leave it up
> to Dmitry to decide what he wants to do.

My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
do not have strong preferences either way really. It is probing code, so
performance is not critical, but I'm obviously satisfied with how the
code looks now, or I would not have sent it.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
