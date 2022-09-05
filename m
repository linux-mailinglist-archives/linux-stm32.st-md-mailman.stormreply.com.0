Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F35865ADB24
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 00:09:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3825C640F0;
	Mon,  5 Sep 2022 22:09:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7CA7C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 22:09:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q15so9556914pfn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 15:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=7X66Mhu89Nd1JC1tC2C3GiFsxMesGQdlZVFrlo9aYm8=;
 b=b7jRxWPyK0Rq4w8FR9ZFdzOAagpu8Ly97+vIsJC3Zr3BYQL9lMVB+ShDYBZ2D8gDRn
 iG42XCqTvMR/etwnUxtVq4dc6kjBUmYkBG8G+Uq0g4SiQD+aD7FdS44c68HxkrxInjmX
 rQwIEiXivv7vBIj5Sf8Y65QbFkdKpO+b+xgFODtb9auHWLSyyRIc9buVgrGAtV6dAmSk
 vw5WAxq8xcLg9s7lPX4OmewpOzfHhIQkLGIRLhUtapokGcK0j0Egcpyqr1AShiOI+SGy
 eWqxW4Icxyq7dn3JsNejnG/2tlPR6tqehYrDr8AxyduISs7Ol7B5gyVkSMCzO9kplR/h
 RRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=7X66Mhu89Nd1JC1tC2C3GiFsxMesGQdlZVFrlo9aYm8=;
 b=gj1YS23CWSt4NCBL1sgb+ebVurMBNScEF8UCwF8Mh4rGfj0p1rSxDmnDXupSwdewcF
 zmSUiL7mEaSRoo/ed0KcNsTRFfgaqDfFvlcWWICchEIeHxGaYn0XKbyQaioDSaml0Cf0
 WZxtqy3fAEIazmr+3U0VgsKQR5am2jKGrT9siPC8qm9IMBkllaHmVqxtGUHTx3vR1dFL
 kFg8oiudOD7i8Lx2k+hXubxbob0KIPiiRfJnXcK/+EzKRktKSNy66TbRjfMVkyUhPQXu
 jgNMeP9CfXN7ZS3g62jns1w6IUus8qVDIZjOJHsNq2Kwenvh5xhx6GFxQ8PQU5mh+ZWj
 VUAw==
X-Gm-Message-State: ACgBeo2KdnLOur+9AiYU/fSW1NVRwOTQbAB87NwzuZ7XP8erNZRsrdgX
 pwpNtIh05b+lCZ1D3plB3ek=
X-Google-Smtp-Source: AA6agR6Eea0J+fyHn4cnB8pX01mZJQu8GcEqrT2a0QWMcFiUqA9q20U0tI3FWNDXq+ZYzlcm5H9Qbw==
X-Received: by 2002:a63:6e09:0:b0:430:663:7757 with SMTP id
 j9-20020a636e09000000b0043006637757mr24953820pgc.340.1662415749460; 
 Mon, 05 Sep 2022 15:09:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a170902ce8900b00176b8f587efsm2127192plg.148.2022.09.05.15.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 15:09:08 -0700 (PDT)
Message-ID: <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
Date: Mon, 5 Sep 2022 15:09:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
 <YxZSUlCPEE9o/s4G@google.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YxZSUlCPEE9o/s4G@google.com>
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

On 9/5/22 12:47, Dmitry Torokhov wrote:
[ ... ]
>> We know that count is either 1 or 2 here, so strictly speaking
>> 	if (count == 1) {
>> 	} else {
>> 	}
>> would be sufficient. On the other side, that depends on ARRAY_SIZE() being
>> exactly 2, so
>> 	if (count == 1) {
>> 	} else if (count == 2) {
>> 	}
>> would also make sense. Either way is fine with me. I'll leave it up
>> to Dmitry to decide what he wants to do.
> 
> My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
> do not have strong preferences either way really. It is probing code, so
> performance is not critical, but I'm obviously satisfied with how the
> code looks now, or I would not have sent it.
> 

Good point.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
