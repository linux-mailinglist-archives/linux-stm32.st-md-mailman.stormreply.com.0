Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E259D5ADB14
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 00:07:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86B58C640F0;
	Mon,  5 Sep 2022 22:07:55 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2606BC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 22:07:54 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id r12so348241pfl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 15:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date;
 bh=DI+EGf5Iiw4yLnQOM0iLSEUhYarB1qtVETYwX3ATTlI=;
 b=KDxaSPeOmIAHodHZoxO7+rPppr+0nc84E7WjJr09aHXf0y70VUqQeiGwM4ZbMT1+IG
 aswpW6qIia4RuP0oy/zixSqOkdUMGcBdQBZ+zCXrSbs5gzJjxQbyCJKm+qaEmHP0fbLr
 p+VnLtgDb/UqRnZ5jH6rY49caFH+X+TV7pDArSwV7zY/jQ9Qvi10MQT7HP3yHqCz6Ymq
 3ER0a2FyOYkl9+aJiUSNvNKZnQFKEXdO6qjVPIArqiSCS2eFf74FcrePSlFKeiFjZiPh
 a3swNk1c3KCQbDFwBwgMcHrg1CM/Xc0KnXfSUNi2LqKeA1gvQb715UJnDwV5eFIZMn4E
 JSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DI+EGf5Iiw4yLnQOM0iLSEUhYarB1qtVETYwX3ATTlI=;
 b=mFiEONUmQ8dSCLtfVaGs/oPDMwHphxAntkrDmFMLr7ldcEB2kgpNlGCaYMywCoz73M
 IvpJyKAnbyqBBkzwJJxndIM5v3DTGLlW6uaRhrkcD6GrK9iJ6RrrztgpWj2x0PuT7+3N
 cupDinENxV0zyCyNrtzmEM+z9QOeuUKtcIYoQVk9UJmRscOwTXiPHbTKvVo+j5BEGZyf
 aVMMrq/xaRur46TnzX3rqJ8eaiC2tztZEXiur5dZ9ND+fOnJV7GvEFvNwknVrG691KRM
 eCfwdEtqGsEUY7pTWAaPcgjsexsFAbs8NdiuFvCOOyDpKpU5j1mT1Y2XwW85khirVsYO
 7baw==
X-Gm-Message-State: ACgBeo0Vw+EPyeX5GYbUrXLUy6N6ldApwqYxchLs+AuD601HS/piRTAf
 jL5oohwAWrQ1XVanw6Wp2XY=
X-Google-Smtp-Source: AA6agR5VFvTDdUbzbYgkiV1tQs8QlnywRsbF0wBwVMI81k5tziGUND19h0NyYI/NQTVei/R57vjcgw==
X-Received: by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr41816293pgs.502.1662415672598; 
 Mon, 05 Sep 2022 15:07:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a170902db1000b00172dd10f64fsm8157821plx.263.2022.09.05.15.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 15:07:51 -0700 (PDT)
Message-ID: <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
Date: Mon, 5 Sep 2022 15:07:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
 <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/5/22 12:55, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>> On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
>>> On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
>>> <dmitry.torokhov@gmail.com> wrote:
>>>> On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
>>>>> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
>>>>> <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
>>>>>> -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
>>>>>> -                                                   "nvidia,phy-reset-gpio",
>>>>>> -                                                   0, GPIOD_OUT_HIGH,
>>>>>> -                                                   "ulpi_phy_reset_b");
>>>>>> +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
>>>>>> +                                      GPIOD_OUT_HIGH);
>>>>>>                  err = PTR_ERR_OR_ZERO(gpiod);
>>>>>
>>>>> What does _OR_ZERO mean now?
>>>>
>>>> This converts a pointer to an error code if a pointer represents
>>>> ERR_PTR() encoded error, or 0 to indicate success.
>>>
>>> Yes, I know that. My point is, how is it useful now (or even before)?
>>> I mean that devm_gpio_get() never returns NULL, right?
>>
>> What does returning NULL have to do with anything.
> 
> It has to do with a dead code. If defm_gpiod_get() does not return
> NULL, then why do we even bother to check?
> 

PTR_ERR_OR_ZERO() converts into an error code (if the pointer is an
ERR_PTR) or 0 if it is a real pointer. Its purpose is not to convert
NULL into 0, its purpose is to convert a pointer either into an error
code or 0. That is what is done here, and it is done all over the place
in the kernel. I don't see your problem with it. Care to explain ?

>> It converts a pointer
>> to a "classic" return code, with negative errors and 0 on success.
>>
>> It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
>> IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).
> 
> I don't see how this is relevant.
> 

You lost me. Really, please explain your problem with PTR_ERR_OR_ZERO().

Thanks,
Guenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
