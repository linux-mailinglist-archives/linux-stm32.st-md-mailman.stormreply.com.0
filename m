Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9A5AD12F
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 13:09:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31844C0C920;
	Mon,  5 Sep 2022 11:09:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A19F6C55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 11:09:46 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id u5so1861495qvv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZD4YC1HXrtSaQEFJiBqrgz0UPEGxSAaPa+lNAJ8WZi0=;
 b=W0LYg/x6oLLMVr5A9MMBVb+TxN0pk4+3xuh3Q/ipfqH1hrq5kvR4C13ZGg+8+DEqSd
 gi1J5ByiQnS+4NrTCIvUT/kKaXn5hL9zW9YV18N0SnlPLU0irWOq7beGGmmV2it9I/V8
 TSz0IwHJZsNw1mnLJ+EmjO0aVsfTD6x8QeroaNTk/ISAjEimxSO9AuqJQS/RTnqxI8me
 UqWOiBI+Wn0HCU5QQ9nYXLzwM0PBRWriqZaCP3K1erw3D5FZR6d/x6x4b60TAHtECET6
 J6AxXbDHgN6gXzpMM9fNWwiGiQLT2KqoyWZt7c52eyHpDdJ+EY+BURgwhcI9q/0V9kVd
 TT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZD4YC1HXrtSaQEFJiBqrgz0UPEGxSAaPa+lNAJ8WZi0=;
 b=cPoCKA8USbjNl1liDWCnOt0stzfZQBkThmqSUWCM2jxkuATJIViPC95TrbA2F9fvrr
 dLh4DN6+jJ/MYLZpy0eRo7n3h81GO3W/z/y7TGVWOJOkRO+JHwfglBRqmqIsKCG0gfaD
 QY0ncpA7zlhYZ8uw37Tt08TWvV8P8KlZdddwvRI3a/+EZZKrpKx7uhB8JS7Upf5Uuq7r
 ceBRo9i2no4uSEv0/d/geK82BsUjiqFvAfAu1ykYwxBzuHnMsTZa9D64UMTZcz8smqoU
 //4fn9ugJkgIJTQXDbuX4ZoCGqg1XmQkRlm9dqY9mRrRdvA6Oys0+gPIAWLT7RMikPEd
 l2zg==
X-Gm-Message-State: ACgBeo3UpXsmHf3Pt0KlEiB9iiNjiLGjIEaNsVgbnAkUsGUAV2ePKbDN
 PySdAPls9nbjrDWJsxPYwSUVILJJyhdMA2Jf6mU=
X-Google-Smtp-Source: AA6agR5jCq5/GjKb+apw06fa/2t9tC05H0ZPM5KdsjnljOtEm1B4hEVBpVM1iH3NQHKg14ReUnIBjf+3AuFTQfBZ7lg=
X-Received: by 2002:a0c:e24b:0:b0:4a1:d41b:e280 with SMTP id
 x11-20020a0ce24b000000b004a1d41be280mr5474897qvl.11.1662376185481; Mon, 05
 Sep 2022 04:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 14:09:09 +0300
Message-ID: <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
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

On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in

it, switch

> bd9576_wdt_probe() to the generic device property API as well.

...

>         struct device *dev = &pdev->dev;

struct device *parent = dev->parent;

can make your code slightly neater.

...

> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> +       if (count < 0 && count != -EINVAL)
> +               return count;
> +
> +       if (count > 0) {

> +               if (count > ARRAY_SIZE(hw_margin))
> +                       return -EINVAL;

Why double check? You may move it out of the (count > 0).

...

> -       if (ret == 1)
> -               hw_margin_max = hw_margin[0];

> +               ret = device_property_read_u32_array(dev->parent,
> +                                                    "rohm,hw-timeout-ms",
> +                                                    hw_margin, count);
> +               if (ret < 0)
> +                       return ret;

So, only this needs the count > 0 check since below already has it implicitly.

> -       if (ret == 2) {
> -               hw_margin_max = hw_margin[1];
> -               hw_margin_min = hw_margin[0];
> +               if (count == 1)
> +                       hw_margin_max = hw_margin[0];
> +
> +               if (count == 2) {
> +                       hw_margin_max = hw_margin[1];
> +                       hw_margin_min = hw_margin[0];
> +               }
>         }

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
