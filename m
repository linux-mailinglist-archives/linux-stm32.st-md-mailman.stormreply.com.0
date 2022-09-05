Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 997645AD0DA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:57:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B4FDC640FE;
	Mon,  5 Sep 2022 10:57:40 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31CB8C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:57:38 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id j17so5855554qtp.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SceFooGsQvk4/DBXpk/M7nv2E1Tqfm+MkuaSRZ3qev8=;
 b=QgN1fKt4DP2kb7sAiv+5KFok8U8dxv0x5611ZTop3HKEETihbtz9RufJ5RUJvT6oy3
 NsDYXvFgWk/79gT0t031cWuTJ9+0anNKT0/QMVUymrmw27VD2+Q9Fvf/a4F1TUNnaeSG
 rqxNiZxP2226FfdS2mZJiVeLEcQ2F7NOQTCivGpJw3EJafbSCKZtnmajkVfO//JmwESc
 OQ+A5m2uZ9uWB9V0ddapJ9/fH/JlBtRhD0Pv/BF1sgrOUoMmJeKFvXNsijHb3izSghCC
 dWQbrWPcWtAWtUFpsLJaj3WsvtsNYlDXfe5EMqd/eXC/8JZqf2A/mHdQZ+FdhXMyXOQX
 cbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SceFooGsQvk4/DBXpk/M7nv2E1Tqfm+MkuaSRZ3qev8=;
 b=5celbDmGmEHJv/JYhs/QPQBHlu78OWrWYHckSYwCSwi6X8wdz9UW6EunudkofuX88t
 geu+thMAvOV2z6StritdebQfLMPF4ulx424dVA7iBYoKv3dsRp5p1/XI16uNH+qA+mcA
 BTKEp0z/qk4qUQ+p1ChOVO4jW0uHQ4xVwTiAiAYRO3GWLDHEP7O3zzwjWU5B0KGJgmng
 KUeOXss3iHQjjLwxj7h9F5UGPUI0xQlQaRilSbw/IIDUDBljMP/M99LwJ94f4spkDHPv
 evzzwD5F5tD3Leg8DhqOLXuqNTactP1zO7cSPyCykFlKLih2plbDYFDCGpwidez35iMJ
 anXw==
X-Gm-Message-State: ACgBeo3wiwJCR0TRHCnGcHTd6GxDJREeRZ0deRKz/PteEg5qptm7A1G7
 yVoInWRvhE3bH5dMo3EFAwY/cUFlUMJMVnBuBP0=
X-Google-Smtp-Source: AA6agR60W0s2Xg2TAEJ7W+zD52eGjGAMZEZ33WklScUG5wc6dHREuBxFFHnQsCibmN0jWps5VKuSjG68kRfEhV6Vu4I=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr39279991qtx.481.1662375457185; Mon, 05
 Sep 2022 03:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:57:01 +0300
Message-ID: <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
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

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API.

> It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.

I would remove this sentence from all commit messages since it's a
debatable thing and might even not happen, so the above is a pure
speculation.


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
