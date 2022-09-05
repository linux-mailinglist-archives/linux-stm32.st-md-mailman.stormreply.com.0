Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F35525AD39E
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 15:19:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE16C55596;
	Mon,  5 Sep 2022 13:19:32 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D75F2C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 13:19:30 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id by6so9203458ljb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date; bh=pGQesGh0xflxM2NNiwrV3vQAVchzpYhzdahDdSNlBVo=;
 b=aEV1rqBvjxeacCvbFAd75H8X+CLchRyr/9zk9hD5i+6fjI5goF+z+vIzX1EGx55/p9
 IfgVdpjG1lFai91AKbjODKz/lHpxARajtjO0/XKEwTClgiAl+jHg1q1ZtcTqJSaZrYig
 kR3nTls+hkJUs4NpQl2JVkq0vuRSRbe2NpaIwzLJ3K0lc2PYHZIJgtnpLxVkCAdOdqcg
 ifK8uUxAARVYld1UXOrpCEvf1+8Q58EAJpFgdgBI0Ykb1k2J1j5CvEJW09aSZVHcvkGr
 fxrI6jqgvxBr8C13oZ4g0Qi71fqmPNdwqufFP+tdxrdtH88X4uGtw6Kli6+zcfTbP5V8
 zGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pGQesGh0xflxM2NNiwrV3vQAVchzpYhzdahDdSNlBVo=;
 b=zcQeZXQjTzeYvWM/vEPX/TMpJ8OuTf/Nmf9bxL+k3xDhyAH+UyUmTj8vCi45kRFOz5
 8Z181MntGjF2S+KcKlFeBgyXQa9rbSiHLvNKaV4nOpAxlVIwskyMFSWkIZGST6URrR29
 w72Sn7oV4BWgH1rkzUAZiIZj1GzLLVoLqSqwMfFYiJ4QwbmMg/G608fpP4ryQrXGGX8r
 WCNXi+Mdc7A82aPtwgEDH9HAm3FvtGkFq2xjrTN+WYQBEQW1ryd34FZYkrMfvOw3yIdj
 dTGWWLRkJk1IO9Km0K8SWG5YgGdTJCrbItzZo1lMkKKTQaEkFLNAA+ykRRTvhvJuFRPa
 vzSA==
X-Gm-Message-State: ACgBeo1g0Hzr5qEQwOHnb39C0mgUJ4jkY6yc+a9A2lf1vb8XJryEJTJu
 kvY7JRI9EkdmWLxzqEBwswA=
X-Google-Smtp-Source: AA6agR6wIqHobJs4RjQ5AZ5zLGEJ30t4jOYW4FD1Y52S1XDgSMO7S1BLZYEyclCz9BqREtsj5+Cabg==
X-Received: by 2002:a05:651c:54c:b0:25f:dd42:5d06 with SMTP id
 q12-20020a05651c054c00b0025fdd425d06mr15535256ljp.161.1662383969981; 
 Mon, 05 Sep 2022 06:19:29 -0700 (PDT)
Received: from [172.16.194.195] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c128b00b00261e8f25460sm1409150ljc.14.2022.09.05.06.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 06:19:29 -0700 (PDT)
Message-ID: <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
Date: Mon, 5 Sep 2022 16:19:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
 <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/5/22 13:40, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
>> so that gpiolib can be cleaned a bit, so let's switch to the generic
>> fwnode property API.
>>
>> While at it switch the rest of the calls to read properties in
>> bd957x_probe() to the generic device property API as well.
> 
> With or without below addressed,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
>> index aa42da4d141e..393c8693b327 100644
>> --- a/drivers/regulator/bd9576-regulator.c
>> +++ b/drivers/regulator/bd9576-regulator.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>   #include <linux/regulator/driver.h>
>>   #include <linux/regulator/machine.h>
>>   #include <linux/regulator/of_regulator.h>
>> @@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
>>          }
>>
>>          ic_data->regmap = regmap;
>> -       vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
>> -                                        "rohm,vout1-en-low");
>> +       vout_mode = device_property_read_bool(pdev->dev.parent,
>> +                                             "rohm,vout1-en-low");
> 
> They all using parent device and you may make code neater by adding
> 
>    struct device *parent = pdev->dev.parent;

This is a matter of personal preference. I prefer seeing 
pdev->dev.parent - as it is more obvious (to me) what the 'pdev' is than 
what 'parent' would be.

I'd use the local variable only when it shortens at least one of the 
lines so that we avoid splitting it. After that being said - I'm not 
going to argue over this change either if one who is improving the 
driver wants to use the "helper" variable here.

Best Regards
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
