Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE95AD5D2
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 17:13:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2152C55596;
	Mon,  5 Sep 2022 15:13:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 995C1C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 15:13:56 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so5230790pjp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=BaV7TSh2pF8riJo3FYVJlB4Fd0IV89ZBF58eyTHpzCY=;
 b=hkkpU5LscmWAGSEo3MfEtadx9VW4xDHJEup50A1r2cVLlq4cuETMEDvzQMWJ+25cub
 uKJeKBqoA/7oOn5M03KfF2SrWzMp8y/6jxlU6IOGtXhf5NBV25gS8epBm0aJ0S2QGuaI
 RjUYEWJv07AS8q77FSCkemAnzO0cF5SSPIB8vUM+JQ9+01vDbgKIvCwDLFJ0pxGW/o9D
 wfMCMCN77OXaTjmH8xcwvQmxfsPP25DPJzASvB1sg54cKUVgwF0SrI+mVebrCUQXQcEH
 UD6AosLEX29RH6M8jzXceVG7LBfIA3BiQKPCSDkkI0IwATFYFoPoughaGzGm0KCEERIH
 sz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=BaV7TSh2pF8riJo3FYVJlB4Fd0IV89ZBF58eyTHpzCY=;
 b=tkK01lUiZq0iZdk/kCY0I4ZDSet2YinZvCVHu6dv7ZqROrZWpu9V8f+iJVdTeow6bl
 o85P6jq2xNWQMY+Ylxbiy9RxbBpnNbuDMaa3dHXsyGQB2Mgw2VYUTNgDhdyAvgR0W44i
 OY4WLjAm5nh5eAhzPYaptWfTQhvswyJRtL62UhudOw3Mv7mDTiYDUQfkVLNj6Shvldqe
 myZl79icSdoJ7ly6+hQJoLRtmGa6F8Zj4ssciw5xr8roEn1AfC8yZUV2fJ9xOgRTxXDA
 mNAc1qUEY7/3CA1pNBbBFurY32miWC1x4+wA0fLdq19GvbOHRxYRZOlSIwQlhGOgQKFN
 tLHg==
X-Gm-Message-State: ACgBeo1G4OpFXo1umw6Z5WtOcHiz+W/j1eg4gnsWmM2lShDzOp3xYZCI
 wyPXQehe1fmM5bnwGeP2M7E=
X-Google-Smtp-Source: AA6agR759HBK1+PQYcZT7IJSAKYI4KNMvzd+GSuzCkEXpLGsOPIUySqoQ8VGjyqne3MH/nAfFroOyA==
X-Received: by 2002:a17:90b:164f:b0:1f5:4ced:ed81 with SMTP id
 il15-20020a17090b164f00b001f54ceded81mr19722762pjb.122.1662390835165; 
 Mon, 05 Sep 2022 08:13:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a170903124f00b00176ba091cd3sm1684281plh.196.2022.09.05.08.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:13:48 -0700 (PDT)
Message-ID: <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
Date: Mon, 5 Sep 2022 08:13:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
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
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/5/22 04:09, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
>> so that gpiolib can be cleaned a bit, so let's switch to the generic
>> fwnode property API.
>>
>> While at it switch the rest of the calls to read properties in
> 
> it, switch
> 
>> bd9576_wdt_probe() to the generic device property API as well.
> 
> ...
> 
>>          struct device *dev = &pdev->dev;
> 
> struct device *parent = dev->parent;
> 
> can make your code slightly neater.
> 
> ...
> 
>> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
>> +       if (count < 0 && count != -EINVAL)
>> +               return count;
>> +
>> +       if (count > 0) {
> 
>> +               if (count > ARRAY_SIZE(hw_margin))
>> +                       return -EINVAL;
> 
> Why double check? You may move it out of the (count > 0).
> 

Two checks will always be needed, so I don't entirely see
how that would be better.

> ...
> 
>> -       if (ret == 1)
>> -               hw_margin_max = hw_margin[0];
> 
>> +               ret = device_property_read_u32_array(dev->parent,
>> +                                                    "rohm,hw-timeout-ms",
>> +                                                    hw_margin, count);
>> +               if (ret < 0)
>> +                       return ret;
> 
> So, only this needs the count > 0 check since below already has it implicitly.
> 
Sorry, I don't understand this comment.

Guenter

>> -       if (ret == 2) {
>> -               hw_margin_max = hw_margin[1];
>> -               hw_margin_min = hw_margin[0];
>> +               if (count == 1)
>> +                       hw_margin_max = hw_margin[0];
>> +
>> +               if (count == 2) {
>> +                       hw_margin_max = hw_margin[1];
>> +                       hw_margin_min = hw_margin[0];
>> +               }
>>          }
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
