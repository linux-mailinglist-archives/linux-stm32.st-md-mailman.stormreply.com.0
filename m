Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DBF5AD6D9
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 17:50:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCB2BC55596;
	Mon,  5 Sep 2022 15:50:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86C45C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 15:50:04 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so8956620pji.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date;
 bh=3XrVUU9T8R4LO8OA1f5h+alUXAX2S0TQoRT3c9Li0zE=;
 b=fb+biuem+7b7djICmUqeW/BHTeNp/mSIkZ0RvN2SXnaFs/5YyeMU+evecpiT94v82W
 Wxfn0CSNmSmyFNdPp1gzvwV0fM9AjmN0MOmTdZboebJPVCoX17sG9lmzebM9ao53ceUW
 yVd7msO4mdC3TWp+151flO1HCijMCEaMLiYb6sFX8Glvs7ZTTgoL3lCtGTKQ7fyXm+Gg
 pHh/glh3NMkFwNQZT6QZHQG62OtYie95f/rnYvvh4Y8aPOmfyT9Ar+2EHwInZ1j+1+j+
 Oy+Ig/euXQdz3oHAXN56OD5BQH1j8orR8xHQaKEnUQLjJ5W8lICDNDnwnI3x7eyp41JE
 4G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3XrVUU9T8R4LO8OA1f5h+alUXAX2S0TQoRT3c9Li0zE=;
 b=yw6Les9jNGWeC+X8JTlDX9D4FeW1QC2I4yAjUpmM3SCcQoFLMRDaT0xXpCl2PRsYc1
 7rokteL41brddD4pwseKmFITPDKrUuCNr+tloAm12wOnxqETEgfbyY85JwzfVPepWFKv
 Ss+OKuTJxabEpgKgd4gHdYhRERYBFbI2cpbPyH153na2t7apnywDCicqhyS1zm3gWKYE
 N4bx9w8XCWlFfo6/ldcurSdPjO5oS5RBKDWj07MgKNXH23nHvjVR35nme1Z7SJhloABz
 sc64Jmxn9ptiCUIoeZTodOcCevIlVRU58Ou5v64zAFCHdUjC5QQ2DwgH2QEL+iOSVc9n
 VrRA==
X-Gm-Message-State: ACgBeo3idCfUg2CbGOdW4kG2dLAcpvi2rGfBb8t/IxZ0qD/Y9dVimVkM
 job/wHdwdqbDl6MdO8oMoKg=
X-Google-Smtp-Source: AA6agR5VS25L+Z4dRUGvyFsOt5wkYCTLrQ7nt81wIVLfBBuODfZGLGcvsv14A7LgAxNP1Gl1OohTXw==
X-Received: by 2002:a17:90a:c706:b0:1fd:e21e:7cb1 with SMTP id
 o6-20020a17090ac70600b001fde21e7cb1mr20626775pjt.234.1662393003052; 
 Mon, 05 Sep 2022 08:50:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090a348100b001faa4a6691asm10512410pjb.30.2022.09.05.08.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:50:01 -0700 (PDT)
Message-ID: <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
Date: Mon, 5 Sep 2022 08:49:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
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

On 9/5/22 08:21, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 9/5/22 04:09, Andy Shevchenko wrote:
>>> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
>>> <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
>>>> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
>>>> +       if (count < 0 && count != -EINVAL)
>>>> +               return count;
>>>> +
>>>> +       if (count > 0) {
>>>
>>>> +               if (count > ARRAY_SIZE(hw_margin))
>>>> +                       return -EINVAL;
>>>
>>> Why double check? You may move it out of the (count > 0).
>>
>> Two checks will always be needed, so I don't entirely see
>> how that would be better.
> 
> But not nested. That's my point:
> 
> if (count > ARRAY_SIZE())
>    return ...
> if (count > 0)
>    ...
> 

The old code has either 1 or two checks if there is no error.
Your suggested code has always two checks. I don't see how that
is an improvement.

>>>> -       if (ret == 1)
>>>> -               hw_margin_max = hw_margin[0];
>>>
>>>> +               ret = device_property_read_u32_array(dev->parent,
>>>> +                                                    "rohm,hw-timeout-ms",
>>>> +                                                    hw_margin, count);
>>>> +               if (ret < 0)
>>>> +                       return ret;
>>>
>>> So, only this needs the count > 0 check since below already has it implicitly.
>>>
>> Sorry, I don't understand this comment.
> 
> if (count > 0) {
>    ret = device_property_read_u32_array(...);
>    ...
> }
> if (count == 1)
>   ...
> if (count == 2)
>   ...
> 
> But here it might be better to have the nested conditionals.
> 

We know that count is either 1 or 2 here, so strictly speaking
	if (count == 1) {
	} else {
	}
would be sufficient. On the other side, that depends on ARRAY_SIZE() being
exactly 2, so
	if (count == 1) {
	} else if (count == 2) {
	}
would also make sense. Either way is fine with me. I'll leave it up
to Dmitry to decide what he wants to do.

Thanks,
Guenter

>>>> -       if (ret == 2) {
>>>> -               hw_margin_max = hw_margin[1];
>>>> -               hw_margin_min = hw_margin[0];
>>>> +               if (count == 1)
>>>> +                       hw_margin_max = hw_margin[0];
>>>> +
>>>> +               if (count == 2) {
>>>> +                       hw_margin_max = hw_margin[1];
>>>> +                       hw_margin_min = hw_margin[0];
>>>> +               }
>>>>           }
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
